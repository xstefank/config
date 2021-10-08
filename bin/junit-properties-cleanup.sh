#!/bin/bash

set -eo pipefail

readonly input=$1

function removeAttribute() {
  sed -i "s/ $1=\"[^\"]*\"//" "$input"
}

function removeLinesWithTag() {
  sed -i "/<$1/d" "$input"
  sed -i "\#</$1#d" "$input"
}

removeAttribute "xmlns:xsi"
removeAttribute "xsi:noNamespaceSchemaLocation"

removeLinesWithTag "properties"
removeLinesWithTag "property"
