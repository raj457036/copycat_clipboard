// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_app_config.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarAppConfigCollection on Isar {
  IsarCollection<IsarAppConfig> get isarAppConfigs => this.collection();
}

const IsarAppConfigSchema = CollectionSchema(
  name: r'AppConfig',
  id: -7085420701237142207,
  properties: {
    r'activeStorageProvider': PropertySchema(
      id: 0,
      name: r'activeStorageProvider',
      type: IsarType.string,
      enumMap: _IsarAppConfigactiveStorageProviderEnumValueMap,
    ),
    r'androidBgListener': PropertySchema(
      id: 1,
      name: r'androidBgListener',
      type: IsarType.bool,
    ),
    r'autoEncrypt': PropertySchema(
      id: 2,
      name: r'autoEncrypt',
      type: IsarType.bool,
    ),
    r'autoWriteOnReceive': PropertySchema(
      id: 3,
      name: r'autoWriteOnReceive',
      type: IsarType.bool,
    ),
    r'clipboardFeedbackMode': PropertySchema(
      id: 4,
      name: r'clipboardFeedbackMode',
      type: IsarType.string,
      enumMap: _IsarAppConfigclipboardFeedbackModeEnumValueMap,
    ),
    r'dontCopyOver': PropertySchema(
      id: 5,
      name: r'dontCopyOver',
      type: IsarType.long,
    ),
    r'dontUploadOver': PropertySchema(
      id: 6,
      name: r'dontUploadOver',
      type: IsarType.long,
    ),
    r'enableDragNDrop': PropertySchema(
      id: 7,
      name: r'enableDragNDrop',
      type: IsarType.bool,
    ),
    r'enableFileSync': PropertySchema(
      id: 8,
      name: r'enableFileSync',
      type: IsarType.bool,
    ),
    r'enableLocalAuth': PropertySchema(
      id: 9,
      name: r'enableLocalAuth',
      type: IsarType.bool,
    ),
    r'enablePasteStack': PropertySchema(
      id: 10,
      name: r'enablePasteStack',
      type: IsarType.bool,
    ),
    r'enableSync': PropertySchema(
      id: 11,
      name: r'enableSync',
      type: IsarType.bool,
    ),
    r'enableTypeToSearch': PropertySchema(
      id: 12,
      name: r'enableTypeToSearch',
      type: IsarType.bool,
    ),
    r'enc2': PropertySchema(id: 13, name: r'enc2', type: IsarType.string),
    r'exclusionRules': PropertySchema(
      id: 14,
      name: r'exclusionRules',
      type: IsarType.object,

      target: r'ExclusionRules',
    ),
    r'hideFromScreenCapture': PropertySchema(
      id: 15,
      name: r'hideFromScreenCapture',
      type: IsarType.bool,
    ),
    r'keepWindowOpenOnUnfocus': PropertySchema(
      id: 16,
      name: r'keepWindowOpenOnUnfocus',
      type: IsarType.bool,
    ),
    r'lanInstantSync': PropertySchema(
      id: 17,
      name: r'lanInstantSync',
      type: IsarType.bool,
    ),
    r'lastReviewPromptDate': PropertySchema(
      id: 18,
      name: r'lastReviewPromptDate',
      type: IsarType.dateTime,
    ),
    r'launchAtStartup': PropertySchema(
      id: 19,
      name: r'launchAtStartup',
      type: IsarType.bool,
    ),
    r'layout': PropertySchema(
      id: 20,
      name: r'layout',
      type: IsarType.string,
      enumMap: _IsarAppConfiglayoutEnumValueMap,
    ),
    r'localAuthTimeoutMinutes': PropertySchema(
      id: 21,
      name: r'localAuthTimeoutMinutes',
      type: IsarType.long,
    ),
    r'locale': PropertySchema(id: 22, name: r'locale', type: IsarType.string),
    r'onBoardComplete': PropertySchema(
      id: 23,
      name: r'onBoardComplete',
      type: IsarType.bool,
    ),
    r'pasteStackHotkey': PropertySchema(
      id: 24,
      name: r'pasteStackHotkey',
      type: IsarType.string,
    ),
    r'pausedTill': PropertySchema(
      id: 25,
      name: r'pausedTill',
      type: IsarType.dateTime,
    ),
    r'pinned': PropertySchema(id: 26, name: r'pinned', type: IsarType.bool),
    r'quickPasteHotkey': PropertySchema(
      id: 27,
      name: r'quickPasteHotkey',
      type: IsarType.string,
    ),
    r'reviewNeverAsk': PropertySchema(
      id: 28,
      name: r'reviewNeverAsk',
      type: IsarType.bool,
    ),
    r'reviewQualifyingEventCount': PropertySchema(
      id: 29,
      name: r'reviewQualifyingEventCount',
      type: IsarType.long,
    ),
    r'richDataCapture': PropertySchema(
      id: 30,
      name: r'richDataCapture',
      type: IsarType.bool,
    ),
    r'searchIndexReady': PropertySchema(
      id: 31,
      name: r'searchIndexReady',
      type: IsarType.bool,
    ),
    r'showCollectionTip': PropertySchema(
      id: 32,
      name: r'showCollectionTip',
      type: IsarType.bool,
    ),
    r'showTrayIcon': PropertySchema(
      id: 33,
      name: r'showTrayIcon',
      type: IsarType.bool,
    ),
    r'smartPaste': PropertySchema(
      id: 34,
      name: r'smartPaste',
      type: IsarType.bool,
    ),
    r'sortBy': PropertySchema(
      id: 35,
      name: r'sortBy',
      type: IsarType.string,
      enumMap: _IsarAppConfigsortByEnumValueMap,
    ),
    r'sortOrder': PropertySchema(
      id: 36,
      name: r'sortOrder',
      type: IsarType.string,
      enumMap: _IsarAppConfigsortOrderEnumValueMap,
    ),
    r'syncSpeed': PropertySchema(
      id: 37,
      name: r'syncSpeed',
      type: IsarType.string,
      enumMap: _IsarAppConfigsyncSpeedEnumValueMap,
    ),
    r'themeColor': PropertySchema(
      id: 38,
      name: r'themeColor',
      type: IsarType.long,
    ),
    r'themeMode': PropertySchema(
      id: 39,
      name: r'themeMode',
      type: IsarType.string,
      enumMap: _IsarAppConfigthemeModeEnumValueMap,
    ),
    r'themeVariant': PropertySchema(
      id: 40,
      name: r'themeVariant',
      type: IsarType.string,
      enumMap: _IsarAppConfigthemeVariantEnumValueMap,
    ),
    r'toggleHotkey': PropertySchema(
      id: 41,
      name: r'toggleHotkey',
      type: IsarType.string,
    ),
    r'transformAsNewClip': PropertySchema(
      id: 42,
      name: r'transformAsNewClip',
      type: IsarType.bool,
    ),
    r'useEncryptionNonce': PropertySchema(
      id: 43,
      name: r'useEncryptionNonce',
      type: IsarType.bool,
    ),
    r'view': PropertySchema(
      id: 44,
      name: r'view',
      type: IsarType.string,
      enumMap: _IsarAppConfigviewEnumValueMap,
    ),
    r'windowHeight': PropertySchema(
      id: 45,
      name: r'windowHeight',
      type: IsarType.double,
    ),
    r'windowWidth': PropertySchema(
      id: 46,
      name: r'windowWidth',
      type: IsarType.double,
    ),
  },

  estimateSize: _isarAppConfigEstimateSize,
  serialize: _isarAppConfigSerialize,
  deserialize: _isarAppConfigDeserialize,
  deserializeProp: _isarAppConfigDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'ExclusionRules': IsarExclusionRulesSchema,
    r'AppInfo': IsarAppInfoSchema,
  },

  getId: _isarAppConfigGetId,
  getLinks: _isarAppConfigGetLinks,
  attach: _isarAppConfigAttach,
  version: '3.3.2',
);

int _isarAppConfigEstimateSize(
  IsarAppConfig object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.activeStorageProvider.name.length * 3;
  bytesCount += 3 + object.clipboardFeedbackMode.name.length * 3;
  {
    final value = object.enc2;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.exclusionRules;
    if (value != null) {
      bytesCount +=
          3 +
          IsarExclusionRulesSchema.estimateSize(
            value,
            allOffsets[IsarExclusionRules]!,
            allOffsets,
          );
    }
  }
  bytesCount += 3 + object.layout.name.length * 3;
  bytesCount += 3 + object.locale.length * 3;
  {
    final value = object.pasteStackHotkey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.quickPasteHotkey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.sortBy.name.length * 3;
  bytesCount += 3 + object.sortOrder.name.length * 3;
  bytesCount += 3 + object.syncSpeed.name.length * 3;
  bytesCount += 3 + object.themeMode.name.length * 3;
  bytesCount += 3 + object.themeVariant.name.length * 3;
  {
    final value = object.toggleHotkey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.view.name.length * 3;
  return bytesCount;
}

void _isarAppConfigSerialize(
  IsarAppConfig object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.activeStorageProvider.name);
  writer.writeBool(offsets[1], object.androidBgListener);
  writer.writeBool(offsets[2], object.autoEncrypt);
  writer.writeBool(offsets[3], object.autoWriteOnReceive);
  writer.writeString(offsets[4], object.clipboardFeedbackMode.name);
  writer.writeLong(offsets[5], object.dontCopyOver);
  writer.writeLong(offsets[6], object.dontUploadOver);
  writer.writeBool(offsets[7], object.enableDragNDrop);
  writer.writeBool(offsets[8], object.enableFileSync);
  writer.writeBool(offsets[9], object.enableLocalAuth);
  writer.writeBool(offsets[10], object.enablePasteStack);
  writer.writeBool(offsets[11], object.enableSync);
  writer.writeBool(offsets[12], object.enableTypeToSearch);
  writer.writeString(offsets[13], object.enc2);
  writer.writeObject<IsarExclusionRules>(
    offsets[14],
    allOffsets,
    IsarExclusionRulesSchema.serialize,
    object.exclusionRules,
  );
  writer.writeBool(offsets[15], object.hideFromScreenCapture);
  writer.writeBool(offsets[16], object.keepWindowOpenOnUnfocus);
  writer.writeBool(offsets[17], object.lanInstantSync);
  writer.writeDateTime(offsets[18], object.lastReviewPromptDate);
  writer.writeBool(offsets[19], object.launchAtStartup);
  writer.writeString(offsets[20], object.layout.name);
  writer.writeLong(offsets[21], object.localAuthTimeoutMinutes);
  writer.writeString(offsets[22], object.locale);
  writer.writeBool(offsets[23], object.onBoardComplete);
  writer.writeString(offsets[24], object.pasteStackHotkey);
  writer.writeDateTime(offsets[25], object.pausedTill);
  writer.writeBool(offsets[26], object.pinned);
  writer.writeString(offsets[27], object.quickPasteHotkey);
  writer.writeBool(offsets[28], object.reviewNeverAsk);
  writer.writeLong(offsets[29], object.reviewQualifyingEventCount);
  writer.writeBool(offsets[30], object.richDataCapture);
  writer.writeBool(offsets[31], object.searchIndexReady);
  writer.writeBool(offsets[32], object.showCollectionTip);
  writer.writeBool(offsets[33], object.showTrayIcon);
  writer.writeBool(offsets[34], object.smartPaste);
  writer.writeString(offsets[35], object.sortBy.name);
  writer.writeString(offsets[36], object.sortOrder.name);
  writer.writeString(offsets[37], object.syncSpeed.name);
  writer.writeLong(offsets[38], object.themeColor);
  writer.writeString(offsets[39], object.themeMode.name);
  writer.writeString(offsets[40], object.themeVariant.name);
  writer.writeString(offsets[41], object.toggleHotkey);
  writer.writeBool(offsets[42], object.transformAsNewClip);
  writer.writeBool(offsets[43], object.useEncryptionNonce);
  writer.writeString(offsets[44], object.view.name);
  writer.writeDouble(offsets[45], object.windowHeight);
  writer.writeDouble(offsets[46], object.windowWidth);
}

IsarAppConfig _isarAppConfigDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarAppConfig();
  object.activeStorageProvider =
      _IsarAppConfigactiveStorageProviderValueEnumMap[reader.readStringOrNull(
        offsets[0],
      )] ??
      ActiveCloudStorageProvider.googleDrive;
  object.androidBgListener = reader.readBool(offsets[1]);
  object.autoEncrypt = reader.readBool(offsets[2]);
  object.autoWriteOnReceive = reader.readBool(offsets[3]);
  object.clipboardFeedbackMode =
      _IsarAppConfigclipboardFeedbackModeValueEnumMap[reader.readStringOrNull(
        offsets[4],
      )] ??
      ClipboardFeedbackMode.disabled;
  object.dontCopyOver = reader.readLong(offsets[5]);
  object.dontUploadOver = reader.readLong(offsets[6]);
  object.enableDragNDrop = reader.readBool(offsets[7]);
  object.enableFileSync = reader.readBool(offsets[8]);
  object.enableLocalAuth = reader.readBool(offsets[9]);
  object.enablePasteStack = reader.readBool(offsets[10]);
  object.enableSync = reader.readBool(offsets[11]);
  object.enableTypeToSearch = reader.readBool(offsets[12]);
  object.enc2 = reader.readStringOrNull(offsets[13]);
  object.exclusionRules = reader.readObjectOrNull<IsarExclusionRules>(
    offsets[14],
    IsarExclusionRulesSchema.deserialize,
    allOffsets,
  );
  object.hideFromScreenCapture = reader.readBool(offsets[15]);
  object.isarId = id;
  object.keepWindowOpenOnUnfocus = reader.readBool(offsets[16]);
  object.lanInstantSync = reader.readBool(offsets[17]);
  object.lastReviewPromptDate = reader.readDateTimeOrNull(offsets[18]);
  object.launchAtStartup = reader.readBool(offsets[19]);
  object.layout =
      _IsarAppConfiglayoutValueEnumMap[reader.readStringOrNull(offsets[20])] ??
      AppLayout.grid;
  object.localAuthTimeoutMinutes = reader.readLong(offsets[21]);
  object.locale = reader.readString(offsets[22]);
  object.onBoardComplete = reader.readBool(offsets[23]);
  object.pasteStackHotkey = reader.readStringOrNull(offsets[24]);
  object.pausedTill = reader.readDateTimeOrNull(offsets[25]);
  object.pinned = reader.readBool(offsets[26]);
  object.quickPasteHotkey = reader.readStringOrNull(offsets[27]);
  object.reviewNeverAsk = reader.readBool(offsets[28]);
  object.reviewQualifyingEventCount = reader.readLong(offsets[29]);
  object.richDataCapture = reader.readBool(offsets[30]);
  object.searchIndexReady = reader.readBool(offsets[31]);
  object.showCollectionTip = reader.readBool(offsets[32]);
  object.showTrayIcon = reader.readBool(offsets[33]);
  object.smartPaste = reader.readBool(offsets[34]);
  object.sortBy =
      _IsarAppConfigsortByValueEnumMap[reader.readStringOrNull(offsets[35])] ??
      ClipboardSortKey.modified;
  object.sortOrder =
      _IsarAppConfigsortOrderValueEnumMap[reader.readStringOrNull(
        offsets[36],
      )] ??
      SortOrder.desc;
  object.syncSpeed =
      _IsarAppConfigsyncSpeedValueEnumMap[reader.readStringOrNull(
        offsets[37],
      )] ??
      SyncSpeed.balanced;
  object.themeColor = reader.readLong(offsets[38]);
  object.themeMode =
      _IsarAppConfigthemeModeValueEnumMap[reader.readStringOrNull(
        offsets[39],
      )] ??
      ThemeMode.system;
  object.themeVariant =
      _IsarAppConfigthemeVariantValueEnumMap[reader.readStringOrNull(
        offsets[40],
      )] ??
      DynamicSchemeVariant.tonalSpot;
  object.toggleHotkey = reader.readStringOrNull(offsets[41]);
  object.transformAsNewClip = reader.readBool(offsets[42]);
  object.useEncryptionNonce = reader.readBool(offsets[43]);
  object.view =
      _IsarAppConfigviewValueEnumMap[reader.readStringOrNull(offsets[44])] ??
      AppView.topDocked;
  object.windowHeight = reader.readDouble(offsets[45]);
  object.windowWidth = reader.readDouble(offsets[46]);
  return object;
}

P _isarAppConfigDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_IsarAppConfigactiveStorageProviderValueEnumMap[reader
                  .readStringOrNull(offset)] ??
              ActiveCloudStorageProvider.googleDrive)
          as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (_IsarAppConfigclipboardFeedbackModeValueEnumMap[reader
                  .readStringOrNull(offset)] ??
              ClipboardFeedbackMode.disabled)
          as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readObjectOrNull<IsarExclusionRules>(
            offset,
            IsarExclusionRulesSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (reader.readBool(offset)) as P;
    case 18:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 19:
      return (reader.readBool(offset)) as P;
    case 20:
      return (_IsarAppConfiglayoutValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              AppLayout.grid)
          as P;
    case 21:
      return (reader.readLong(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    case 23:
      return (reader.readBool(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 26:
      return (reader.readBool(offset)) as P;
    case 27:
      return (reader.readStringOrNull(offset)) as P;
    case 28:
      return (reader.readBool(offset)) as P;
    case 29:
      return (reader.readLong(offset)) as P;
    case 30:
      return (reader.readBool(offset)) as P;
    case 31:
      return (reader.readBool(offset)) as P;
    case 32:
      return (reader.readBool(offset)) as P;
    case 33:
      return (reader.readBool(offset)) as P;
    case 34:
      return (reader.readBool(offset)) as P;
    case 35:
      return (_IsarAppConfigsortByValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              ClipboardSortKey.modified)
          as P;
    case 36:
      return (_IsarAppConfigsortOrderValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              SortOrder.desc)
          as P;
    case 37:
      return (_IsarAppConfigsyncSpeedValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              SyncSpeed.balanced)
          as P;
    case 38:
      return (reader.readLong(offset)) as P;
    case 39:
      return (_IsarAppConfigthemeModeValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              ThemeMode.system)
          as P;
    case 40:
      return (_IsarAppConfigthemeVariantValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              DynamicSchemeVariant.tonalSpot)
          as P;
    case 41:
      return (reader.readStringOrNull(offset)) as P;
    case 42:
      return (reader.readBool(offset)) as P;
    case 43:
      return (reader.readBool(offset)) as P;
    case 44:
      return (_IsarAppConfigviewValueEnumMap[reader.readStringOrNull(offset)] ??
              AppView.topDocked)
          as P;
    case 45:
      return (reader.readDouble(offset)) as P;
    case 46:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarAppConfigactiveStorageProviderEnumValueMap = {
  r'googleDrive': r'googleDrive',
  r'webdav': r'webdav',
};
const _IsarAppConfigactiveStorageProviderValueEnumMap = {
  r'googleDrive': ActiveCloudStorageProvider.googleDrive,
  r'webdav': ActiveCloudStorageProvider.webdav,
};
const _IsarAppConfigclipboardFeedbackModeEnumValueMap = {
  r'disabled': r'disabled',
  r'copyOnly': r'copyOnly',
  r'syncOnly': r'syncOnly',
  r'copyAndSync': r'copyAndSync',
  r'toast': r'toast',
};
const _IsarAppConfigclipboardFeedbackModeValueEnumMap = {
  r'disabled': ClipboardFeedbackMode.disabled,
  r'copyOnly': ClipboardFeedbackMode.copyOnly,
  r'syncOnly': ClipboardFeedbackMode.syncOnly,
  r'copyAndSync': ClipboardFeedbackMode.copyAndSync,
  r'toast': ClipboardFeedbackMode.toast,
};
const _IsarAppConfiglayoutEnumValueMap = {r'grid': r'grid', r'list': r'list'};
const _IsarAppConfiglayoutValueEnumMap = {
  r'grid': AppLayout.grid,
  r'list': AppLayout.list,
};
const _IsarAppConfigsortByEnumValueMap = {
  r'modified': r'modified',
  r'created': r'created',
  r'lastCopied': r'lastCopied',
  r'copyCount': r'copyCount',
};
const _IsarAppConfigsortByValueEnumMap = {
  r'modified': ClipboardSortKey.modified,
  r'created': ClipboardSortKey.created,
  r'lastCopied': ClipboardSortKey.lastCopied,
  r'copyCount': ClipboardSortKey.copyCount,
};
const _IsarAppConfigsortOrderEnumValueMap = {r'desc': r'desc', r'asc': r'asc'};
const _IsarAppConfigsortOrderValueEnumMap = {
  r'desc': SortOrder.desc,
  r'asc': SortOrder.asc,
};
const _IsarAppConfigsyncSpeedEnumValueMap = {
  r'balanced': r'balanced',
  r'realtime': r'realtime',
};
const _IsarAppConfigsyncSpeedValueEnumMap = {
  r'balanced': SyncSpeed.balanced,
  r'realtime': SyncSpeed.realtime,
};
const _IsarAppConfigthemeModeEnumValueMap = {
  r'system': r'system',
  r'light': r'light',
  r'dark': r'dark',
};
const _IsarAppConfigthemeModeValueEnumMap = {
  r'system': ThemeMode.system,
  r'light': ThemeMode.light,
  r'dark': ThemeMode.dark,
};
const _IsarAppConfigthemeVariantEnumValueMap = {
  r'tonalSpot': r'tonalSpot',
  r'fidelity': r'fidelity',
  r'monochrome': r'monochrome',
  r'neutral': r'neutral',
  r'vibrant': r'vibrant',
  r'expressive': r'expressive',
  r'content': r'content',
  r'rainbow': r'rainbow',
  r'fruitSalad': r'fruitSalad',
};
const _IsarAppConfigthemeVariantValueEnumMap = {
  r'tonalSpot': DynamicSchemeVariant.tonalSpot,
  r'fidelity': DynamicSchemeVariant.fidelity,
  r'monochrome': DynamicSchemeVariant.monochrome,
  r'neutral': DynamicSchemeVariant.neutral,
  r'vibrant': DynamicSchemeVariant.vibrant,
  r'expressive': DynamicSchemeVariant.expressive,
  r'content': DynamicSchemeVariant.content,
  r'rainbow': DynamicSchemeVariant.rainbow,
  r'fruitSalad': DynamicSchemeVariant.fruitSalad,
};
const _IsarAppConfigviewEnumValueMap = {
  r'topDocked': r'topDocked',
  r'bottomDocked': r'bottomDocked',
  r'leftDocked': r'leftDocked',
  r'rightDocked': r'rightDocked',
  r'windowed': r'windowed',
};
const _IsarAppConfigviewValueEnumMap = {
  r'topDocked': AppView.topDocked,
  r'bottomDocked': AppView.bottomDocked,
  r'leftDocked': AppView.leftDocked,
  r'rightDocked': AppView.rightDocked,
  r'windowed': AppView.windowed,
};

Id _isarAppConfigGetId(IsarAppConfig object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _isarAppConfigGetLinks(IsarAppConfig object) {
  return [];
}

void _isarAppConfigAttach(
  IsarCollection<dynamic> col,
  Id id,
  IsarAppConfig object,
) {
  object.isarId = id;
}

extension IsarAppConfigQueryWhereSort
    on QueryBuilder<IsarAppConfig, IsarAppConfig, QWhere> {
  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarAppConfigQueryWhere
    on QueryBuilder<IsarAppConfig, IsarAppConfig, QWhereClause> {
  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterWhereClause> isarIdEqualTo(
    Id isarId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterWhereClause>
  isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterWhereClause>
  isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterWhereClause> isarIdLessThan(
    Id isarId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerIsarId,
          includeLower: includeLower,
          upper: upperIsarId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension IsarAppConfigQueryFilter
    on QueryBuilder<IsarAppConfig, IsarAppConfig, QFilterCondition> {
  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  activeStorageProviderEqualTo(
    ActiveCloudStorageProvider value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'activeStorageProvider',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  activeStorageProviderGreaterThan(
    ActiveCloudStorageProvider value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'activeStorageProvider',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  activeStorageProviderLessThan(
    ActiveCloudStorageProvider value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'activeStorageProvider',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  activeStorageProviderBetween(
    ActiveCloudStorageProvider lower,
    ActiveCloudStorageProvider upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'activeStorageProvider',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  activeStorageProviderStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'activeStorageProvider',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  activeStorageProviderEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'activeStorageProvider',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  activeStorageProviderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'activeStorageProvider',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  activeStorageProviderMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'activeStorageProvider',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  activeStorageProviderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'activeStorageProvider', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  activeStorageProviderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'activeStorageProvider',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  androidBgListenerEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'androidBgListener', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  autoEncryptEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'autoEncrypt', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  autoWriteOnReceiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'autoWriteOnReceive', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  clipboardFeedbackModeEqualTo(
    ClipboardFeedbackMode value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'clipboardFeedbackMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  clipboardFeedbackModeGreaterThan(
    ClipboardFeedbackMode value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'clipboardFeedbackMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  clipboardFeedbackModeLessThan(
    ClipboardFeedbackMode value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'clipboardFeedbackMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  clipboardFeedbackModeBetween(
    ClipboardFeedbackMode lower,
    ClipboardFeedbackMode upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'clipboardFeedbackMode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  clipboardFeedbackModeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'clipboardFeedbackMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  clipboardFeedbackModeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'clipboardFeedbackMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  clipboardFeedbackModeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'clipboardFeedbackMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  clipboardFeedbackModeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'clipboardFeedbackMode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  clipboardFeedbackModeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'clipboardFeedbackMode', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  clipboardFeedbackModeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'clipboardFeedbackMode',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  dontCopyOverEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dontCopyOver', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  dontCopyOverGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dontCopyOver',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  dontCopyOverLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dontCopyOver',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  dontCopyOverBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dontCopyOver',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  dontUploadOverEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dontUploadOver', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  dontUploadOverGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dontUploadOver',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  dontUploadOverLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dontUploadOver',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  dontUploadOverBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dontUploadOver',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  enableDragNDropEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'enableDragNDrop', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  enableFileSyncEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'enableFileSync', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  enableLocalAuthEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'enableLocalAuth', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  enablePasteStackEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'enablePasteStack', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  enableSyncEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'enableSync', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  enableTypeToSearchEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'enableTypeToSearch', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  enc2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'enc2'),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  enc2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'enc2'),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition> enc2EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'enc2',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  enc2GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'enc2',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  enc2LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'enc2',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition> enc2Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'enc2',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  enc2StartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'enc2',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  enc2EndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'enc2',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  enc2Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'enc2',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition> enc2Matches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'enc2',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  enc2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'enc2', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  enc2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'enc2', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  exclusionRulesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'exclusionRules'),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  exclusionRulesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'exclusionRules'),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  hideFromScreenCaptureEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'hideFromScreenCapture',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  isarIdGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'isarId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  isarIdLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'isarId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'isarId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  keepWindowOpenOnUnfocusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'keepWindowOpenOnUnfocus',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  lanInstantSyncEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lanInstantSync', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  lastReviewPromptDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastReviewPromptDate'),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  lastReviewPromptDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastReviewPromptDate'),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  lastReviewPromptDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lastReviewPromptDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  lastReviewPromptDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastReviewPromptDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  lastReviewPromptDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastReviewPromptDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  lastReviewPromptDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastReviewPromptDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  launchAtStartupEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'launchAtStartup', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  layoutEqualTo(AppLayout value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'layout',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  layoutGreaterThan(
    AppLayout value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'layout',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  layoutLessThan(
    AppLayout value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'layout',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  layoutBetween(
    AppLayout lower,
    AppLayout upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'layout',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  layoutStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'layout',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  layoutEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'layout',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  layoutContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'layout',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  layoutMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'layout',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  layoutIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'layout', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  layoutIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'layout', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  localAuthTimeoutMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'localAuthTimeoutMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  localAuthTimeoutMinutesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'localAuthTimeoutMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  localAuthTimeoutMinutesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'localAuthTimeoutMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  localAuthTimeoutMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'localAuthTimeoutMinutes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  localeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'locale',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  localeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'locale',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  localeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'locale',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  localeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'locale',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  localeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'locale',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  localeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'locale',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  localeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'locale',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  localeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'locale',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  localeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'locale', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  localeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'locale', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  onBoardCompleteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'onBoardComplete', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  pasteStackHotkeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pasteStackHotkey'),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  pasteStackHotkeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pasteStackHotkey'),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  pasteStackHotkeyEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pasteStackHotkey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  pasteStackHotkeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pasteStackHotkey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  pasteStackHotkeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pasteStackHotkey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  pasteStackHotkeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pasteStackHotkey',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  pasteStackHotkeyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'pasteStackHotkey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  pasteStackHotkeyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'pasteStackHotkey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  pasteStackHotkeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'pasteStackHotkey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  pasteStackHotkeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'pasteStackHotkey',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  pasteStackHotkeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pasteStackHotkey', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  pasteStackHotkeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'pasteStackHotkey', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  pausedTillIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pausedTill'),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  pausedTillIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pausedTill'),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  pausedTillEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pausedTill', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  pausedTillGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pausedTill',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  pausedTillLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pausedTill',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  pausedTillBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pausedTill',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  pinnedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pinned', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  quickPasteHotkeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'quickPasteHotkey'),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  quickPasteHotkeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'quickPasteHotkey'),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  quickPasteHotkeyEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'quickPasteHotkey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  quickPasteHotkeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'quickPasteHotkey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  quickPasteHotkeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'quickPasteHotkey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  quickPasteHotkeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'quickPasteHotkey',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  quickPasteHotkeyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'quickPasteHotkey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  quickPasteHotkeyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'quickPasteHotkey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  quickPasteHotkeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'quickPasteHotkey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  quickPasteHotkeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'quickPasteHotkey',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  quickPasteHotkeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'quickPasteHotkey', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  quickPasteHotkeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'quickPasteHotkey', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  reviewNeverAskEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'reviewNeverAsk', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  reviewQualifyingEventCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'reviewQualifyingEventCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  reviewQualifyingEventCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'reviewQualifyingEventCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  reviewQualifyingEventCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'reviewQualifyingEventCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  reviewQualifyingEventCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'reviewQualifyingEventCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  richDataCaptureEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'richDataCapture', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  searchIndexReadyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'searchIndexReady', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  showCollectionTipEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'showCollectionTip', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  showTrayIconEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'showTrayIcon', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  smartPasteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'smartPaste', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  sortByEqualTo(ClipboardSortKey value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sortBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  sortByGreaterThan(
    ClipboardSortKey value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sortBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  sortByLessThan(
    ClipboardSortKey value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sortBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  sortByBetween(
    ClipboardSortKey lower,
    ClipboardSortKey upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sortBy',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  sortByStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sortBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  sortByEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sortBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  sortByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sortBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  sortByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sortBy',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  sortByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sortBy', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  sortByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sortBy', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  sortOrderEqualTo(SortOrder value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sortOrder',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  sortOrderGreaterThan(
    SortOrder value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sortOrder',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  sortOrderLessThan(
    SortOrder value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sortOrder',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  sortOrderBetween(
    SortOrder lower,
    SortOrder upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sortOrder',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  sortOrderStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sortOrder',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  sortOrderEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sortOrder',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  sortOrderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sortOrder',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  sortOrderMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sortOrder',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  sortOrderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sortOrder', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  sortOrderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sortOrder', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  syncSpeedEqualTo(SyncSpeed value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'syncSpeed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  syncSpeedGreaterThan(
    SyncSpeed value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'syncSpeed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  syncSpeedLessThan(
    SyncSpeed value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'syncSpeed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  syncSpeedBetween(
    SyncSpeed lower,
    SyncSpeed upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'syncSpeed',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  syncSpeedStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'syncSpeed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  syncSpeedEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'syncSpeed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  syncSpeedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'syncSpeed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  syncSpeedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'syncSpeed',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  syncSpeedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncSpeed', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  syncSpeedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'syncSpeed', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeColorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'themeColor', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeColorGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'themeColor',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeColorLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'themeColor',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeColorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'themeColor',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeModeEqualTo(ThemeMode value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'themeMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeModeGreaterThan(
    ThemeMode value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'themeMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeModeLessThan(
    ThemeMode value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'themeMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeModeBetween(
    ThemeMode lower,
    ThemeMode upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'themeMode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeModeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'themeMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeModeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'themeMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeModeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'themeMode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeModeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'themeMode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeModeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'themeMode', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeModeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'themeMode', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeVariantEqualTo(DynamicSchemeVariant value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'themeVariant',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeVariantGreaterThan(
    DynamicSchemeVariant value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'themeVariant',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeVariantLessThan(
    DynamicSchemeVariant value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'themeVariant',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeVariantBetween(
    DynamicSchemeVariant lower,
    DynamicSchemeVariant upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'themeVariant',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeVariantStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'themeVariant',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeVariantEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'themeVariant',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeVariantContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'themeVariant',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeVariantMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'themeVariant',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeVariantIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'themeVariant', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  themeVariantIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'themeVariant', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  toggleHotkeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'toggleHotkey'),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  toggleHotkeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'toggleHotkey'),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  toggleHotkeyEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'toggleHotkey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  toggleHotkeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'toggleHotkey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  toggleHotkeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'toggleHotkey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  toggleHotkeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'toggleHotkey',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  toggleHotkeyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'toggleHotkey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  toggleHotkeyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'toggleHotkey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  toggleHotkeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'toggleHotkey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  toggleHotkeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'toggleHotkey',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  toggleHotkeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'toggleHotkey', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  toggleHotkeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'toggleHotkey', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  transformAsNewClipEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'transformAsNewClip', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  useEncryptionNonceEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'useEncryptionNonce', value: value),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition> viewEqualTo(
    AppView value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'view',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  viewGreaterThan(
    AppView value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'view',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  viewLessThan(
    AppView value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'view',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition> viewBetween(
    AppView lower,
    AppView upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'view',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  viewStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'view',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  viewEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'view',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  viewContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'view',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition> viewMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'view',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  viewIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'view', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  viewIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'view', value: ''),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  windowHeightEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'windowHeight',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  windowHeightGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'windowHeight',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  windowHeightLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'windowHeight',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  windowHeightBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'windowHeight',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  windowWidthEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'windowWidth',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  windowWidthGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'windowWidth',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  windowWidthLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'windowWidth',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  windowWidthBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'windowWidth',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }
}

extension IsarAppConfigQueryObject
    on QueryBuilder<IsarAppConfig, IsarAppConfig, QFilterCondition> {
  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterFilterCondition>
  exclusionRules(FilterQuery<IsarExclusionRules> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'exclusionRules');
    });
  }
}

extension IsarAppConfigQueryLinks
    on QueryBuilder<IsarAppConfig, IsarAppConfig, QFilterCondition> {}

extension IsarAppConfigQuerySortBy
    on QueryBuilder<IsarAppConfig, IsarAppConfig, QSortBy> {
  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByActiveStorageProvider() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeStorageProvider', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByActiveStorageProviderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeStorageProvider', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByAndroidBgListener() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'androidBgListener', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByAndroidBgListenerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'androidBgListener', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortByAutoEncrypt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoEncrypt', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByAutoEncryptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoEncrypt', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByAutoWriteOnReceive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoWriteOnReceive', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByAutoWriteOnReceiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoWriteOnReceive', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByClipboardFeedbackMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clipboardFeedbackMode', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByClipboardFeedbackModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clipboardFeedbackMode', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByDontCopyOver() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dontCopyOver', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByDontCopyOverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dontCopyOver', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByDontUploadOver() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dontUploadOver', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByDontUploadOverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dontUploadOver', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByEnableDragNDrop() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableDragNDrop', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByEnableDragNDropDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableDragNDrop', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByEnableFileSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableFileSync', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByEnableFileSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableFileSync', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByEnableLocalAuth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableLocalAuth', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByEnableLocalAuthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableLocalAuth', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByEnablePasteStack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enablePasteStack', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByEnablePasteStackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enablePasteStack', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortByEnableSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableSync', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByEnableSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableSync', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByEnableTypeToSearch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableTypeToSearch', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByEnableTypeToSearchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableTypeToSearch', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortByEnc2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enc2', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortByEnc2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enc2', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByHideFromScreenCapture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideFromScreenCapture', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByHideFromScreenCaptureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideFromScreenCapture', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByKeepWindowOpenOnUnfocus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepWindowOpenOnUnfocus', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByKeepWindowOpenOnUnfocusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepWindowOpenOnUnfocus', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByLanInstantSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lanInstantSync', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByLanInstantSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lanInstantSync', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByLastReviewPromptDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewPromptDate', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByLastReviewPromptDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewPromptDate', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByLaunchAtStartup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'launchAtStartup', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByLaunchAtStartupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'launchAtStartup', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortByLayout() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layout', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortByLayoutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layout', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByLocalAuthTimeoutMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localAuthTimeoutMinutes', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByLocalAuthTimeoutMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localAuthTimeoutMinutes', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortByLocale() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locale', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortByLocaleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locale', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByOnBoardComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onBoardComplete', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByOnBoardCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onBoardComplete', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByPasteStackHotkey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pasteStackHotkey', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByPasteStackHotkeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pasteStackHotkey', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortByPausedTill() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pausedTill', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByPausedTillDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pausedTill', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortByPinned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinned', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortByPinnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinned', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByQuickPasteHotkey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quickPasteHotkey', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByQuickPasteHotkeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quickPasteHotkey', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByReviewNeverAsk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewNeverAsk', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByReviewNeverAskDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewNeverAsk', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByReviewQualifyingEventCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewQualifyingEventCount', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByReviewQualifyingEventCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewQualifyingEventCount', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByRichDataCapture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'richDataCapture', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByRichDataCaptureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'richDataCapture', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortBySearchIndexReady() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchIndexReady', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortBySearchIndexReadyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchIndexReady', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByShowCollectionTip() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showCollectionTip', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByShowCollectionTipDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showCollectionTip', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByShowTrayIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showTrayIcon', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByShowTrayIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showTrayIcon', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortBySmartPaste() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartPaste', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortBySmartPasteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartPaste', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortBySortBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortBy', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortBySortByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortBy', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortBySortOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortBySortOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortBySyncSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncSpeed', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortBySyncSpeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncSpeed', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortByThemeColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeColor', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByThemeColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeColor', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByThemeModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByThemeVariant() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeVariant', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByThemeVariantDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeVariant', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByToggleHotkey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toggleHotkey', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByToggleHotkeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toggleHotkey', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByTransformAsNewClip() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transformAsNewClip', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByTransformAsNewClipDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transformAsNewClip', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByUseEncryptionNonce() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'useEncryptionNonce', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByUseEncryptionNonceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'useEncryptionNonce', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortByView() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'view', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortByViewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'view', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByWindowHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windowHeight', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByWindowHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windowHeight', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> sortByWindowWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windowWidth', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  sortByWindowWidthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windowWidth', Sort.desc);
    });
  }
}

extension IsarAppConfigQuerySortThenBy
    on QueryBuilder<IsarAppConfig, IsarAppConfig, QSortThenBy> {
  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByActiveStorageProvider() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeStorageProvider', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByActiveStorageProviderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeStorageProvider', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByAndroidBgListener() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'androidBgListener', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByAndroidBgListenerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'androidBgListener', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenByAutoEncrypt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoEncrypt', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByAutoEncryptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoEncrypt', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByAutoWriteOnReceive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoWriteOnReceive', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByAutoWriteOnReceiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoWriteOnReceive', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByClipboardFeedbackMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clipboardFeedbackMode', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByClipboardFeedbackModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clipboardFeedbackMode', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByDontCopyOver() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dontCopyOver', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByDontCopyOverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dontCopyOver', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByDontUploadOver() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dontUploadOver', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByDontUploadOverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dontUploadOver', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByEnableDragNDrop() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableDragNDrop', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByEnableDragNDropDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableDragNDrop', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByEnableFileSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableFileSync', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByEnableFileSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableFileSync', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByEnableLocalAuth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableLocalAuth', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByEnableLocalAuthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableLocalAuth', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByEnablePasteStack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enablePasteStack', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByEnablePasteStackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enablePasteStack', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenByEnableSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableSync', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByEnableSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableSync', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByEnableTypeToSearch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableTypeToSearch', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByEnableTypeToSearchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableTypeToSearch', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenByEnc2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enc2', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenByEnc2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enc2', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByHideFromScreenCapture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideFromScreenCapture', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByHideFromScreenCaptureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideFromScreenCapture', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByKeepWindowOpenOnUnfocus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepWindowOpenOnUnfocus', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByKeepWindowOpenOnUnfocusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keepWindowOpenOnUnfocus', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByLanInstantSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lanInstantSync', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByLanInstantSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lanInstantSync', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByLastReviewPromptDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewPromptDate', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByLastReviewPromptDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewPromptDate', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByLaunchAtStartup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'launchAtStartup', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByLaunchAtStartupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'launchAtStartup', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenByLayout() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layout', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenByLayoutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layout', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByLocalAuthTimeoutMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localAuthTimeoutMinutes', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByLocalAuthTimeoutMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localAuthTimeoutMinutes', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenByLocale() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locale', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenByLocaleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locale', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByOnBoardComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onBoardComplete', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByOnBoardCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onBoardComplete', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByPasteStackHotkey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pasteStackHotkey', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByPasteStackHotkeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pasteStackHotkey', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenByPausedTill() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pausedTill', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByPausedTillDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pausedTill', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenByPinned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinned', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenByPinnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinned', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByQuickPasteHotkey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quickPasteHotkey', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByQuickPasteHotkeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quickPasteHotkey', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByReviewNeverAsk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewNeverAsk', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByReviewNeverAskDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewNeverAsk', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByReviewQualifyingEventCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewQualifyingEventCount', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByReviewQualifyingEventCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewQualifyingEventCount', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByRichDataCapture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'richDataCapture', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByRichDataCaptureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'richDataCapture', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenBySearchIndexReady() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchIndexReady', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenBySearchIndexReadyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchIndexReady', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByShowCollectionTip() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showCollectionTip', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByShowCollectionTipDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showCollectionTip', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByShowTrayIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showTrayIcon', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByShowTrayIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showTrayIcon', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenBySmartPaste() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartPaste', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenBySmartPasteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartPaste', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenBySortBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortBy', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenBySortByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortBy', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenBySortOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenBySortOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenBySyncSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncSpeed', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenBySyncSpeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncSpeed', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenByThemeColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeColor', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByThemeColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeColor', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByThemeModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByThemeVariant() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeVariant', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByThemeVariantDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeVariant', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByToggleHotkey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toggleHotkey', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByToggleHotkeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toggleHotkey', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByTransformAsNewClip() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transformAsNewClip', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByTransformAsNewClipDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transformAsNewClip', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByUseEncryptionNonce() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'useEncryptionNonce', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByUseEncryptionNonceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'useEncryptionNonce', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenByView() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'view', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenByViewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'view', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByWindowHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windowHeight', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByWindowHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windowHeight', Sort.desc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy> thenByWindowWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windowWidth', Sort.asc);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QAfterSortBy>
  thenByWindowWidthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windowWidth', Sort.desc);
    });
  }
}

extension IsarAppConfigQueryWhereDistinct
    on QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct> {
  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByActiveStorageProvider({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'activeStorageProvider',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByAndroidBgListener() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'androidBgListener');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByAutoEncrypt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'autoEncrypt');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByAutoWriteOnReceive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'autoWriteOnReceive');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByClipboardFeedbackMode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'clipboardFeedbackMode',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByDontCopyOver() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dontCopyOver');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByDontUploadOver() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dontUploadOver');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByEnableDragNDrop() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableDragNDrop');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByEnableFileSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableFileSync');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByEnableLocalAuth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableLocalAuth');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByEnablePasteStack() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enablePasteStack');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct> distinctByEnableSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableSync');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByEnableTypeToSearch() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableTypeToSearch');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct> distinctByEnc2({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enc2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByHideFromScreenCapture() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hideFromScreenCapture');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByKeepWindowOpenOnUnfocus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'keepWindowOpenOnUnfocus');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByLanInstantSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lanInstantSync');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByLastReviewPromptDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastReviewPromptDate');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByLaunchAtStartup() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'launchAtStartup');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct> distinctByLayout({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'layout', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByLocalAuthTimeoutMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localAuthTimeoutMinutes');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct> distinctByLocale({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locale', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByOnBoardComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onBoardComplete');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByPasteStackHotkey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'pasteStackHotkey',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct> distinctByPausedTill() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pausedTill');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct> distinctByPinned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pinned');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByQuickPasteHotkey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'quickPasteHotkey',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByReviewNeverAsk() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reviewNeverAsk');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByReviewQualifyingEventCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reviewQualifyingEventCount');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByRichDataCapture() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'richDataCapture');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctBySearchIndexReady() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'searchIndexReady');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByShowCollectionTip() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showCollectionTip');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByShowTrayIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showTrayIcon');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct> distinctBySmartPaste() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'smartPaste');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct> distinctBySortBy({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sortBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct> distinctBySortOrder({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sortOrder', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct> distinctBySyncSpeed({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncSpeed', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct> distinctByThemeColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'themeColor');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct> distinctByThemeMode({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'themeMode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct> distinctByThemeVariant({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'themeVariant', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct> distinctByToggleHotkey({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toggleHotkey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByTransformAsNewClip() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transformAsNewClip');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByUseEncryptionNonce() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'useEncryptionNonce');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct> distinctByView({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'view', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByWindowHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'windowHeight');
    });
  }

  QueryBuilder<IsarAppConfig, IsarAppConfig, QDistinct>
  distinctByWindowWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'windowWidth');
    });
  }
}

extension IsarAppConfigQueryProperty
    on QueryBuilder<IsarAppConfig, IsarAppConfig, QQueryProperty> {
  QueryBuilder<IsarAppConfig, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<IsarAppConfig, ActiveCloudStorageProvider, QQueryOperations>
  activeStorageProviderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeStorageProvider');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations>
  androidBgListenerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'androidBgListener');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations> autoEncryptProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoEncrypt');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations>
  autoWriteOnReceiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoWriteOnReceive');
    });
  }

  QueryBuilder<IsarAppConfig, ClipboardFeedbackMode, QQueryOperations>
  clipboardFeedbackModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clipboardFeedbackMode');
    });
  }

  QueryBuilder<IsarAppConfig, int, QQueryOperations> dontCopyOverProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dontCopyOver');
    });
  }

  QueryBuilder<IsarAppConfig, int, QQueryOperations> dontUploadOverProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dontUploadOver');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations>
  enableDragNDropProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableDragNDrop');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations> enableFileSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableFileSync');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations>
  enableLocalAuthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableLocalAuth');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations>
  enablePasteStackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enablePasteStack');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations> enableSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableSync');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations>
  enableTypeToSearchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableTypeToSearch');
    });
  }

  QueryBuilder<IsarAppConfig, String?, QQueryOperations> enc2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enc2');
    });
  }

  QueryBuilder<IsarAppConfig, IsarExclusionRules?, QQueryOperations>
  exclusionRulesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exclusionRules');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations>
  hideFromScreenCaptureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hideFromScreenCapture');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations>
  keepWindowOpenOnUnfocusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keepWindowOpenOnUnfocus');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations> lanInstantSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lanInstantSync');
    });
  }

  QueryBuilder<IsarAppConfig, DateTime?, QQueryOperations>
  lastReviewPromptDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastReviewPromptDate');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations>
  launchAtStartupProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'launchAtStartup');
    });
  }

  QueryBuilder<IsarAppConfig, AppLayout, QQueryOperations> layoutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'layout');
    });
  }

  QueryBuilder<IsarAppConfig, int, QQueryOperations>
  localAuthTimeoutMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localAuthTimeoutMinutes');
    });
  }

  QueryBuilder<IsarAppConfig, String, QQueryOperations> localeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locale');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations>
  onBoardCompleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onBoardComplete');
    });
  }

  QueryBuilder<IsarAppConfig, String?, QQueryOperations>
  pasteStackHotkeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pasteStackHotkey');
    });
  }

  QueryBuilder<IsarAppConfig, DateTime?, QQueryOperations>
  pausedTillProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pausedTill');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations> pinnedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pinned');
    });
  }

  QueryBuilder<IsarAppConfig, String?, QQueryOperations>
  quickPasteHotkeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quickPasteHotkey');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations> reviewNeverAskProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reviewNeverAsk');
    });
  }

  QueryBuilder<IsarAppConfig, int, QQueryOperations>
  reviewQualifyingEventCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reviewQualifyingEventCount');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations>
  richDataCaptureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'richDataCapture');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations>
  searchIndexReadyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'searchIndexReady');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations>
  showCollectionTipProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showCollectionTip');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations> showTrayIconProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showTrayIcon');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations> smartPasteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'smartPaste');
    });
  }

  QueryBuilder<IsarAppConfig, ClipboardSortKey, QQueryOperations>
  sortByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sortBy');
    });
  }

  QueryBuilder<IsarAppConfig, SortOrder, QQueryOperations> sortOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sortOrder');
    });
  }

  QueryBuilder<IsarAppConfig, SyncSpeed, QQueryOperations> syncSpeedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncSpeed');
    });
  }

  QueryBuilder<IsarAppConfig, int, QQueryOperations> themeColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'themeColor');
    });
  }

  QueryBuilder<IsarAppConfig, ThemeMode, QQueryOperations> themeModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'themeMode');
    });
  }

  QueryBuilder<IsarAppConfig, DynamicSchemeVariant, QQueryOperations>
  themeVariantProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'themeVariant');
    });
  }

  QueryBuilder<IsarAppConfig, String?, QQueryOperations>
  toggleHotkeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toggleHotkey');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations>
  transformAsNewClipProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transformAsNewClip');
    });
  }

  QueryBuilder<IsarAppConfig, bool, QQueryOperations>
  useEncryptionNonceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'useEncryptionNonce');
    });
  }

  QueryBuilder<IsarAppConfig, AppView, QQueryOperations> viewProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'view');
    });
  }

  QueryBuilder<IsarAppConfig, double, QQueryOperations> windowHeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'windowHeight');
    });
  }

  QueryBuilder<IsarAppConfig, double, QQueryOperations> windowWidthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'windowWidth');
    });
  }
}
