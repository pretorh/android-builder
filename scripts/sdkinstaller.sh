#!/usr/bin/env bash
set -e

echo "accepting licenses"
yes | "$ANDROID_HOME/cmdline-tools/bin/sdkmanager" --sdk_root="${ANDROID_HOME}" --licenses

echo "installing $*"
"$ANDROID_HOME/cmdline-tools/bin/sdkmanager" --sdk_root="${ANDROID_HOME}" "$@"
