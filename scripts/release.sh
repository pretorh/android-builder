set -e

APK=${1?"need path to unsigned apk file as first parameter"}
a=${KEY_FILE?"key store file not specified"}
a=${KEY_STORE_PASS?"key store password not specified"}
KEY_PASSWORD=${KEY_PASSWORD-$KEY_STORE_PASS}

[ ! -f $APK ] && (echo "apk file not found: $APK in $(pwd)" >&2 ; exit 1)
[ ! -f $KEY_FILE ] && (echo "keystore file not found: $KEY_FILE in $(pwd)" >&2 ; exit 1)

ANDROID_BUILD_TOOLS_VERSION=$(ls -1r $ANDROID_HOME/build-tools/ | grep -v '\-preview' | head -1)
BUILD_TOOLS_DIR=$ANDROID_HOME/build-tools/$ANDROID_BUILD_TOOLS_VERSION
echo "using build-tools $ANDROID_BUILD_TOOLS_VERSION from $BUILD_TOOLS_DIR"

NAME=$(echo "${APK%.*}" | sed -e 's#-unsigned##')
ALIGNED=$NAME-aligned.apk
SIGNED=$NAME-signed.apk

$BUILD_TOOLS_DIR/zipalign -v -p 4 $APK $ALIGNED
$BUILD_TOOLS_DIR/apksigner sign -v --ks $KEY_FILE --ks-pass pass:$KEY_STORE_PASS --key-pass pass:$KEY_PASSWORD --out $SIGNED $ALIGNED

echo "created: $SIGNED"
