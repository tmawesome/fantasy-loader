#!/bin/bash

# move to project root
cd $( dirname "${BASH_SOURCE[0]}" )/../

pdo="credentials/pdo.php"

rm $pdo

if [ "$1" == "enable" ]; then
	ln -s tmawesomedbo.pdo.php $pdo
	git update-index --skip-worktree $pdo
else
	ln -s tmptmawesome.pdo.php $pdo
	git update-index --no-skip-worktree $pdo
fi
