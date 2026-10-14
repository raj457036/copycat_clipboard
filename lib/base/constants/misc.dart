import 'package:super_clipboard/super_clipboard.dart';

const avif = SimpleFileFormat(
  uniformTypeIdentifiers: ['public.avif'],
  windowsFormats: ['AVIF'],
  mimeTypes: ['image/avif'],
);

const svg = SimpleFileFormat(
  uniformTypeIdentifiers: ['public.svg-image'],
  mimeTypes: ['public.svg-image', "image/svg+xml", "image/svg"],
);

const allSupportedClipFormats = [...Formats.standardFormats, avif, svg];

/// Maximum allowed size for rich clipboard payload (in bytes).
/// Payloads larger than this are ignored during capture.
///
/// Note: 256 KB is chosen as a reasonable limit to allow rich
/// clipboard data while preventing excessive memory usage.
const kRichClipboardDataMaxBytes = 256 * 1024;

/// Maximum allowed length for text clips. Clips with text longer than this
/// will be saved as file clips instead to prevent performance issues.
const kMaxTextClipLength = 4096;

/// Maximum characters stored as the in-DB text preview for [ClipItemType.file]
/// clips whose content is a text/* file. The full content lives on disk.
const kTextFilePreviewLength = 500;
