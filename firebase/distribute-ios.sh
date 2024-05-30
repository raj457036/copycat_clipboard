# READ DOCS: https://firebase.google.com/docs/app-distribution/ios/distribute-cli?authuser=0&hl=en

firebase appdistribution:distribute \
    --app 1:892296995692:ios:4bf415b9b852d3af490949 \
    --release-notes-file "./app_distribution/release-note.txt" \
    --testers-file "./app_distribution/testers.txt" \
    --debug  \
    ../build/ios/iphoneos/Payload.ipa