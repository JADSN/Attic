#!/bin/bash

USER_AGENT="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/57.0.2987.98 Chrome/57.0.2987.98 Safari/537.36"
SITE=$1

wget --user-agent="${USER_AGENT}" -e robots=off -c "${SITE}"
