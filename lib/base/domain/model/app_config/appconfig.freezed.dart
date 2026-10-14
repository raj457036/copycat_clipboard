// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appconfig.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppConfig {

@JsonKey(includeToJson: false, includeFromJson: false) int? get id; ThemeMode get themeMode; bool get enableSync; bool get enableFileSync; ActiveCloudStorageProvider get activeStorageProvider; AppLayout get layout; AppView get view; bool get pinned; double get windowWidth; double get windowHeight; ClipboardSortKey get sortBy; SortOrder get sortOrder;/// will prevent auto upload for files over 10 MB
 int get dontUploadOver;/// will prevent auto copy for files over 10 MB
 int get dontCopyOver;/// Pause auto copy for till pausedTill is reached.
 DateTime? get pausedTill; SyncSpeed get syncSpeed; String? get toggleHotkey; String? get quickPasteHotkey; String? get pasteStackHotkey;/// If enabled, the primary action on clips will be smartly selected.
/// The primary action will be paste, which will directly paste the clip
/// to the last focused cursor in the last window, and the clipboard will minimize.
 bool get smartPaste;/// If enabled, losing focus keeps the window open in the background
/// instead of hiding it automatically.
 bool get keepWindowOpenOnUnfocus;/// If enabled, transformed clips will be saved as new clips instead of
/// being copied/pasted immediately.
 bool get transformAsNewClip;/// Controls the feedback shown when a clip is captured or received.
@JsonKey(fromJson: _feedbackModeFromJson, toJson: _feedbackModeToJson) ClipboardFeedbackMode get clipboardFeedbackMode;/// If enabled, search runs while the user types in the search box.
 bool get enableTypeToSearch;/// If enabled, the application will automatically start at startup.
 bool get launchAtStartup; String get locale; String? get enc2; bool get autoEncrypt; bool get useEncryptionNonce; bool get hideFromScreenCapture;@JsonKey(includeFromJson: false, includeToJson: false) ExclusionRules? get exclusionRules; bool get enableLocalAuth; int get localAuthTimeoutMinutes; int get themeColor; DynamicSchemeVariant get themeVariant; bool get showCollectionTip; bool get searchIndexReady; bool get enableDragNDrop; bool get enablePasteStack; bool get androidBgListener; bool get richDataCapture; bool get lanInstantSync; bool get autoWriteOnReceive; bool get showTrayIcon; bool get onBoardComplete; int get reviewQualifyingEventCount; DateTime? get lastReviewPromptDate; bool get reviewNeverAsk;/// last focus window id
@JsonKey(includeFromJson: false, includeToJson: false) int? get lastFocusedWindowId;@JsonKey(includeFromJson: false, includeToJson: false) bool get clockUnSynced;
/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigCopyWith<AppConfig> get copyWith => _$AppConfigCopyWithImpl<AppConfig>(this as AppConfig, _$identity);

  /// Serializes this AppConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfig&&(identical(other.id, id) || other.id == id)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.enableSync, enableSync) || other.enableSync == enableSync)&&(identical(other.enableFileSync, enableFileSync) || other.enableFileSync == enableFileSync)&&(identical(other.activeStorageProvider, activeStorageProvider) || other.activeStorageProvider == activeStorageProvider)&&(identical(other.layout, layout) || other.layout == layout)&&(identical(other.view, view) || other.view == view)&&(identical(other.pinned, pinned) || other.pinned == pinned)&&(identical(other.windowWidth, windowWidth) || other.windowWidth == windowWidth)&&(identical(other.windowHeight, windowHeight) || other.windowHeight == windowHeight)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.dontUploadOver, dontUploadOver) || other.dontUploadOver == dontUploadOver)&&(identical(other.dontCopyOver, dontCopyOver) || other.dontCopyOver == dontCopyOver)&&(identical(other.pausedTill, pausedTill) || other.pausedTill == pausedTill)&&(identical(other.syncSpeed, syncSpeed) || other.syncSpeed == syncSpeed)&&(identical(other.toggleHotkey, toggleHotkey) || other.toggleHotkey == toggleHotkey)&&(identical(other.quickPasteHotkey, quickPasteHotkey) || other.quickPasteHotkey == quickPasteHotkey)&&(identical(other.pasteStackHotkey, pasteStackHotkey) || other.pasteStackHotkey == pasteStackHotkey)&&(identical(other.smartPaste, smartPaste) || other.smartPaste == smartPaste)&&(identical(other.keepWindowOpenOnUnfocus, keepWindowOpenOnUnfocus) || other.keepWindowOpenOnUnfocus == keepWindowOpenOnUnfocus)&&(identical(other.transformAsNewClip, transformAsNewClip) || other.transformAsNewClip == transformAsNewClip)&&(identical(other.clipboardFeedbackMode, clipboardFeedbackMode) || other.clipboardFeedbackMode == clipboardFeedbackMode)&&(identical(other.enableTypeToSearch, enableTypeToSearch) || other.enableTypeToSearch == enableTypeToSearch)&&(identical(other.launchAtStartup, launchAtStartup) || other.launchAtStartup == launchAtStartup)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.enc2, enc2) || other.enc2 == enc2)&&(identical(other.autoEncrypt, autoEncrypt) || other.autoEncrypt == autoEncrypt)&&(identical(other.useEncryptionNonce, useEncryptionNonce) || other.useEncryptionNonce == useEncryptionNonce)&&(identical(other.hideFromScreenCapture, hideFromScreenCapture) || other.hideFromScreenCapture == hideFromScreenCapture)&&(identical(other.exclusionRules, exclusionRules) || other.exclusionRules == exclusionRules)&&(identical(other.enableLocalAuth, enableLocalAuth) || other.enableLocalAuth == enableLocalAuth)&&(identical(other.localAuthTimeoutMinutes, localAuthTimeoutMinutes) || other.localAuthTimeoutMinutes == localAuthTimeoutMinutes)&&(identical(other.themeColor, themeColor) || other.themeColor == themeColor)&&(identical(other.themeVariant, themeVariant) || other.themeVariant == themeVariant)&&(identical(other.showCollectionTip, showCollectionTip) || other.showCollectionTip == showCollectionTip)&&(identical(other.searchIndexReady, searchIndexReady) || other.searchIndexReady == searchIndexReady)&&(identical(other.enableDragNDrop, enableDragNDrop) || other.enableDragNDrop == enableDragNDrop)&&(identical(other.enablePasteStack, enablePasteStack) || other.enablePasteStack == enablePasteStack)&&(identical(other.androidBgListener, androidBgListener) || other.androidBgListener == androidBgListener)&&(identical(other.richDataCapture, richDataCapture) || other.richDataCapture == richDataCapture)&&(identical(other.lanInstantSync, lanInstantSync) || other.lanInstantSync == lanInstantSync)&&(identical(other.autoWriteOnReceive, autoWriteOnReceive) || other.autoWriteOnReceive == autoWriteOnReceive)&&(identical(other.showTrayIcon, showTrayIcon) || other.showTrayIcon == showTrayIcon)&&(identical(other.onBoardComplete, onBoardComplete) || other.onBoardComplete == onBoardComplete)&&(identical(other.reviewQualifyingEventCount, reviewQualifyingEventCount) || other.reviewQualifyingEventCount == reviewQualifyingEventCount)&&(identical(other.lastReviewPromptDate, lastReviewPromptDate) || other.lastReviewPromptDate == lastReviewPromptDate)&&(identical(other.reviewNeverAsk, reviewNeverAsk) || other.reviewNeverAsk == reviewNeverAsk)&&(identical(other.lastFocusedWindowId, lastFocusedWindowId) || other.lastFocusedWindowId == lastFocusedWindowId)&&(identical(other.clockUnSynced, clockUnSynced) || other.clockUnSynced == clockUnSynced));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,themeMode,enableSync,enableFileSync,activeStorageProvider,layout,view,pinned,windowWidth,windowHeight,sortBy,sortOrder,dontUploadOver,dontCopyOver,pausedTill,syncSpeed,toggleHotkey,quickPasteHotkey,pasteStackHotkey,smartPaste,keepWindowOpenOnUnfocus,transformAsNewClip,clipboardFeedbackMode,enableTypeToSearch,launchAtStartup,locale,enc2,autoEncrypt,useEncryptionNonce,hideFromScreenCapture,exclusionRules,enableLocalAuth,localAuthTimeoutMinutes,themeColor,themeVariant,showCollectionTip,searchIndexReady,enableDragNDrop,enablePasteStack,androidBgListener,richDataCapture,lanInstantSync,autoWriteOnReceive,showTrayIcon,onBoardComplete,reviewQualifyingEventCount,lastReviewPromptDate,reviewNeverAsk,lastFocusedWindowId,clockUnSynced]);

@override
String toString() {
  return 'AppConfig(id: $id, themeMode: $themeMode, enableSync: $enableSync, enableFileSync: $enableFileSync, activeStorageProvider: $activeStorageProvider, layout: $layout, view: $view, pinned: $pinned, windowWidth: $windowWidth, windowHeight: $windowHeight, sortBy: $sortBy, sortOrder: $sortOrder, dontUploadOver: $dontUploadOver, dontCopyOver: $dontCopyOver, pausedTill: $pausedTill, syncSpeed: $syncSpeed, toggleHotkey: $toggleHotkey, quickPasteHotkey: $quickPasteHotkey, pasteStackHotkey: $pasteStackHotkey, smartPaste: $smartPaste, keepWindowOpenOnUnfocus: $keepWindowOpenOnUnfocus, transformAsNewClip: $transformAsNewClip, clipboardFeedbackMode: $clipboardFeedbackMode, enableTypeToSearch: $enableTypeToSearch, launchAtStartup: $launchAtStartup, locale: $locale, enc2: $enc2, autoEncrypt: $autoEncrypt, useEncryptionNonce: $useEncryptionNonce, hideFromScreenCapture: $hideFromScreenCapture, exclusionRules: $exclusionRules, enableLocalAuth: $enableLocalAuth, localAuthTimeoutMinutes: $localAuthTimeoutMinutes, themeColor: $themeColor, themeVariant: $themeVariant, showCollectionTip: $showCollectionTip, searchIndexReady: $searchIndexReady, enableDragNDrop: $enableDragNDrop, enablePasteStack: $enablePasteStack, androidBgListener: $androidBgListener, richDataCapture: $richDataCapture, lanInstantSync: $lanInstantSync, autoWriteOnReceive: $autoWriteOnReceive, showTrayIcon: $showTrayIcon, onBoardComplete: $onBoardComplete, reviewQualifyingEventCount: $reviewQualifyingEventCount, lastReviewPromptDate: $lastReviewPromptDate, reviewNeverAsk: $reviewNeverAsk, lastFocusedWindowId: $lastFocusedWindowId, clockUnSynced: $clockUnSynced)';
}


}

/// @nodoc
abstract mixin class $AppConfigCopyWith<$Res>  {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) _then) = _$AppConfigCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false, includeFromJson: false) int? id, ThemeMode themeMode, bool enableSync, bool enableFileSync, ActiveCloudStorageProvider activeStorageProvider, AppLayout layout, AppView view, bool pinned, double windowWidth, double windowHeight, ClipboardSortKey sortBy, SortOrder sortOrder, int dontUploadOver, int dontCopyOver, DateTime? pausedTill, SyncSpeed syncSpeed, String? toggleHotkey, String? quickPasteHotkey, String? pasteStackHotkey, bool smartPaste, bool keepWindowOpenOnUnfocus, bool transformAsNewClip,@JsonKey(fromJson: _feedbackModeFromJson, toJson: _feedbackModeToJson) ClipboardFeedbackMode clipboardFeedbackMode, bool enableTypeToSearch, bool launchAtStartup, String locale, String? enc2, bool autoEncrypt, bool useEncryptionNonce, bool hideFromScreenCapture,@JsonKey(includeFromJson: false, includeToJson: false) ExclusionRules? exclusionRules, bool enableLocalAuth, int localAuthTimeoutMinutes, int themeColor, DynamicSchemeVariant themeVariant, bool showCollectionTip, bool searchIndexReady, bool enableDragNDrop, bool enablePasteStack, bool androidBgListener, bool richDataCapture, bool lanInstantSync, bool autoWriteOnReceive, bool showTrayIcon, bool onBoardComplete, int reviewQualifyingEventCount, DateTime? lastReviewPromptDate, bool reviewNeverAsk,@JsonKey(includeFromJson: false, includeToJson: false) int? lastFocusedWindowId,@JsonKey(includeFromJson: false, includeToJson: false) bool clockUnSynced
});


$ExclusionRulesCopyWith<$Res>? get exclusionRules;

}
/// @nodoc
class _$AppConfigCopyWithImpl<$Res>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._self, this._then);

  final AppConfig _self;
  final $Res Function(AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? themeMode = null,Object? enableSync = null,Object? enableFileSync = null,Object? activeStorageProvider = null,Object? layout = null,Object? view = null,Object? pinned = null,Object? windowWidth = null,Object? windowHeight = null,Object? sortBy = null,Object? sortOrder = null,Object? dontUploadOver = null,Object? dontCopyOver = null,Object? pausedTill = freezed,Object? syncSpeed = null,Object? toggleHotkey = freezed,Object? quickPasteHotkey = freezed,Object? pasteStackHotkey = freezed,Object? smartPaste = null,Object? keepWindowOpenOnUnfocus = null,Object? transformAsNewClip = null,Object? clipboardFeedbackMode = null,Object? enableTypeToSearch = null,Object? launchAtStartup = null,Object? locale = null,Object? enc2 = freezed,Object? autoEncrypt = null,Object? useEncryptionNonce = null,Object? hideFromScreenCapture = null,Object? exclusionRules = freezed,Object? enableLocalAuth = null,Object? localAuthTimeoutMinutes = null,Object? themeColor = null,Object? themeVariant = null,Object? showCollectionTip = null,Object? searchIndexReady = null,Object? enableDragNDrop = null,Object? enablePasteStack = null,Object? androidBgListener = null,Object? richDataCapture = null,Object? lanInstantSync = null,Object? autoWriteOnReceive = null,Object? showTrayIcon = null,Object? onBoardComplete = null,Object? reviewQualifyingEventCount = null,Object? lastReviewPromptDate = freezed,Object? reviewNeverAsk = null,Object? lastFocusedWindowId = freezed,Object? clockUnSynced = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,enableSync: null == enableSync ? _self.enableSync : enableSync // ignore: cast_nullable_to_non_nullable
as bool,enableFileSync: null == enableFileSync ? _self.enableFileSync : enableFileSync // ignore: cast_nullable_to_non_nullable
as bool,activeStorageProvider: null == activeStorageProvider ? _self.activeStorageProvider : activeStorageProvider // ignore: cast_nullable_to_non_nullable
as ActiveCloudStorageProvider,layout: null == layout ? _self.layout : layout // ignore: cast_nullable_to_non_nullable
as AppLayout,view: null == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as AppView,pinned: null == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool,windowWidth: null == windowWidth ? _self.windowWidth : windowWidth // ignore: cast_nullable_to_non_nullable
as double,windowHeight: null == windowHeight ? _self.windowHeight : windowHeight // ignore: cast_nullable_to_non_nullable
as double,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as ClipboardSortKey,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as SortOrder,dontUploadOver: null == dontUploadOver ? _self.dontUploadOver : dontUploadOver // ignore: cast_nullable_to_non_nullable
as int,dontCopyOver: null == dontCopyOver ? _self.dontCopyOver : dontCopyOver // ignore: cast_nullable_to_non_nullable
as int,pausedTill: freezed == pausedTill ? _self.pausedTill : pausedTill // ignore: cast_nullable_to_non_nullable
as DateTime?,syncSpeed: null == syncSpeed ? _self.syncSpeed : syncSpeed // ignore: cast_nullable_to_non_nullable
as SyncSpeed,toggleHotkey: freezed == toggleHotkey ? _self.toggleHotkey : toggleHotkey // ignore: cast_nullable_to_non_nullable
as String?,quickPasteHotkey: freezed == quickPasteHotkey ? _self.quickPasteHotkey : quickPasteHotkey // ignore: cast_nullable_to_non_nullable
as String?,pasteStackHotkey: freezed == pasteStackHotkey ? _self.pasteStackHotkey : pasteStackHotkey // ignore: cast_nullable_to_non_nullable
as String?,smartPaste: null == smartPaste ? _self.smartPaste : smartPaste // ignore: cast_nullable_to_non_nullable
as bool,keepWindowOpenOnUnfocus: null == keepWindowOpenOnUnfocus ? _self.keepWindowOpenOnUnfocus : keepWindowOpenOnUnfocus // ignore: cast_nullable_to_non_nullable
as bool,transformAsNewClip: null == transformAsNewClip ? _self.transformAsNewClip : transformAsNewClip // ignore: cast_nullable_to_non_nullable
as bool,clipboardFeedbackMode: null == clipboardFeedbackMode ? _self.clipboardFeedbackMode : clipboardFeedbackMode // ignore: cast_nullable_to_non_nullable
as ClipboardFeedbackMode,enableTypeToSearch: null == enableTypeToSearch ? _self.enableTypeToSearch : enableTypeToSearch // ignore: cast_nullable_to_non_nullable
as bool,launchAtStartup: null == launchAtStartup ? _self.launchAtStartup : launchAtStartup // ignore: cast_nullable_to_non_nullable
as bool,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,enc2: freezed == enc2 ? _self.enc2 : enc2 // ignore: cast_nullable_to_non_nullable
as String?,autoEncrypt: null == autoEncrypt ? _self.autoEncrypt : autoEncrypt // ignore: cast_nullable_to_non_nullable
as bool,useEncryptionNonce: null == useEncryptionNonce ? _self.useEncryptionNonce : useEncryptionNonce // ignore: cast_nullable_to_non_nullable
as bool,hideFromScreenCapture: null == hideFromScreenCapture ? _self.hideFromScreenCapture : hideFromScreenCapture // ignore: cast_nullable_to_non_nullable
as bool,exclusionRules: freezed == exclusionRules ? _self.exclusionRules : exclusionRules // ignore: cast_nullable_to_non_nullable
as ExclusionRules?,enableLocalAuth: null == enableLocalAuth ? _self.enableLocalAuth : enableLocalAuth // ignore: cast_nullable_to_non_nullable
as bool,localAuthTimeoutMinutes: null == localAuthTimeoutMinutes ? _self.localAuthTimeoutMinutes : localAuthTimeoutMinutes // ignore: cast_nullable_to_non_nullable
as int,themeColor: null == themeColor ? _self.themeColor : themeColor // ignore: cast_nullable_to_non_nullable
as int,themeVariant: null == themeVariant ? _self.themeVariant : themeVariant // ignore: cast_nullable_to_non_nullable
as DynamicSchemeVariant,showCollectionTip: null == showCollectionTip ? _self.showCollectionTip : showCollectionTip // ignore: cast_nullable_to_non_nullable
as bool,searchIndexReady: null == searchIndexReady ? _self.searchIndexReady : searchIndexReady // ignore: cast_nullable_to_non_nullable
as bool,enableDragNDrop: null == enableDragNDrop ? _self.enableDragNDrop : enableDragNDrop // ignore: cast_nullable_to_non_nullable
as bool,enablePasteStack: null == enablePasteStack ? _self.enablePasteStack : enablePasteStack // ignore: cast_nullable_to_non_nullable
as bool,androidBgListener: null == androidBgListener ? _self.androidBgListener : androidBgListener // ignore: cast_nullable_to_non_nullable
as bool,richDataCapture: null == richDataCapture ? _self.richDataCapture : richDataCapture // ignore: cast_nullable_to_non_nullable
as bool,lanInstantSync: null == lanInstantSync ? _self.lanInstantSync : lanInstantSync // ignore: cast_nullable_to_non_nullable
as bool,autoWriteOnReceive: null == autoWriteOnReceive ? _self.autoWriteOnReceive : autoWriteOnReceive // ignore: cast_nullable_to_non_nullable
as bool,showTrayIcon: null == showTrayIcon ? _self.showTrayIcon : showTrayIcon // ignore: cast_nullable_to_non_nullable
as bool,onBoardComplete: null == onBoardComplete ? _self.onBoardComplete : onBoardComplete // ignore: cast_nullable_to_non_nullable
as bool,reviewQualifyingEventCount: null == reviewQualifyingEventCount ? _self.reviewQualifyingEventCount : reviewQualifyingEventCount // ignore: cast_nullable_to_non_nullable
as int,lastReviewPromptDate: freezed == lastReviewPromptDate ? _self.lastReviewPromptDate : lastReviewPromptDate // ignore: cast_nullable_to_non_nullable
as DateTime?,reviewNeverAsk: null == reviewNeverAsk ? _self.reviewNeverAsk : reviewNeverAsk // ignore: cast_nullable_to_non_nullable
as bool,lastFocusedWindowId: freezed == lastFocusedWindowId ? _self.lastFocusedWindowId : lastFocusedWindowId // ignore: cast_nullable_to_non_nullable
as int?,clockUnSynced: null == clockUnSynced ? _self.clockUnSynced : clockUnSynced // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExclusionRulesCopyWith<$Res>? get exclusionRules {
    if (_self.exclusionRules == null) {
    return null;
  }

  return $ExclusionRulesCopyWith<$Res>(_self.exclusionRules!, (value) {
    return _then(_self.copyWith(exclusionRules: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppConfig].
extension AppConfigPatterns on AppConfig {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppConfig value)  $default,){
final _that = this;
switch (_that) {
case _AppConfig():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppConfig value)?  $default,){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false, includeFromJson: false)  int? id,  ThemeMode themeMode,  bool enableSync,  bool enableFileSync,  ActiveCloudStorageProvider activeStorageProvider,  AppLayout layout,  AppView view,  bool pinned,  double windowWidth,  double windowHeight,  ClipboardSortKey sortBy,  SortOrder sortOrder,  int dontUploadOver,  int dontCopyOver,  DateTime? pausedTill,  SyncSpeed syncSpeed,  String? toggleHotkey,  String? quickPasteHotkey,  String? pasteStackHotkey,  bool smartPaste,  bool keepWindowOpenOnUnfocus,  bool transformAsNewClip, @JsonKey(fromJson: _feedbackModeFromJson, toJson: _feedbackModeToJson)  ClipboardFeedbackMode clipboardFeedbackMode,  bool enableTypeToSearch,  bool launchAtStartup,  String locale,  String? enc2,  bool autoEncrypt,  bool useEncryptionNonce,  bool hideFromScreenCapture, @JsonKey(includeFromJson: false, includeToJson: false)  ExclusionRules? exclusionRules,  bool enableLocalAuth,  int localAuthTimeoutMinutes,  int themeColor,  DynamicSchemeVariant themeVariant,  bool showCollectionTip,  bool searchIndexReady,  bool enableDragNDrop,  bool enablePasteStack,  bool androidBgListener,  bool richDataCapture,  bool lanInstantSync,  bool autoWriteOnReceive,  bool showTrayIcon,  bool onBoardComplete,  int reviewQualifyingEventCount,  DateTime? lastReviewPromptDate,  bool reviewNeverAsk, @JsonKey(includeFromJson: false, includeToJson: false)  int? lastFocusedWindowId, @JsonKey(includeFromJson: false, includeToJson: false)  bool clockUnSynced)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.id,_that.themeMode,_that.enableSync,_that.enableFileSync,_that.activeStorageProvider,_that.layout,_that.view,_that.pinned,_that.windowWidth,_that.windowHeight,_that.sortBy,_that.sortOrder,_that.dontUploadOver,_that.dontCopyOver,_that.pausedTill,_that.syncSpeed,_that.toggleHotkey,_that.quickPasteHotkey,_that.pasteStackHotkey,_that.smartPaste,_that.keepWindowOpenOnUnfocus,_that.transformAsNewClip,_that.clipboardFeedbackMode,_that.enableTypeToSearch,_that.launchAtStartup,_that.locale,_that.enc2,_that.autoEncrypt,_that.useEncryptionNonce,_that.hideFromScreenCapture,_that.exclusionRules,_that.enableLocalAuth,_that.localAuthTimeoutMinutes,_that.themeColor,_that.themeVariant,_that.showCollectionTip,_that.searchIndexReady,_that.enableDragNDrop,_that.enablePasteStack,_that.androidBgListener,_that.richDataCapture,_that.lanInstantSync,_that.autoWriteOnReceive,_that.showTrayIcon,_that.onBoardComplete,_that.reviewQualifyingEventCount,_that.lastReviewPromptDate,_that.reviewNeverAsk,_that.lastFocusedWindowId,_that.clockUnSynced);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false, includeFromJson: false)  int? id,  ThemeMode themeMode,  bool enableSync,  bool enableFileSync,  ActiveCloudStorageProvider activeStorageProvider,  AppLayout layout,  AppView view,  bool pinned,  double windowWidth,  double windowHeight,  ClipboardSortKey sortBy,  SortOrder sortOrder,  int dontUploadOver,  int dontCopyOver,  DateTime? pausedTill,  SyncSpeed syncSpeed,  String? toggleHotkey,  String? quickPasteHotkey,  String? pasteStackHotkey,  bool smartPaste,  bool keepWindowOpenOnUnfocus,  bool transformAsNewClip, @JsonKey(fromJson: _feedbackModeFromJson, toJson: _feedbackModeToJson)  ClipboardFeedbackMode clipboardFeedbackMode,  bool enableTypeToSearch,  bool launchAtStartup,  String locale,  String? enc2,  bool autoEncrypt,  bool useEncryptionNonce,  bool hideFromScreenCapture, @JsonKey(includeFromJson: false, includeToJson: false)  ExclusionRules? exclusionRules,  bool enableLocalAuth,  int localAuthTimeoutMinutes,  int themeColor,  DynamicSchemeVariant themeVariant,  bool showCollectionTip,  bool searchIndexReady,  bool enableDragNDrop,  bool enablePasteStack,  bool androidBgListener,  bool richDataCapture,  bool lanInstantSync,  bool autoWriteOnReceive,  bool showTrayIcon,  bool onBoardComplete,  int reviewQualifyingEventCount,  DateTime? lastReviewPromptDate,  bool reviewNeverAsk, @JsonKey(includeFromJson: false, includeToJson: false)  int? lastFocusedWindowId, @JsonKey(includeFromJson: false, includeToJson: false)  bool clockUnSynced)  $default,) {final _that = this;
switch (_that) {
case _AppConfig():
return $default(_that.id,_that.themeMode,_that.enableSync,_that.enableFileSync,_that.activeStorageProvider,_that.layout,_that.view,_that.pinned,_that.windowWidth,_that.windowHeight,_that.sortBy,_that.sortOrder,_that.dontUploadOver,_that.dontCopyOver,_that.pausedTill,_that.syncSpeed,_that.toggleHotkey,_that.quickPasteHotkey,_that.pasteStackHotkey,_that.smartPaste,_that.keepWindowOpenOnUnfocus,_that.transformAsNewClip,_that.clipboardFeedbackMode,_that.enableTypeToSearch,_that.launchAtStartup,_that.locale,_that.enc2,_that.autoEncrypt,_that.useEncryptionNonce,_that.hideFromScreenCapture,_that.exclusionRules,_that.enableLocalAuth,_that.localAuthTimeoutMinutes,_that.themeColor,_that.themeVariant,_that.showCollectionTip,_that.searchIndexReady,_that.enableDragNDrop,_that.enablePasteStack,_that.androidBgListener,_that.richDataCapture,_that.lanInstantSync,_that.autoWriteOnReceive,_that.showTrayIcon,_that.onBoardComplete,_that.reviewQualifyingEventCount,_that.lastReviewPromptDate,_that.reviewNeverAsk,_that.lastFocusedWindowId,_that.clockUnSynced);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeToJson: false, includeFromJson: false)  int? id,  ThemeMode themeMode,  bool enableSync,  bool enableFileSync,  ActiveCloudStorageProvider activeStorageProvider,  AppLayout layout,  AppView view,  bool pinned,  double windowWidth,  double windowHeight,  ClipboardSortKey sortBy,  SortOrder sortOrder,  int dontUploadOver,  int dontCopyOver,  DateTime? pausedTill,  SyncSpeed syncSpeed,  String? toggleHotkey,  String? quickPasteHotkey,  String? pasteStackHotkey,  bool smartPaste,  bool keepWindowOpenOnUnfocus,  bool transformAsNewClip, @JsonKey(fromJson: _feedbackModeFromJson, toJson: _feedbackModeToJson)  ClipboardFeedbackMode clipboardFeedbackMode,  bool enableTypeToSearch,  bool launchAtStartup,  String locale,  String? enc2,  bool autoEncrypt,  bool useEncryptionNonce,  bool hideFromScreenCapture, @JsonKey(includeFromJson: false, includeToJson: false)  ExclusionRules? exclusionRules,  bool enableLocalAuth,  int localAuthTimeoutMinutes,  int themeColor,  DynamicSchemeVariant themeVariant,  bool showCollectionTip,  bool searchIndexReady,  bool enableDragNDrop,  bool enablePasteStack,  bool androidBgListener,  bool richDataCapture,  bool lanInstantSync,  bool autoWriteOnReceive,  bool showTrayIcon,  bool onBoardComplete,  int reviewQualifyingEventCount,  DateTime? lastReviewPromptDate,  bool reviewNeverAsk, @JsonKey(includeFromJson: false, includeToJson: false)  int? lastFocusedWindowId, @JsonKey(includeFromJson: false, includeToJson: false)  bool clockUnSynced)?  $default,) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.id,_that.themeMode,_that.enableSync,_that.enableFileSync,_that.activeStorageProvider,_that.layout,_that.view,_that.pinned,_that.windowWidth,_that.windowHeight,_that.sortBy,_that.sortOrder,_that.dontUploadOver,_that.dontCopyOver,_that.pausedTill,_that.syncSpeed,_that.toggleHotkey,_that.quickPasteHotkey,_that.pasteStackHotkey,_that.smartPaste,_that.keepWindowOpenOnUnfocus,_that.transformAsNewClip,_that.clipboardFeedbackMode,_that.enableTypeToSearch,_that.launchAtStartup,_that.locale,_that.enc2,_that.autoEncrypt,_that.useEncryptionNonce,_that.hideFromScreenCapture,_that.exclusionRules,_that.enableLocalAuth,_that.localAuthTimeoutMinutes,_that.themeColor,_that.themeVariant,_that.showCollectionTip,_that.searchIndexReady,_that.enableDragNDrop,_that.enablePasteStack,_that.androidBgListener,_that.richDataCapture,_that.lanInstantSync,_that.autoWriteOnReceive,_that.showTrayIcon,_that.onBoardComplete,_that.reviewQualifyingEventCount,_that.lastReviewPromptDate,_that.reviewNeverAsk,_that.lastFocusedWindowId,_that.clockUnSynced);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppConfig extends AppConfig {
   _AppConfig({@JsonKey(includeToJson: false, includeFromJson: false) this.id, this.themeMode = ThemeMode.system, this.enableSync = true, this.enableFileSync = true, this.activeStorageProvider = ActiveCloudStorageProvider.googleDrive, this.layout = AppLayout.grid, this.view = AppView.windowed, this.pinned = false, this.windowWidth = initialWindowWidth, this.windowHeight = initialWindowHeight, this.sortBy = ClipboardSortKey.modified, this.sortOrder = SortOrder.desc, this.dontUploadOver = $10MB, this.dontCopyOver = $10MB, this.pausedTill, this.syncSpeed = SyncSpeed.balanced, this.toggleHotkey, this.quickPasteHotkey, this.pasteStackHotkey, this.smartPaste = false, this.keepWindowOpenOnUnfocus = true, this.transformAsNewClip = false, @JsonKey(fromJson: _feedbackModeFromJson, toJson: _feedbackModeToJson) this.clipboardFeedbackMode = ClipboardFeedbackMode.copyAndSync, this.enableTypeToSearch = false, this.launchAtStartup = false, this.locale = "en", this.enc2, this.autoEncrypt = false, this.useEncryptionNonce = false, this.hideFromScreenCapture = true, @JsonKey(includeFromJson: false, includeToJson: false) this.exclusionRules, this.enableLocalAuth = false, this.localAuthTimeoutMinutes = 1, this.themeColor = defaultThemeColor, this.themeVariant = DynamicSchemeVariant.tonalSpot, this.showCollectionTip = true, this.searchIndexReady = false, this.enableDragNDrop = false, this.enablePasteStack = false, this.androidBgListener = false, this.richDataCapture = false, this.lanInstantSync = false, this.autoWriteOnReceive = false, this.showTrayIcon = true, this.onBoardComplete = true, this.reviewQualifyingEventCount = 0, this.lastReviewPromptDate, this.reviewNeverAsk = false, @JsonKey(includeFromJson: false, includeToJson: false) this.lastFocusedWindowId, @JsonKey(includeFromJson: false, includeToJson: false) this.clockUnSynced = false}): super._();
  factory _AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);

@override@JsonKey(includeToJson: false, includeFromJson: false) final  int? id;
@override@JsonKey() final  ThemeMode themeMode;
@override@JsonKey() final  bool enableSync;
@override@JsonKey() final  bool enableFileSync;
@override@JsonKey() final  ActiveCloudStorageProvider activeStorageProvider;
@override@JsonKey() final  AppLayout layout;
@override@JsonKey() final  AppView view;
@override@JsonKey() final  bool pinned;
@override@JsonKey() final  double windowWidth;
@override@JsonKey() final  double windowHeight;
@override@JsonKey() final  ClipboardSortKey sortBy;
@override@JsonKey() final  SortOrder sortOrder;
/// will prevent auto upload for files over 10 MB
@override@JsonKey() final  int dontUploadOver;
/// will prevent auto copy for files over 10 MB
@override@JsonKey() final  int dontCopyOver;
/// Pause auto copy for till pausedTill is reached.
@override final  DateTime? pausedTill;
@override@JsonKey() final  SyncSpeed syncSpeed;
@override final  String? toggleHotkey;
@override final  String? quickPasteHotkey;
@override final  String? pasteStackHotkey;
/// If enabled, the primary action on clips will be smartly selected.
/// The primary action will be paste, which will directly paste the clip
/// to the last focused cursor in the last window, and the clipboard will minimize.
@override@JsonKey() final  bool smartPaste;
/// If enabled, losing focus keeps the window open in the background
/// instead of hiding it automatically.
@override@JsonKey() final  bool keepWindowOpenOnUnfocus;
/// If enabled, transformed clips will be saved as new clips instead of
/// being copied/pasted immediately.
@override@JsonKey() final  bool transformAsNewClip;
/// Controls the feedback shown when a clip is captured or received.
@override@JsonKey(fromJson: _feedbackModeFromJson, toJson: _feedbackModeToJson) final  ClipboardFeedbackMode clipboardFeedbackMode;
/// If enabled, search runs while the user types in the search box.
@override@JsonKey() final  bool enableTypeToSearch;
/// If enabled, the application will automatically start at startup.
@override@JsonKey() final  bool launchAtStartup;
@override@JsonKey() final  String locale;
@override final  String? enc2;
@override@JsonKey() final  bool autoEncrypt;
@override@JsonKey() final  bool useEncryptionNonce;
@override@JsonKey() final  bool hideFromScreenCapture;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  ExclusionRules? exclusionRules;
@override@JsonKey() final  bool enableLocalAuth;
@override@JsonKey() final  int localAuthTimeoutMinutes;
@override@JsonKey() final  int themeColor;
@override@JsonKey() final  DynamicSchemeVariant themeVariant;
@override@JsonKey() final  bool showCollectionTip;
@override@JsonKey() final  bool searchIndexReady;
@override@JsonKey() final  bool enableDragNDrop;
@override@JsonKey() final  bool enablePasteStack;
@override@JsonKey() final  bool androidBgListener;
@override@JsonKey() final  bool richDataCapture;
@override@JsonKey() final  bool lanInstantSync;
@override@JsonKey() final  bool autoWriteOnReceive;
@override@JsonKey() final  bool showTrayIcon;
@override@JsonKey() final  bool onBoardComplete;
@override@JsonKey() final  int reviewQualifyingEventCount;
@override final  DateTime? lastReviewPromptDate;
@override@JsonKey() final  bool reviewNeverAsk;
/// last focus window id
@override@JsonKey(includeFromJson: false, includeToJson: false) final  int? lastFocusedWindowId;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  bool clockUnSynced;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppConfigCopyWith<_AppConfig> get copyWith => __$AppConfigCopyWithImpl<_AppConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppConfig&&(identical(other.id, id) || other.id == id)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.enableSync, enableSync) || other.enableSync == enableSync)&&(identical(other.enableFileSync, enableFileSync) || other.enableFileSync == enableFileSync)&&(identical(other.activeStorageProvider, activeStorageProvider) || other.activeStorageProvider == activeStorageProvider)&&(identical(other.layout, layout) || other.layout == layout)&&(identical(other.view, view) || other.view == view)&&(identical(other.pinned, pinned) || other.pinned == pinned)&&(identical(other.windowWidth, windowWidth) || other.windowWidth == windowWidth)&&(identical(other.windowHeight, windowHeight) || other.windowHeight == windowHeight)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.dontUploadOver, dontUploadOver) || other.dontUploadOver == dontUploadOver)&&(identical(other.dontCopyOver, dontCopyOver) || other.dontCopyOver == dontCopyOver)&&(identical(other.pausedTill, pausedTill) || other.pausedTill == pausedTill)&&(identical(other.syncSpeed, syncSpeed) || other.syncSpeed == syncSpeed)&&(identical(other.toggleHotkey, toggleHotkey) || other.toggleHotkey == toggleHotkey)&&(identical(other.quickPasteHotkey, quickPasteHotkey) || other.quickPasteHotkey == quickPasteHotkey)&&(identical(other.pasteStackHotkey, pasteStackHotkey) || other.pasteStackHotkey == pasteStackHotkey)&&(identical(other.smartPaste, smartPaste) || other.smartPaste == smartPaste)&&(identical(other.keepWindowOpenOnUnfocus, keepWindowOpenOnUnfocus) || other.keepWindowOpenOnUnfocus == keepWindowOpenOnUnfocus)&&(identical(other.transformAsNewClip, transformAsNewClip) || other.transformAsNewClip == transformAsNewClip)&&(identical(other.clipboardFeedbackMode, clipboardFeedbackMode) || other.clipboardFeedbackMode == clipboardFeedbackMode)&&(identical(other.enableTypeToSearch, enableTypeToSearch) || other.enableTypeToSearch == enableTypeToSearch)&&(identical(other.launchAtStartup, launchAtStartup) || other.launchAtStartup == launchAtStartup)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.enc2, enc2) || other.enc2 == enc2)&&(identical(other.autoEncrypt, autoEncrypt) || other.autoEncrypt == autoEncrypt)&&(identical(other.useEncryptionNonce, useEncryptionNonce) || other.useEncryptionNonce == useEncryptionNonce)&&(identical(other.hideFromScreenCapture, hideFromScreenCapture) || other.hideFromScreenCapture == hideFromScreenCapture)&&(identical(other.exclusionRules, exclusionRules) || other.exclusionRules == exclusionRules)&&(identical(other.enableLocalAuth, enableLocalAuth) || other.enableLocalAuth == enableLocalAuth)&&(identical(other.localAuthTimeoutMinutes, localAuthTimeoutMinutes) || other.localAuthTimeoutMinutes == localAuthTimeoutMinutes)&&(identical(other.themeColor, themeColor) || other.themeColor == themeColor)&&(identical(other.themeVariant, themeVariant) || other.themeVariant == themeVariant)&&(identical(other.showCollectionTip, showCollectionTip) || other.showCollectionTip == showCollectionTip)&&(identical(other.searchIndexReady, searchIndexReady) || other.searchIndexReady == searchIndexReady)&&(identical(other.enableDragNDrop, enableDragNDrop) || other.enableDragNDrop == enableDragNDrop)&&(identical(other.enablePasteStack, enablePasteStack) || other.enablePasteStack == enablePasteStack)&&(identical(other.androidBgListener, androidBgListener) || other.androidBgListener == androidBgListener)&&(identical(other.richDataCapture, richDataCapture) || other.richDataCapture == richDataCapture)&&(identical(other.lanInstantSync, lanInstantSync) || other.lanInstantSync == lanInstantSync)&&(identical(other.autoWriteOnReceive, autoWriteOnReceive) || other.autoWriteOnReceive == autoWriteOnReceive)&&(identical(other.showTrayIcon, showTrayIcon) || other.showTrayIcon == showTrayIcon)&&(identical(other.onBoardComplete, onBoardComplete) || other.onBoardComplete == onBoardComplete)&&(identical(other.reviewQualifyingEventCount, reviewQualifyingEventCount) || other.reviewQualifyingEventCount == reviewQualifyingEventCount)&&(identical(other.lastReviewPromptDate, lastReviewPromptDate) || other.lastReviewPromptDate == lastReviewPromptDate)&&(identical(other.reviewNeverAsk, reviewNeverAsk) || other.reviewNeverAsk == reviewNeverAsk)&&(identical(other.lastFocusedWindowId, lastFocusedWindowId) || other.lastFocusedWindowId == lastFocusedWindowId)&&(identical(other.clockUnSynced, clockUnSynced) || other.clockUnSynced == clockUnSynced));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,themeMode,enableSync,enableFileSync,activeStorageProvider,layout,view,pinned,windowWidth,windowHeight,sortBy,sortOrder,dontUploadOver,dontCopyOver,pausedTill,syncSpeed,toggleHotkey,quickPasteHotkey,pasteStackHotkey,smartPaste,keepWindowOpenOnUnfocus,transformAsNewClip,clipboardFeedbackMode,enableTypeToSearch,launchAtStartup,locale,enc2,autoEncrypt,useEncryptionNonce,hideFromScreenCapture,exclusionRules,enableLocalAuth,localAuthTimeoutMinutes,themeColor,themeVariant,showCollectionTip,searchIndexReady,enableDragNDrop,enablePasteStack,androidBgListener,richDataCapture,lanInstantSync,autoWriteOnReceive,showTrayIcon,onBoardComplete,reviewQualifyingEventCount,lastReviewPromptDate,reviewNeverAsk,lastFocusedWindowId,clockUnSynced]);

@override
String toString() {
  return 'AppConfig(id: $id, themeMode: $themeMode, enableSync: $enableSync, enableFileSync: $enableFileSync, activeStorageProvider: $activeStorageProvider, layout: $layout, view: $view, pinned: $pinned, windowWidth: $windowWidth, windowHeight: $windowHeight, sortBy: $sortBy, sortOrder: $sortOrder, dontUploadOver: $dontUploadOver, dontCopyOver: $dontCopyOver, pausedTill: $pausedTill, syncSpeed: $syncSpeed, toggleHotkey: $toggleHotkey, quickPasteHotkey: $quickPasteHotkey, pasteStackHotkey: $pasteStackHotkey, smartPaste: $smartPaste, keepWindowOpenOnUnfocus: $keepWindowOpenOnUnfocus, transformAsNewClip: $transformAsNewClip, clipboardFeedbackMode: $clipboardFeedbackMode, enableTypeToSearch: $enableTypeToSearch, launchAtStartup: $launchAtStartup, locale: $locale, enc2: $enc2, autoEncrypt: $autoEncrypt, useEncryptionNonce: $useEncryptionNonce, hideFromScreenCapture: $hideFromScreenCapture, exclusionRules: $exclusionRules, enableLocalAuth: $enableLocalAuth, localAuthTimeoutMinutes: $localAuthTimeoutMinutes, themeColor: $themeColor, themeVariant: $themeVariant, showCollectionTip: $showCollectionTip, searchIndexReady: $searchIndexReady, enableDragNDrop: $enableDragNDrop, enablePasteStack: $enablePasteStack, androidBgListener: $androidBgListener, richDataCapture: $richDataCapture, lanInstantSync: $lanInstantSync, autoWriteOnReceive: $autoWriteOnReceive, showTrayIcon: $showTrayIcon, onBoardComplete: $onBoardComplete, reviewQualifyingEventCount: $reviewQualifyingEventCount, lastReviewPromptDate: $lastReviewPromptDate, reviewNeverAsk: $reviewNeverAsk, lastFocusedWindowId: $lastFocusedWindowId, clockUnSynced: $clockUnSynced)';
}


}

/// @nodoc
abstract mixin class _$AppConfigCopyWith<$Res> implements $AppConfigCopyWith<$Res> {
  factory _$AppConfigCopyWith(_AppConfig value, $Res Function(_AppConfig) _then) = __$AppConfigCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false, includeFromJson: false) int? id, ThemeMode themeMode, bool enableSync, bool enableFileSync, ActiveCloudStorageProvider activeStorageProvider, AppLayout layout, AppView view, bool pinned, double windowWidth, double windowHeight, ClipboardSortKey sortBy, SortOrder sortOrder, int dontUploadOver, int dontCopyOver, DateTime? pausedTill, SyncSpeed syncSpeed, String? toggleHotkey, String? quickPasteHotkey, String? pasteStackHotkey, bool smartPaste, bool keepWindowOpenOnUnfocus, bool transformAsNewClip,@JsonKey(fromJson: _feedbackModeFromJson, toJson: _feedbackModeToJson) ClipboardFeedbackMode clipboardFeedbackMode, bool enableTypeToSearch, bool launchAtStartup, String locale, String? enc2, bool autoEncrypt, bool useEncryptionNonce, bool hideFromScreenCapture,@JsonKey(includeFromJson: false, includeToJson: false) ExclusionRules? exclusionRules, bool enableLocalAuth, int localAuthTimeoutMinutes, int themeColor, DynamicSchemeVariant themeVariant, bool showCollectionTip, bool searchIndexReady, bool enableDragNDrop, bool enablePasteStack, bool androidBgListener, bool richDataCapture, bool lanInstantSync, bool autoWriteOnReceive, bool showTrayIcon, bool onBoardComplete, int reviewQualifyingEventCount, DateTime? lastReviewPromptDate, bool reviewNeverAsk,@JsonKey(includeFromJson: false, includeToJson: false) int? lastFocusedWindowId,@JsonKey(includeFromJson: false, includeToJson: false) bool clockUnSynced
});


@override $ExclusionRulesCopyWith<$Res>? get exclusionRules;

}
/// @nodoc
class __$AppConfigCopyWithImpl<$Res>
    implements _$AppConfigCopyWith<$Res> {
  __$AppConfigCopyWithImpl(this._self, this._then);

  final _AppConfig _self;
  final $Res Function(_AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? themeMode = null,Object? enableSync = null,Object? enableFileSync = null,Object? activeStorageProvider = null,Object? layout = null,Object? view = null,Object? pinned = null,Object? windowWidth = null,Object? windowHeight = null,Object? sortBy = null,Object? sortOrder = null,Object? dontUploadOver = null,Object? dontCopyOver = null,Object? pausedTill = freezed,Object? syncSpeed = null,Object? toggleHotkey = freezed,Object? quickPasteHotkey = freezed,Object? pasteStackHotkey = freezed,Object? smartPaste = null,Object? keepWindowOpenOnUnfocus = null,Object? transformAsNewClip = null,Object? clipboardFeedbackMode = null,Object? enableTypeToSearch = null,Object? launchAtStartup = null,Object? locale = null,Object? enc2 = freezed,Object? autoEncrypt = null,Object? useEncryptionNonce = null,Object? hideFromScreenCapture = null,Object? exclusionRules = freezed,Object? enableLocalAuth = null,Object? localAuthTimeoutMinutes = null,Object? themeColor = null,Object? themeVariant = null,Object? showCollectionTip = null,Object? searchIndexReady = null,Object? enableDragNDrop = null,Object? enablePasteStack = null,Object? androidBgListener = null,Object? richDataCapture = null,Object? lanInstantSync = null,Object? autoWriteOnReceive = null,Object? showTrayIcon = null,Object? onBoardComplete = null,Object? reviewQualifyingEventCount = null,Object? lastReviewPromptDate = freezed,Object? reviewNeverAsk = null,Object? lastFocusedWindowId = freezed,Object? clockUnSynced = null,}) {
  return _then(_AppConfig(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,enableSync: null == enableSync ? _self.enableSync : enableSync // ignore: cast_nullable_to_non_nullable
as bool,enableFileSync: null == enableFileSync ? _self.enableFileSync : enableFileSync // ignore: cast_nullable_to_non_nullable
as bool,activeStorageProvider: null == activeStorageProvider ? _self.activeStorageProvider : activeStorageProvider // ignore: cast_nullable_to_non_nullable
as ActiveCloudStorageProvider,layout: null == layout ? _self.layout : layout // ignore: cast_nullable_to_non_nullable
as AppLayout,view: null == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as AppView,pinned: null == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool,windowWidth: null == windowWidth ? _self.windowWidth : windowWidth // ignore: cast_nullable_to_non_nullable
as double,windowHeight: null == windowHeight ? _self.windowHeight : windowHeight // ignore: cast_nullable_to_non_nullable
as double,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as ClipboardSortKey,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as SortOrder,dontUploadOver: null == dontUploadOver ? _self.dontUploadOver : dontUploadOver // ignore: cast_nullable_to_non_nullable
as int,dontCopyOver: null == dontCopyOver ? _self.dontCopyOver : dontCopyOver // ignore: cast_nullable_to_non_nullable
as int,pausedTill: freezed == pausedTill ? _self.pausedTill : pausedTill // ignore: cast_nullable_to_non_nullable
as DateTime?,syncSpeed: null == syncSpeed ? _self.syncSpeed : syncSpeed // ignore: cast_nullable_to_non_nullable
as SyncSpeed,toggleHotkey: freezed == toggleHotkey ? _self.toggleHotkey : toggleHotkey // ignore: cast_nullable_to_non_nullable
as String?,quickPasteHotkey: freezed == quickPasteHotkey ? _self.quickPasteHotkey : quickPasteHotkey // ignore: cast_nullable_to_non_nullable
as String?,pasteStackHotkey: freezed == pasteStackHotkey ? _self.pasteStackHotkey : pasteStackHotkey // ignore: cast_nullable_to_non_nullable
as String?,smartPaste: null == smartPaste ? _self.smartPaste : smartPaste // ignore: cast_nullable_to_non_nullable
as bool,keepWindowOpenOnUnfocus: null == keepWindowOpenOnUnfocus ? _self.keepWindowOpenOnUnfocus : keepWindowOpenOnUnfocus // ignore: cast_nullable_to_non_nullable
as bool,transformAsNewClip: null == transformAsNewClip ? _self.transformAsNewClip : transformAsNewClip // ignore: cast_nullable_to_non_nullable
as bool,clipboardFeedbackMode: null == clipboardFeedbackMode ? _self.clipboardFeedbackMode : clipboardFeedbackMode // ignore: cast_nullable_to_non_nullable
as ClipboardFeedbackMode,enableTypeToSearch: null == enableTypeToSearch ? _self.enableTypeToSearch : enableTypeToSearch // ignore: cast_nullable_to_non_nullable
as bool,launchAtStartup: null == launchAtStartup ? _self.launchAtStartup : launchAtStartup // ignore: cast_nullable_to_non_nullable
as bool,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,enc2: freezed == enc2 ? _self.enc2 : enc2 // ignore: cast_nullable_to_non_nullable
as String?,autoEncrypt: null == autoEncrypt ? _self.autoEncrypt : autoEncrypt // ignore: cast_nullable_to_non_nullable
as bool,useEncryptionNonce: null == useEncryptionNonce ? _self.useEncryptionNonce : useEncryptionNonce // ignore: cast_nullable_to_non_nullable
as bool,hideFromScreenCapture: null == hideFromScreenCapture ? _self.hideFromScreenCapture : hideFromScreenCapture // ignore: cast_nullable_to_non_nullable
as bool,exclusionRules: freezed == exclusionRules ? _self.exclusionRules : exclusionRules // ignore: cast_nullable_to_non_nullable
as ExclusionRules?,enableLocalAuth: null == enableLocalAuth ? _self.enableLocalAuth : enableLocalAuth // ignore: cast_nullable_to_non_nullable
as bool,localAuthTimeoutMinutes: null == localAuthTimeoutMinutes ? _self.localAuthTimeoutMinutes : localAuthTimeoutMinutes // ignore: cast_nullable_to_non_nullable
as int,themeColor: null == themeColor ? _self.themeColor : themeColor // ignore: cast_nullable_to_non_nullable
as int,themeVariant: null == themeVariant ? _self.themeVariant : themeVariant // ignore: cast_nullable_to_non_nullable
as DynamicSchemeVariant,showCollectionTip: null == showCollectionTip ? _self.showCollectionTip : showCollectionTip // ignore: cast_nullable_to_non_nullable
as bool,searchIndexReady: null == searchIndexReady ? _self.searchIndexReady : searchIndexReady // ignore: cast_nullable_to_non_nullable
as bool,enableDragNDrop: null == enableDragNDrop ? _self.enableDragNDrop : enableDragNDrop // ignore: cast_nullable_to_non_nullable
as bool,enablePasteStack: null == enablePasteStack ? _self.enablePasteStack : enablePasteStack // ignore: cast_nullable_to_non_nullable
as bool,androidBgListener: null == androidBgListener ? _self.androidBgListener : androidBgListener // ignore: cast_nullable_to_non_nullable
as bool,richDataCapture: null == richDataCapture ? _self.richDataCapture : richDataCapture // ignore: cast_nullable_to_non_nullable
as bool,lanInstantSync: null == lanInstantSync ? _self.lanInstantSync : lanInstantSync // ignore: cast_nullable_to_non_nullable
as bool,autoWriteOnReceive: null == autoWriteOnReceive ? _self.autoWriteOnReceive : autoWriteOnReceive // ignore: cast_nullable_to_non_nullable
as bool,showTrayIcon: null == showTrayIcon ? _self.showTrayIcon : showTrayIcon // ignore: cast_nullable_to_non_nullable
as bool,onBoardComplete: null == onBoardComplete ? _self.onBoardComplete : onBoardComplete // ignore: cast_nullable_to_non_nullable
as bool,reviewQualifyingEventCount: null == reviewQualifyingEventCount ? _self.reviewQualifyingEventCount : reviewQualifyingEventCount // ignore: cast_nullable_to_non_nullable
as int,lastReviewPromptDate: freezed == lastReviewPromptDate ? _self.lastReviewPromptDate : lastReviewPromptDate // ignore: cast_nullable_to_non_nullable
as DateTime?,reviewNeverAsk: null == reviewNeverAsk ? _self.reviewNeverAsk : reviewNeverAsk // ignore: cast_nullable_to_non_nullable
as bool,lastFocusedWindowId: freezed == lastFocusedWindowId ? _self.lastFocusedWindowId : lastFocusedWindowId // ignore: cast_nullable_to_non_nullable
as int?,clockUnSynced: null == clockUnSynced ? _self.clockUnSynced : clockUnSynced // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExclusionRulesCopyWith<$Res>? get exclusionRules {
    if (_self.exclusionRules == null) {
    return null;
  }

  return $ExclusionRulesCopyWith<$Res>(_self.exclusionRules!, (value) {
    return _then(_self.copyWith(exclusionRules: value));
  });
}
}

// dart format on
