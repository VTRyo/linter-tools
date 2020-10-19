#!/bin/sh
prh --rules prh.yml --verify curriculum/*/*.md > prh.log || \
EXIT_CODE=$?

cat prh.log | bin/reviewlog -reporter=github-pr-review \
  -diff='git --no-pager diff origin/master' \
  -efm='%f(%l,%c): %m' \
  -name=prh

exit ${EXIT_CODE}
