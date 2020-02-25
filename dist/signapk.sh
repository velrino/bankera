rm -rf dist/app.apk
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore dist/velrino.keystore build/app/outputs/apk/release/app-release.apk  velrino
#zip -d   build/app/outputs/apk/release/app-release.apk META-INF/\*
zipalign -v 4 build/app/outputs/apk/release/app-release.apk dist/app.apk
apksigner sign --ks dist/velrino.keystore --ks-key-alias velrino dist/app.apk