#!/bin/bash

if [[ "$1" == "" ]]; then
  /bin/bash
else
  /usr/local/bin/aws "$@"
fi