# android-builder
Build tools for Android

using the base version directly:

Mount the android project into `/src/`, install the sdk version, and run gradle commands:

```
docker run --rm -i -v $(pwd):/src/ pretorh/android-builder:base sh << EOF
sdkinstaller.sh "platforms;android-27" "build-tools;27.0.3" "platform-tools"
gradle bundleRelease
EOF
```

use the sdk-specific versions:

Mount the android project into `/src/`. change the command if needed

```
docker run --rm -t -v $(pwd):/src/ pretorh/android-builder:27
```
