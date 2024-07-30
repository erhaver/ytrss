#!/bin/bash
nbconfig="$HOME/.config/newsboat/urls"

if ! command -v -- shup > /dev/null 2>&1; then
  printf >&2 '%s\n' "\

    shup is required

    https://github.com/pystardust/shup
    "
  exit 1
fi

if [ -z "$1" ]
  then
    printf %s "\

      No link provided

      RUN:
      ytrss link [name]

      Example:
      ytrss https://www.youtube.com/@channel \"Cool Channel\"
      "
      exit 0
fi

link=$1
name=$2
rss=$(curl -s "$1" | shup "link[RSS]" | grep -Po '(?<=href=").+?(?=")')

[ -z "$link" ] && die "No link provided"

if grep -Fq "$rss" $nbconfig
then
    echo "$rss already in $nbconfig"
else
  if [ -z "$name" ]
  then
    rssstring="$rss Youtube"
    rssname="RSS"
  else
    rssstring="$rss Youtube \"~$name\""
    rssname="RSS \"$name\""
  fi  
    echo "$rssstring" >> $nbconfig
    echo "$rssname added to $nbconfig"
fi

