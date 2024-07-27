import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:clipboard/common/logging.dart';
import 'package:easy_worker/easy_worker.dart';
import 'package:image/image.dart' as img;
import 'package:mime/mime.dart' as mime;
import 'package:universal_io/io.dart';

void calculateBlurHash(String path, Sender send) {
  try {
    final bin = File(path).readAsBytesSync();
    final mimeType =
        mime.lookupMimeType(path, headerBytes: bin.sublist(0, 100));

    img.Image? image;

    switch (mimeType) {
      case "image/gif":
        image = img.decodeGif(bin);
        break;
      case "image/jpeg" || "image/jpg":
        image = img.decodeJpg(bin);
        break;
      case "image/png":
        image = img.decodePng(bin);
        break;
      case "image/webp":
        image = img.decodeWebP(bin);
        break;
      case "image/tiff":
        image = img.decodeTiff(bin);
        break;
      case _:
    }

    if (image == null) {
      send(null);
      return;
    }
    final result = BlurHash.encode(image, numCompX: 4, numCompY: 3).hash;
    send(result);
  } catch (e) {
    logger.e(
      "Couldn't get blur hash from the image!",
      error: e,
    );
    send(null);
  }
}

Future<String?> getBlurHash(String path) async {
  final result = await EasyWorker.compute<String?, String>(
    calculateBlurHash,
    path,
    name: "BlurHash",
  );
  return result;
}
