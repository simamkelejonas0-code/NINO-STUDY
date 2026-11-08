#!/bin/bash
# NINO STUDY - Build clean APK, no key, Termux
AJ=~/android-sdk/platforms/android-34/android.jar
rm -rf obj gen compiled.zip NINO-STUDY-unsigned.apk classes.dex
mkdir -p obj gen
aapt2 compile --dir res -o compiled.zip
aapt2 link -o NINO-STUDY-unsigned.apk -I $AJ --manifest AndroidManifest.xml compiled.zip --auto-add-overlay
javac -cp $AJ -d obj -source 8 -target 8 $(find src -name "*.java")
d8 --classpath $AJ --lib $AJ --output . obj/com/nino/study/*.class
zip -r NINO-STUDY-unsigned.apk classes.dex assets/
zipalign -f 4 NINO-STUDY-unsigned.apk NINO-STUDY.apk
apksigner sign --ks ~/myAI/nino2.keystore --ks-pass pass:123456 --key-pass pass:123456 --out NINO-STUDY-v1.0-CLEAN.apk NINO-STUDY.apk
echo "BUILT: NINO-STUDY-v1.0-CLEAN.apk - NO KEY, OFFLINE WORKS, ONLINE NEEDS YOUR OWN KEY IN Downloads/mtm_key_txt"
