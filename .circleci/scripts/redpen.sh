#!/bin/sh
redpen --lang ja --format markdown --limit 0 --conf redpen-conf-ja.xml curriculum/*/*.md > redpen.log || \
EXIT_CODE=$?

sed -i'' -e 's$^$curriculum/$' -e '$d' redpen.log

cat redpen.log | bin/reviewdog -reporter=github-pr-review \
  -diff='git --no-pager diff origin/master' \
  -efm='%f(%l,%c): %m' \
  -name=RedPen

exit ${EXIT_CODE}
