#! /usr/bin/env sh
# Setup
F=$(mktemp)
trap 'cat "$F"; exit' EXIT
export YQ="go run github.com/mikefarah/yq/v4@v4.35.2"
cat - > "$F"
# General Patches
$YQ -i '.info.title = "{{ cookiecutter.cloud_provider }} Provider"' "$F"
