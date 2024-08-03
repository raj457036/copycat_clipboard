flutterfire upload-crashlytics-symbols \
--debug-symbols-path=/Users/rajsingh/Developers/Personal/clipboard/clipboard/build_symbols \
--upload-symbols-script-path=/Users/rajsingh/Developers/Personal/clipboard/clipboard/macos/Pods/FirebaseCrashlytics/upload-symbols  \
--platform=macos \
--apple-project-path=/Users/rajsingh/Developers/Personal/clipboard/clipboard/macos \
--env-platform-name=macosx \
--env-configuration=Release \
--env-project-dir=/Users/rajsingh/Developers/Personal/clipboard/clipboard/macos \
--env-built-products-dir=/Users/rajsingh/Developers/Personal/clipboard/clipboard/build/macos/Build/Products/Release \
--env-dwarf-dsym-folder-path=/Users/rajsingh/Developers/Personal/clipboard/clipboard/build/macos/Build/Products/Release \
--env-dwarf-dsym-file-name=CopyCat.app.dSYM \
--env-infoplist-path=CopyCat.app/Contents/Info.plist \
--default-config=default && echo "done"

# ./macos/Pods/FirebaseCrashlytics/upload-symbols -gsp /Users/rajsingh/Developers/Personal/clipboard/clipboard/ios/GoogleService-Info.plist --debug -p mac /Users/rajsingh/Developers/Personal/clipboard/clipboard/build/macos/Build/Products/Release/CopyCat.app.dSYM