#!/bin/bash

shopt -s extglob

RELEASES_URL="https://releases.hashicorp.com/terraform/"

MAJOR_VERSIONS=()
UNIQ_MAJOR_VERSIONS=()
VERSIONS=()
STABLE_VERSIONS=()

function usage() {
	echo "Usage: $(basename $0) <all|major|stable|latest|major version>"
	echo "All:"
	echo "  Lists all versions."
	echo "Major:"
	echo "  Lists latest of each major version."
	echo "Stable is:"
	echo "  $(echo ${STABLE_VERSIONS[0]})"
	echo "Latest is:"
	echo "  $(echo ${VERSIONS[0]})"
	echo "Major version one of:"
	echo "  $(echo ${VERSION_PATTERN} | sed -r 's/\|/, /g')"
	exit 1
}


function get_versions() {
	local previous_major_version=""
	while read -r version_line
	do
		local version=$(echo "${version_line}" | sed -r 's/^.*\/terraform\/([^\/]+)\/.*$/\1/')
		local major_version=$(echo "${version}" | sed -r 's/^([0-9]+\.[0-9]+).*$/\1/')
		MAJOR_VERSIONS+=("${major_version}")
		if [[ "${major_version}" != "${previous_major_version}" ]]; then
			previous_major_version=${major_version}
			UNIQ_MAJOR_VERSIONS+=("${major_version}")
		fi
		VERSIONS+=("${version}")
		if [[ ! ${version} =~ (alpha|beta) ]]; then
			STABLE_VERSIONS+=("${version}")
		fi
	done < <(curl -sS ${RELEASES_URL} | egrep '<a href="/terraform/')
	VERSION_PATTERN="$(echo ${UNIQ_MAJOR_VERSIONS[@]} | sed 's/ /\|/g')"
}

function get_version() {
	local index=$1; shift
	local extra_tags=""
	if [[ "${VERSIONS[index]}" == "${STABLE_VERSIONS[0]}" ]]; then
		extra_tags="${extra_tags} stable"
	fi
	if [[ "${VERSIONS[index]}" == "${VERSIONS[0]}" ]]; then
		extra_tags="${extra_tags} latest"
	fi
	echo "${MAJOR_VERSIONS[index]} ${VERSIONS[index]}${extra_tags}"
}

function get_major_version() {
	local major_version=$1; shift
	for index in ${!MAJOR_VERSIONS[@]}; do
		if [[ "${major_version}" == "${MAJOR_VERSIONS[index]}" ]]; then
			get_version ${index}
			return
		fi
	done
}

get_versions

case "$1" in
	all)
		for index in ${!VERSIONS[@]}; do
			get_version ${index}
		done
		;;

	major)
		for index in ${!UNIQ_MAJOR_VERSIONS[@]}; do
			get_major_version ${UNIQ_MAJOR_VERSIONS[index]}
		done
		;;

	stable)
		echo ${STABLE_VERSIONS[0]}
		;;

	latest)
		echo ${VERSIONS[0]}
		;;

	@($VERSION_PATTERN))
		get_major_version $1
		;;

	*)
		usage
		;;
esac