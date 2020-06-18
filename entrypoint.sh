#!/bin/sh -l

git-ftp push \
  --syncroot $INPUT_SYNCROOT \
  --user $INPUT_USER \
  $INPUT_OPTIONS \
  $INPUT_URL
