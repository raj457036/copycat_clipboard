// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appconfig.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => _AppConfig(
  themeMode:
      $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
      ThemeMode.system,
  enableSync: json['enableSync'] as bool? ?? true,
  enableFileSync: json['enableFileSync'] as bool? ?? true,
  activeStorageProvider:
      $enumDecodeNullable(
        _$ActiveCloudStorageProviderEnumMap,
        json['activeStorageProvider'],
      ) ??
      ActiveCloudStorageProvider.googleDrive,
  layout:
      $enumDecodeNullable(_$AppLayoutEnumMap, json['layout']) ?? AppLayout.grid,
  view: $enumDecodeNullable(_$AppViewEnumMap, json['view']) ?? AppView.windowed,
  pinned: json['pinned'] as bool? ?? false,
  windowWidth: (json['windowWidth'] as num?)?.toDouble() ?? initialWindowWidth,
  windowHeight:
      (json['windowHeight'] as num?)?.toDouble() ?? initialWindowHeight,
  sortBy:
      $enumDecodeNullable(_$ClipboardSortKeyEnumMap, json['sortBy']) ??
      ClipboardSortKey.modified,
  sortOrder:
      $enumDecodeNullable(_$SortOrderEnumMap, json['sortOrder']) ??
      SortOrder.desc,
  dontUploadOver: (json['dontUploadOver'] as num?)?.toInt() ?? $10MB,
  dontCopyOver: (json['dontCopyOver'] as num?)?.toInt() ?? $10MB,
  pausedTill: json['pausedTill'] == null
      ? null
      : DateTime.parse(json['pausedTill'] as String),
  syncSpeed:
      $enumDecodeNullable(_$SyncSpeedEnumMap, json['syncSpeed']) ??
      SyncSpeed.balanced,
  toggleHotkey: json['toggleHotkey'] as String?,
  quickPasteHotkey: json['quickPasteHotkey'] as String?,
  pasteStackHotkey: json['pasteStackHotkey'] as String?,
  smartPaste: json['smartPaste'] as bool? ?? false,
  keepWindowOpenOnUnfocus: json['keepWindowOpenOnUnfocus'] as bool? ?? true,
  transformAsNewClip: json['transformAsNewClip'] as bool? ?? false,
  clipboardFeedbackMode: json['clipboardFeedbackMode'] == null
      ? ClipboardFeedbackMode.copyAndSync
      : _feedbackModeFromJson(json['clipboardFeedbackMode']),
  enableTypeToSearch: json['enableTypeToSearch'] as bool? ?? false,
  launchAtStartup: json['launchAtStartup'] as bool? ?? false,
  locale: json['locale'] as String? ?? "en",
  enc2: json['enc2'] as String?,
  autoEncrypt: json['autoEncrypt'] as bool? ?? false,
  useEncryptionNonce: json['useEncryptionNonce'] as bool? ?? false,
  hideFromScreenCapture: json['hideFromScreenCapture'] as bool? ?? true,
  enableLocalAuth: json['enableLocalAuth'] as bool? ?? false,
  localAuthTimeoutMinutes:
      (json['localAuthTimeoutMinutes'] as num?)?.toInt() ?? 1,
  themeColor: (json['themeColor'] as num?)?.toInt() ?? defaultThemeColor,
  themeVariant:
      $enumDecodeNullable(
        _$DynamicSchemeVariantEnumMap,
        json['themeVariant'],
      ) ??
      DynamicSchemeVariant.tonalSpot,
  showCollectionTip: json['showCollectionTip'] as bool? ?? true,
  searchIndexReady: json['searchIndexReady'] as bool? ?? false,
  enableDragNDrop: json['enableDragNDrop'] as bool? ?? false,
  enablePasteStack: json['enablePasteStack'] as bool? ?? false,
  androidBgListener: json['androidBgListener'] as bool? ?? false,
  richDataCapture: json['richDataCapture'] as bool? ?? false,
  lanInstantSync: json['lanInstantSync'] as bool? ?? false,
  autoWriteOnReceive: json['autoWriteOnReceive'] as bool? ?? false,
  showTrayIcon: json['showTrayIcon'] as bool? ?? true,
  onBoardComplete: json['onBoardComplete'] as bool? ?? true,
  reviewQualifyingEventCount:
      (json['reviewQualifyingEventCount'] as num?)?.toInt() ?? 0,
  lastReviewPromptDate: json['lastReviewPromptDate'] == null
      ? null
      : DateTime.parse(json['lastReviewPromptDate'] as String),
  reviewNeverAsk: json['reviewNeverAsk'] as bool? ?? false,
);

Map<String, dynamic> _$AppConfigToJson(
  _AppConfig instance,
) => <String, dynamic>{
  'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
  'enableSync': instance.enableSync,
  'enableFileSync': instance.enableFileSync,
  'activeStorageProvider':
      _$ActiveCloudStorageProviderEnumMap[instance.activeStorageProvider]!,
  'layout': _$AppLayoutEnumMap[instance.layout]!,
  'view': _$AppViewEnumMap[instance.view]!,
  'pinned': instance.pinned,
  'windowWidth': instance.windowWidth,
  'windowHeight': instance.windowHeight,
  'sortBy': _$ClipboardSortKeyEnumMap[instance.sortBy]!,
  'sortOrder': _$SortOrderEnumMap[instance.sortOrder]!,
  'dontUploadOver': instance.dontUploadOver,
  'dontCopyOver': instance.dontCopyOver,
  'pausedTill': instance.pausedTill?.toIso8601String(),
  'syncSpeed': _$SyncSpeedEnumMap[instance.syncSpeed]!,
  'toggleHotkey': instance.toggleHotkey,
  'quickPasteHotkey': instance.quickPasteHotkey,
  'pasteStackHotkey': instance.pasteStackHotkey,
  'smartPaste': instance.smartPaste,
  'keepWindowOpenOnUnfocus': instance.keepWindowOpenOnUnfocus,
  'transformAsNewClip': instance.transformAsNewClip,
  'clipboardFeedbackMode': _feedbackModeToJson(instance.clipboardFeedbackMode),
  'enableTypeToSearch': instance.enableTypeToSearch,
  'launchAtStartup': instance.launchAtStartup,
  'locale': instance.locale,
  'enc2': instance.enc2,
  'autoEncrypt': instance.autoEncrypt,
  'useEncryptionNonce': instance.useEncryptionNonce,
  'hideFromScreenCapture': instance.hideFromScreenCapture,
  'enableLocalAuth': instance.enableLocalAuth,
  'localAuthTimeoutMinutes': instance.localAuthTimeoutMinutes,
  'themeColor': instance.themeColor,
  'themeVariant': _$DynamicSchemeVariantEnumMap[instance.themeVariant]!,
  'showCollectionTip': instance.showCollectionTip,
  'searchIndexReady': instance.searchIndexReady,
  'enableDragNDrop': instance.enableDragNDrop,
  'enablePasteStack': instance.enablePasteStack,
  'androidBgListener': instance.androidBgListener,
  'richDataCapture': instance.richDataCapture,
  'lanInstantSync': instance.lanInstantSync,
  'autoWriteOnReceive': instance.autoWriteOnReceive,
  'showTrayIcon': instance.showTrayIcon,
  'onBoardComplete': instance.onBoardComplete,
  'reviewQualifyingEventCount': instance.reviewQualifyingEventCount,
  'lastReviewPromptDate': instance.lastReviewPromptDate?.toIso8601String(),
  'reviewNeverAsk': instance.reviewNeverAsk,
};

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

const _$ActiveCloudStorageProviderEnumMap = {
  ActiveCloudStorageProvider.googleDrive: 'googleDrive',
  ActiveCloudStorageProvider.webdav: 'webdav',
};

const _$AppLayoutEnumMap = {AppLayout.grid: 'grid', AppLayout.list: 'list'};

const _$AppViewEnumMap = {
  AppView.topDocked: 'topDocked',
  AppView.bottomDocked: 'bottomDocked',
  AppView.leftDocked: 'leftDocked',
  AppView.rightDocked: 'rightDocked',
  AppView.windowed: 'windowed',
};

const _$ClipboardSortKeyEnumMap = {
  ClipboardSortKey.modified: 'modified',
  ClipboardSortKey.created: 'created',
  ClipboardSortKey.lastCopied: 'lastCopied',
  ClipboardSortKey.copyCount: 'copyCount',
};

const _$SortOrderEnumMap = {SortOrder.desc: 'desc', SortOrder.asc: 'asc'};

const _$SyncSpeedEnumMap = {
  SyncSpeed.balanced: 'balanced',
  SyncSpeed.realtime: 'realtime',
};

const _$DynamicSchemeVariantEnumMap = {
  DynamicSchemeVariant.tonalSpot: 'tonalSpot',
  DynamicSchemeVariant.fidelity: 'fidelity',
  DynamicSchemeVariant.monochrome: 'monochrome',
  DynamicSchemeVariant.neutral: 'neutral',
  DynamicSchemeVariant.vibrant: 'vibrant',
  DynamicSchemeVariant.expressive: 'expressive',
  DynamicSchemeVariant.content: 'content',
  DynamicSchemeVariant.rainbow: 'rainbow',
  DynamicSchemeVariant.fruitSalad: 'fruitSalad',
};
