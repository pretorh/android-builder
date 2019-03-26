#!/usr/bin/env bash
set -e

echo "accepting licenses"
yes | "$ANDROID_HOME/tools/bin/sdkmanager" --licenses

echo "installing $@"
"$ANDROID_HOME/tools/bin/sdkmanager" $@
