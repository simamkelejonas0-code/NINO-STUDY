# NINO STUDY - For Every Child. No Data. No WiFi. No Textbook Needed.

Created by SIIMAMKELE NGXONONO from KIRKWOOD - Msengeni 6120, Eastern Cape, South Africa
Built 100% on phone in Termux. No PC. No Android Studio. No WiFi.

## Why I Created This App

I live in Msengeni, Kirkwood. In my village, and in townships and rural schools across South Africa, learners suffer the same thing:

- No data. Data is expensive, parents cannot afford it every day.
- No WiFi. Schools have no WiFi, homes have no WiFi.
- No textbooks. Books are shared, lost, or never arrive.
- Network coverage drops. Even in urban areas, signal dies. Flight mode is not a choice - it is reality.

A child should not fail because they have no data.

So I built NINO STUDY to work in FLIGHT MODE. Turn on Flight Mode. Turn off WiFi. Turn off data. The app still works. 237+ questions, answers, memos - inside the phone, offline.

When network comes back, the same app can ask Muse Spark 1.3 online for a deeper answer. Offline first. Online when possible. Never blocked by network.

## What It Helps With

- Grade 9-12, CAPS, NSC 2020-2025 Past Papers + Memos
- 237+ Q&A - and growing
- All subjects: Maths, Physical Sciences, Life Sciences, Accounting, Business Studies, Economics, Geography, History, Life Orientation, Tourism, CAT, IT, EGD, Civil / Mechanical / Electrical Technology, Hospitality, Consumer Studies, Visual Arts, Dramatic Arts, Music, Design, Religion Studies, and more
- All 11 Languages: English, Afrikaans, isiXhosa, isiZulu, Sepedi, Setswana, Sesotho, Xitsonga, Tshivenda, isiNdebele, siSwati
- NSFAS, APS, Bursaries, Careers: Who qualifies for NSFAS, how to apply, APS score, university entry, Funza Lushaka, Sasol, Eskom, bursaries list
- Study help: Study plan, exam panic, failed a test, no textbook, no teacher - what to do
- Every equation has a WORD description: Not just F=ma. It says: In words: F = Force, push/pull, measured in Newtons (N). m = mass, how heavy, in kg. a = acceleration, how fast speed changes, in m/s2. Example: push 2kg with 3m/s2 = 6N force. A child with no teacher must understand it alone.

## How It Works

Offline (Flight Mode) - Always Works:
1. Open NINO STUDY
2. Type a question - e.g. photosynthesis, NSFAS, Newton, VAT
3. Or tap a quick button: NSFAS, APS + Uni, Photosynthesis, Newton
4. Tap SEARCH OFFLINE
5. Answer shows instantly - no data, no WiFi, no server

Scoring: keyword + subject + grade + topic. Only real matches show. If no offline match, it tells you: Tap ASK MUSE SPARK ONLINE.

Online (When Network Is Back):
1. Type a question not in the offline book
2. Tap ASK MUSE SPARK ONLINE
3. The APK calls Muse Spark 1.3 (Meta AI) with your own API key
4. The online brain is instructed: Every equation MUST have a word description. What each letter means, its unit, real-life example. Simple English.

The key is NEVER hard-coded. The APK reads it from a file mtm_key_txt in Downloads or from assets in your private local build. The public repo has NO key.

## Build It Yourself - Termux, No PC

AJ=~/android-sdk/platforms/android-34/android.jar
rm -rf obj gen compiled.zip NINO-STUDY-unsigned.apk classes.dex
mkdir -p obj gen
aapt2 compile --dir res -o compiled.zip
aapt2 link -o NINO-STUDY-unsigned.apk -I $AJ --manifest AndroidManifest.xml compiled.zip --auto-add-overlay
javac -cp $AJ -d obj -source 8 -target 8 $(find src -name "*.java")
d8 --classpath $AJ --lib $AJ --output . obj/com/nino/study/*.class
zip -r NINO-STUDY-unsigned.apk classes.dex assets/
zipalign -f 4 NINO-STUDY-unsigned.apk NINO-STUDY.apk
apksigner sign --ks ~/myAI/nino2.keystore --ks-pass pass:123456 --key-pass pass:123456 --out NINO-STUDY-SIGNED.apk NINO-STUDY.apk

- Package: com.nino.study
- Label: NINO STUDY
- minSdk 21, targetSdk 33
- Keystore: CN=NINO KIRKWOOD LABS, O=NINO, C=ZA
- MainActivity: WebView to file:///android_asset/index.html, embedded 237 Q&A, no fetch needed

## Files

src/com/nino/study/MainActivity.java - WebView + file access
src/com/nino/study/NinoBridge.java - JS bridge for online call
src/com/nino/study/ApiCaller.java - Reads key from file, calls Muse Spark 1.3
assets/index.html - UI + embedded 237 Q&A
assets/nino_study.json - 237 Q&A database
AndroidManifest.xml - INTERNET permission + min 21 / target 33

## Honesty

- Offline brain is 237 real Q&A, not a full LLM. It is a textbook in your pocket.
- Online brain is Muse Spark 1.3 in the cloud, via API. It needs data/WiFi and your own key.
- APK is small because models are in the cloud. APK is caller + offline book.
- This is open source so judges, teachers, and learners can review the real code.

## License

MIT License - Copyright (c) 2026 SIIMAMKELE NGXONONO from KIRKWOOD. Keep credit. Use it to teach a child.

God sleeps. Son watches. For every child.
