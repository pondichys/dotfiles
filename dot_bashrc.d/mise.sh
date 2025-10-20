#!/usr/bin/env bash

# Setup of mise-en-place to enable to find tools in rc file
# See https://mise.jdx.dev/dev-tools/shims.html#zshrc-bashrc-files for more info
if command -v mise &> /dev/null
then
	eval "$(mise activate bash)"
	eval "$(mise hook-env -s bash)"
fi
