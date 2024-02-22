#!/bin/sh

TOP=$(git rev-parse --show-toplevel)
HASH=$(git log --pretty=format:'%h' -n 1)

mkdir "${TOP}"/reports || true

git diff-tree \
--no-commit-id --name-only \
-r HEAD > "${TOP}"/reports/$HASH
