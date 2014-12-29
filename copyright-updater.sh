#!/bin/sh

REGEX="Copyright (c)"
NEW_YEAR=2015

YEAR_REGEX="\([0-9]\{4\}\)"
OLD_REGEX_1="Copyright (c) ${YEAR_REGEX} "
OLD_REGEX_2="Copyright (c) ${YEAR_REGEX}-${YEAR_REGEX} "
NEW_REGEX="Copyright (c) \1-${NEW_YEAR} "

# stupid deprecation warning on my machine. Gotta figure this out ASAP
unset GREP_OPTIONS

for dir in $@; do
  if [ -d "$dir" ]; then
    license=$(find $dir -maxdepth 1 -type f -name "LICENSE*")
    if [ -f "$license" ]; then
      sed -i "s/${OLD_REGEX_1}/${NEW_REGEX}/g" $license
      sed -i "s/${OLD_REGEX_2}/${NEW_REGEX}/g" $license

      echo "Updating LICENSE file on $dir"
      (cd "$dir" && git add LICENSE* && git commit -m 'LICENSE file updated for 2015. Happy new year :christmas_tree:' && git push)
    else
      echo "$dir has no LICENSE file. You should add one :("
    fi
  fi
done
