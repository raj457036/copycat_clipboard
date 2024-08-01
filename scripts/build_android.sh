BUILD_FOR="${1:-appbundle}"

echo "Building $BUILD_FOR..."
flutter build $BUILD_FOR --release --dart-define-from-file="local/prod.json" --obfuscate --split-debug-info=./build_symbols