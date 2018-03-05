#!/bin/bash

if [[ -z $1 ]]; then
    echo "A title is required."
    exit 1
fi

_cwd=$(pwd)
_date=$(date +'%Y-%m-%d')
_postname=$(echo $1 | tr ' ' '-' | tr '[:upper:]' '[:lower:]')
_postpath="/blog/${_postname}"
_filename="${_postname}.md"
_filepath="${_cwd}/src/blog/${_filename}"

if [[ -f ${_filepath} ]]; then
    echo "File already exists."
    exit 1
fi

cat << EOF >| ${_filepath}
---
path: "${_postpath}"
date: "${_date}"
title: "${1}"
---
EOF

echo 'File created successfully.'

exit 0
