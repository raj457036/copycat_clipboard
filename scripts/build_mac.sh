flutter build macos --dart-define-from-file="local/prod.json" && \
create-dmg --window-pos 200 120 \
  --window-size 800 400 \
  --icon-size 100 \
  --icon "CopyCat.app" 200 190 \
  --hide-extension "CopyCat.app" \
  --app-drop-link 600 185 CopyCat.dmg build/macos/Build/Products/Release/CopyCat.app