BUILD_FOR="${1:-appbundle}"

echo "Building $BUILD_FOR..."
flutter build $BUILD_FOR --dart-define-from-file="local/prod.json"