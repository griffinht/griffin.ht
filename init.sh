#!/bin/bash
set -e

# install html-minifier
if ! command -v html-minifier; then
  if [[ $(id -u) -ne 0 ]]; then
            npm install html-minifier -g;
        else
          sudo npm install html-minifier -g;
        fi;
fi;