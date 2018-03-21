a=${KEY_FILE?"key store file not specified"}

# based on https://developer.android.com/studio/publish/app-signing.html#signing-manually and output
keytool -genkey -v -keystore $KEY_FILE -keyalg RSA -keysize 2048 -validity 10000
keytool -importkeystore -srckeystore $KEY_FILE -destkeystore $KEY_FILE -deststoretype pkcs12
rm -v $KEY_FILE.old
