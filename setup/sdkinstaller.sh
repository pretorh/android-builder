set -e

echo "installing $@ (accepting terms)"
yes | $ANDROID_HOME/tools/bin/sdkmanager --install $@
