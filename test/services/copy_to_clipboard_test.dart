import 'dart:io';

import 'package:clipboard/base/data/services/clipboard_service.dart';
import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_clipboard/super_clipboard.dart';

class _RecordingClipboardService extends ClipboardService {
  List<DataWriterItem> writtenItems = [];
  List<Uri>? writtenFileUris;

  @override
  Future<void> write(
    Iterable<DataWriterItem> items, {
    List<Uri>? androidFileUris,
  }) async {
    writtenItems = items.toList();
    writtenFileUris = androidFileUris;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  const channel = MethodChannel('com.entilitystudio.CopyCat/drag_file_uri');

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('copy_to_clipboard_test_');
  });

  tearDown(() async {
    debugDefaultTargetPlatformOverride = null;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  group('CopyToClipboard', () {
    test('isImage recognizes image MIME types without matching other files', () {
      final item = ClipboardItem.fromFile('/cache/file');
      for (final mimeType in ['image/png', 'IMAGE/JPEG', ' image/webp ']) {
        expect(item.copyWith(fileMimeType: mimeType).isImage, isTrue);
      }
      for (final mimeType in [null, '', 'text/plain', 'application/pdf', 'image']) {
        expect(item.copyWith(fileMimeType: mimeType).isImage, isFalse);
      }
    });

    test('returns false when file does not exist', () async {
      final copy = CopyToClipboard();
      final nonExistent = File('${tempDir.path}/non_existent.pdf');

      final success = await copy.writeFileContent(nonExistent);

      expect(success, isFalse);
      expect(copy.items, isEmpty);
    });

    test('writes PDF as fileUri without raster image coercion', () async {
      final copy = CopyToClipboard();
      final pdfFile = File('${tempDir.path}/sample.pdf');
      await pdfFile.writeAsBytes(List.filled(100, 0x25)); // '%PDF' dummy bytes

      final success = await copy.writeFileContent(
        pdfFile,
        mimeType: 'application/pdf',
      );

      expect(success, isTrue);
      expect(copy.items, hasLength(1));

      final item = copy.items.first;
      expect(item.suggestedName, 'sample.pdf');
      expect(item.data, hasLength(1));
    });

    test('writes image with raster representation and fileUri', () async {
      final copy = CopyToClipboard();
      final imgFile = File('${tempDir.path}/photo.png');
      await imgFile.writeAsBytes(List.filled(50, 0x89)); // PNG dummy header

      final success = await copy.writeFileContent(
        imgFile,
        mimeType: 'image/png',
      );

      expect(success, isTrue);
      expect(copy.items, hasLength(1));

      final item = copy.items.first;
      expect(item.suggestedName, 'photo.png');
      expect(item.data, hasLength(2));
    });

    test('writes text file as a file URI, not its text contents', () async {
      final copy = CopyToClipboard();
      final txtFile = File('${tempDir.path}/notes.txt');
      await txtFile.writeAsString('hello world');

      final success = await copy.writeFileContent(
        txtFile,
        mimeType: 'text/plain',
      );

      expect(success, isTrue);
      expect(copy.items, hasLength(1));

      final item = copy.items.first;
      expect(item.suggestedName, 'notes.txt');
      expect(item.data, hasLength(1));
    });

    test(
      'writes generic file using resolved MIME type and provided fileName',
      () async {
        final copy = CopyToClipboard();
        final docFile = File('${tempDir.path}/contract.docx');
        await docFile.writeAsString('dummy content');

        final success = await copy.writeFileContent(
          docFile,
          fileName: 'RenamedContract.docx',
        );

        expect(success, isTrue);
        expect(copy.items, hasLength(1));

        final item = copy.items.first;
        expect(item.suggestedName, 'RenamedContract.docx');
        expect(item.data, hasLength(1));
      },
    );

    group('Android file clipboard', () {
      for (final mimeType in ['text/plain', 'application/pdf', 'image/png']) {
        test('commits $mimeType as a native content URI', () async {
          debugDefaultTargetPlatformOverride = TargetPlatform.android;
          final calls = <MethodCall>[];
          const uri =
              'content://com.entilitystudio.copycat.fileprovider/app_flutter/'
              'Invoice%200002%25.txt?displayName=Invoice%200002%25.txt';
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (call) async {
                calls.add(call);
                if (call.method == 'getContentUriForPath') return uri;
                return null;
              });
          final file = File('${tempDir.path}/cached.txt');
          await file.writeAsString('file content');
          final copy = CopyToClipboard();
          await copy.writeFileContent(
            file,
            mimeType: mimeType,
            fileName: 'Invoice 0002%.txt',
          );
          expect(await copy.commit(ClipboardService()), isTrue);
          expect(calls.map((call) => call.method), [
            'getContentUriForPath',
            'writeFileClipboard',
          ]);
          expect(calls.first.arguments, {
            'path': file.path,
            'name': 'Invoice 0002%.txt',
          });
          expect(calls.last.arguments, {
            'uris': [uri],
          });
        });
      }

      test('commits multiple files in one native clipboard write', () async {
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        final calls = <MethodCall>[];
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(channel, (call) async {
              calls.add(call);
              if (call.method == 'getContentUriForPath') {
                final name = (call.arguments as Map)['name'];
                return 'content://com.entilitystudio.CopyCat.fileProvider/cache/$name';
              }
              return null;
            });
        final copy = CopyToClipboard();
        for (final name in ['first.txt', 'second.pdf']) {
          final file = File('${tempDir.path}/$name');
          await file.writeAsString('content');
          await copy.writeFileContent(file);
        }

        expect(await copy.commit(ClipboardService()), isTrue);
        expect(calls.last.method, 'writeFileClipboard');
        expect(calls.last.arguments, {
          'uris': [
            'content://com.entilitystudio.copycat.fileprovider/cache/first.txt',
            'content://com.entilitystudio.copycat.fileprovider/cache/second.pdf',
          ],
        });
      });

      test(
        'keeps mixed file, rich text and URL copies on the standard writer',
        () async {
          debugDefaultTargetPlatformOverride = TargetPlatform.android;
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (call) async {
                expect(call.method, 'getContentUriForPath');
                return 'content://com.entilitystudio.CopyCat.fileProvider/cache/test.txt';
              });
          final file = File('${tempDir.path}/test.txt');
          await file.writeAsString('content');
          final service = _RecordingClipboardService()
            ..setRichDataEnabled(true);
          final copy = CopyToClipboard();
          await copy.writeFileContent(file);
          await copy.writeRichText(
            service,
            text: 'hello',
            richData: RichDataPayload({
              'text/html': '<b>hello</b>',
            }).toJsonString(),
          );
          copy.writeUrl(Uri.parse('https://example.com'));

          expect(await copy.commit(service), isTrue);
          expect(service.writtenFileUris, isNull);
          expect(service.writtenItems, copy.items);
          expect(service.writtenItems, hasLength(3));
          expect(service.writtenItems[1].data, hasLength(2));
        },
      );

      test(
        'reports native clipboard failures instead of returning success',
        () async {
          debugDefaultTargetPlatformOverride = TargetPlatform.android;
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, (call) async {
                if (call.method == 'getContentUriForPath') {
                  return 'content://com.entilitystudio.copycat.fileprovider/cache/test.txt';
                }
                throw PlatformException(code: 'clipboard_write_failed');
              });
          final file = File('${tempDir.path}/test.txt');
          await file.writeAsString('content');
          final copy = CopyToClipboard();
          await copy.writeFileContent(file);

          expect(await copy.commit(ClipboardService()), isFalse);
        },
      );
    });

    test('writeText adds plain text item', () async {
      final copy = CopyToClipboard();
      final success = await copy.writeText('Hello World');

      expect(success, isTrue);
      expect(copy.items, hasLength(1));
      expect(copy.items.first.suggestedName, 'Text');
    });

    test('writeUrl adds URI item', () {
      final copy = CopyToClipboard();
      final success = copy.writeUrl(Uri.parse('https://example.com'));

      expect(success, isTrue);
      expect(copy.items, hasLength(1));
      expect(copy.items.first.suggestedName, 'Uri');
    });
  });

  group('resolveFileUri', () {
    test('resolves local file path to file URI on current platform', () async {
      final file = File('${tempDir.path}/test.txt');
      await file.writeAsString('content');

      final uri = await resolveFileUri(file.path);

      expect(uri.scheme, anyOf('file', 'content'));
      if (uri.scheme == 'file') {
        expect(uri.toFilePath(), file.path);
      }
    });

    test('resolves file path with spaces safely', () async {
      final file = File('${tempDir.path}/Invoice 0002.pdf');
      await file.writeAsString('content');

      final uri = await resolveFileUri(file.path);

      expect(uri.scheme, anyOf('file', 'content'));
      expect(uri.toString(), contains('Invoice%200002.pdf'));
    });
  });
}
