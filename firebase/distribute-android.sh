# READ DOCS: https://firebase.google.com/docs/app-distribution/android/distribute-cli?authuser=0&hl=en&apptype=apk

firebase appdistribution:distribute \
    --app 1:892296995692:android:64012302abe55897490949 \
    --release-notes-file "firebase/app_distribution/release-note.txt" \
    --testers-file "firebase/app_distribution/testers.txt" \
    --debug  \
    build/app/outputs/apk/release/app-release.apk