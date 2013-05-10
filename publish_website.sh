#!/usr/bin/bash
git update-ref refs/heads/master $(echo "$1" | git commit-tree source^{tree}:_site -p $(cat .git/refs/heads/master))
git push origin master
