#!/usr/bin/env bash

# Setup starship command prompt for bash
if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi
