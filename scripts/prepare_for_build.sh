BUILD_FOR="${1:-ios}"

echo "Prepareing build config for $BUILD_FOR..."

flutter build $BUILD_FOR --config-only --release --dart-define-from-file=local/prod.json