import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('resolveFileName', () {
    test(
      'uses metadata for extensionless downloads, including empty extensions',
      () {
        const spreadsheetMime =
            'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
        for (final extension in [null, '', '.xlsx', 'xlsx']) {
          expect(
            resolveFileName(
              'orders_export_1',
              extension: extension,
              mimeType: spreadsheetMime,
            ),
            'orders_export_1.xlsx',
          );
        }
      },
    );

    test('keeps existing filename extensions without duplicating them', () {
      expect(resolveFileName('orders.xlsx', extension: '.xlsx'), 'orders.xlsx');
      expect(resolveFileName('orders.XLSX', extension: '.xlsx'), 'orders.XLSX');
      expect(
        resolveFileName('report.pdf', extension: '', mimeType: 'text/plain'),
        'report.pdf',
      );
    });

    test('does not invent an extension when no type is known', () {
      expect(resolveFileName('document', extension: ''), 'document');
      expect(
        resolveFileName('document', mimeType: 'application/x-unknown-copycat'),
        'document',
      );
    });
  });

  group('localPathWithMissingExtension', () {
    const xlsxMime =
        'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';

    ClipboardItem item(
      String path, {
      String? name,
      String? ext,
      String? mime,
    }) => ClipboardItem.fromFile(
      path,
    ).copyWith(fileName: name, fileExtension: ext, fileMimeType: mime);

    test('appends the missing extension from metadata', () {
      expect(
        localPathWithMissingExtension(
          item('/c/id_orders', name: 'orders', ext: '', mime: xlsxMime),
        ),
        '/c/id_orders.xlsx',
      );
      expect(
        localPathWithMissingExtension(
          item('/c/id_report', name: 'report.pdf', ext: ''),
        ),
        '/c/id_report.pdf',
      );
    });

    test('returns null when nothing needs renaming', () {
      expect(
        localPathWithMissingExtension(
          item('/c/id_report.pdf', name: 'report', ext: '.pdf'),
        ),
        isNull,
      );
      expect(
        localPathWithMissingExtension(item('/c/id_unknown', name: 'unknown')),
        isNull,
      );
    });
  });
}
