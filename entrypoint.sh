#!/bin/sh -l

git config git-ftp.url $INPUT_URL
git config git-ftp.user $INPUT_USER
git config git-ftp.password $INPUT_PASSWORD

git ftp init

git-ftp push \
  --syncroot $INPUT_SYNCROOT \
  --user $INPUT_USER \
  --passwd $INPUT_PASSWORD \
  --remote-root $INPUT_REMOTEROOT \
  $INPUT_OPTIONS \
  $INPUT_URL
