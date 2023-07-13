#!/bin/bash

if [ -z "$1" ]
then
      echo "Source repo is empty"
	  echo "Usage: migrate-repository.sh <source-repo> <clone-dir> <target-repo>"
	  exit
fi

if [ -z "$2" ]
then
      echo "Clone dir is empty"
	  echo "Usage: migrate-repository.sh <source-repo> <clone-dir> <target-repo>"
	  exit
fi

if [ -z "$3" ]
then
      echo "Target repo is empty"
	  echo "Usage: migrate-repository.sh <source-repo> <clone-dir> <target-repo>"
	  exit
fi

echo "============================"
echo "Source repo: \t$1"
echo "Clone dir:\t$2"
echo "Target repo:\t$3"
echo "============================"
echo ""

read -p "Proceed (y/n)? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "-----------------------"
	echo "git clone --mirror $1 $2"
	git clone --mirror $1 $2
	echo "-----------------------\n"

	echo "-----------------------"
	echo "cd $2"
	cd $2
	echo "-----------------------\n"

	echo "-----------------------"
	echo "git remote remove origin"
	git remote remove origin
	echo "-----------------------\n"

	echo "-----------------------"
	echo "git remote add origin $3"
	git remote add origin $3
	echo "-----------------------\n"

	echo "-----------------------"
	echo "git push --all"
	git push --all
	echo "-----------------------\n"

	echo "-----------------------"
	echo "git push --tags"
	git push --tags
	echo "-----------------------\n"

	echo "-----------------------"
	echo "cd .."
	cd ..
	echo "-----------------------\n"

	echo "-----------------------"
	echo "rm -rf $2"
	rm -rf $2
	echo "-----------------------\n"

	echo "-----------------------"
	echo "git clone $3"
	git clone $3
	echo "-----------------------\n"

	echo "-----------------------"
	echo "cd $2"
	cd $2
	echo "-----------------------\n"

	echo "-----------------------"
	echo "git config --list | grep remote"
	git config --list | grep remote
	echo "-----------------------\n"

fi
