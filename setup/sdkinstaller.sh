set -e

echo "installing $@ (accepting terms)"
yes | ./tools/bin/sdkmanager --install $@
