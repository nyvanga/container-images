#!/bin/bash

function build_tag_and_push() {
  local major_version=$1; shift
  local version=$1; shift
  local image_tag="nyvanga/multitool-tf:${major_version}"
  docker build . --build-arg TERRAFORM_VERSION=${version} --file Dockerfile --tag ${image_tag}
  docker push ${image_tag}
  for tag in "$@"; do
    local extra_tag="nyvanga/multitool-tf:${tag}"
    docker tag ${image_tag} ${extra_tag}
    docker push ${extra_tag}
  done
}

while read -r VERSION_LINE
do
  build_tag_and_push ${VERSION_LINE}
done < <(./get-tf-version.sh major | egrep -v '0\.(1|2|3|4|5|6|7|8|9|10)\.')