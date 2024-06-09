bundletool build-apks \
--bundle=build/app/outputs/bundle/release/app-release.aab \
--output=./scripts/temps/apps.apks \
--ks=./secrets/upload-keystore.jks \
--ks-pass=file:./scripts/temps/upload-keystore.pwd \
--ks-key-alias=upload \
--overwrite \
--local-testing \
--connected-device \
--key-pass=file:./scripts/temps/upload-keystore.pwd

bundletool install-apks \
--apks=./scripts/temps/apps.apks

rm -f ./scripts/temps/apps.apks