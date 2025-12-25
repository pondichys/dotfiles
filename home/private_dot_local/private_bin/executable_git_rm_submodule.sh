#!/usr/bin/env bash

# Check if we are in a git repository
if [ -d .git ]
then
	module_name=$(gum input --placeholder="name of git submodule to delete")
	module_path=$(gum input --placeholder="path of the git submodule to delete")

	git submodule deinit -f "$module_path"
	git rm -f "$module_path"
	rm -rf ".git/modules/$module_path"
	git commit -m "\"chore: remove submodule $module_name\""
else
	tput setaf 1
	echo "Fatal: you are not in a git repository."
	tput sgr0
fi
