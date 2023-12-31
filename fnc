#!/bin/bash

case $1 in
  "new")
   echo "create new"
   cp content/template "content/$2.md"
   nano "content/$2.md"
   ;;
  "serve")
   blag serve
   ;;
  "git")
   echo "save to github"
   git add .
   git commit -m "update"
   git push
   ;;
  "publish")
   echo "publish"
   blag build
   surge build/ --domain https://nurblog.surge.sh
   ;;
  "list")
   ls content
   echo "write name file to open:"
   read file
   nano "content/$file.md"
   ;;
  *)
   echo "command:"
   echo ". fnc new <name>"
   echo ". fnc serve"
   echo ". fnc git"
   echo ". fnc publish"
   echo ". fnc list"
   ;;
esac
