#!/bin/bash

TINYPROXY_CONF=/etc/tinyproxy/tinyproxy.conf

function update_conf() {
	local names=()
	local values=()
	while read -r VAR; do
  		name=$(echo "$VAR" | sed -r 's/TINYPROXY_(.*)=.*/\1/g')
  		names+=($(echo ${name} | sed -r 's/_[0-9]+$//'))
    	values+=("$(echo "$VAR" | sed -r "s/.*=(.*)/\\1/g")")
	done <<< "$(env | grep ^TINYPROXY_ | sort)"
	local name=""
	for i in ${!names[@]}; do
		if [[ "${name}" != "${names[i]}" ]]; then
			name=${names[i]}
	    	local line_nums=($(egrep -i -n "^#?${name} " ${TINYPROXY_CONF} | cut -d: -f1))
	    	local line_num=${line_nums[0]}
		   	real_name=$(sed -n "${line_num},${line_num}p" ${TINYPROXY_CONF} | sed -r "s/^#?(${name}).*$/\1/i")
		   	# Delete all existing lines
	    	for j in $(echo ${!line_nums[@]} | rev); do
	    		sed -e "${line_nums[j]}d" -i ${TINYPROXY_CONF}
	    	done
		fi
		sed "${line_num}i${real_name} ${values[i]}" -i ${TINYPROXY_CONF}
		line_num=$((${line_num} + 1))
	done
}

update_conf

/usr/bin/tinyproxy -d