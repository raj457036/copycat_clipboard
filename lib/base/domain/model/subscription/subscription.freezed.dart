// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Subscription {

@JsonKey(includeToJson: false, includeFromJson: false) int? get id;@JsonKey(name: "id", includeToJson: false) int? get serverId;@JsonKey(name: "created")@DateTimeConverter() DateTime get created;@JsonKey(name: "modified")@DateTimeConverter() DateTime get modified; String get userId; String get planName; String get subId; String get source;@DateTimeConverter() DateTime? get trialStart;@DateTimeConverter() DateTime? get trialEnd; int get collections; int get itemsPerCollection;@JsonKey(name: "drag_n_drop") bool get dragNdrop; bool get theming;@JsonKey(name: "syncHr") int get syncHours; bool get ads;@JsonKey(name: "syncInt") int get syncInterval;@DateTimeConverter() DateTime? get activeTill;@JsonKey(name: "devices") int get maxSyncDevices;@JsonKey(name: "cers") bool get customExclusionRules;@JsonKey(name: "ps_limit") int get pasteStackLimit; int get grants; String? get tkn;@JsonKey(includeFromJson: false, includeToJson: false) String? get managementUrl;
/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionCopyWith<Subscription> get copyWith => _$SubscriptionCopyWithImpl<Subscription>(this as Subscription, _$identity);

  /// Serializes this Subscription to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Subscription&&(identical(other.id, id) || other.id == id)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.created, created) || other.created == created)&&(identical(other.modified, modified) || other.modified == modified)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.planName, planName) || other.planName == planName)&&(identical(other.subId, subId) || other.subId == subId)&&(identical(other.source, source) || other.source == source)&&(identical(other.trialStart, trialStart) || other.trialStart == trialStart)&&(identical(other.trialEnd, trialEnd) || other.trialEnd == trialEnd)&&(identical(other.collections, collections) || other.collections == collections)&&(identical(other.itemsPerCollection, itemsPerCollection) || other.itemsPerCollection == itemsPerCollection)&&(identical(other.dragNdrop, dragNdrop) || other.dragNdrop == dragNdrop)&&(identical(other.theming, theming) || other.theming == theming)&&(identical(other.syncHours, syncHours) || other.syncHours == syncHours)&&(identical(other.ads, ads) || other.ads == ads)&&(identical(other.syncInterval, syncInterval) || other.syncInterval == syncInterval)&&(identical(other.activeTill, activeTill) || other.activeTill == activeTill)&&(identical(other.maxSyncDevices, maxSyncDevices) || other.maxSyncDevices == maxSyncDevices)&&(identical(other.customExclusionRules, customExclusionRules) || other.customExclusionRules == customExclusionRules)&&(identical(other.pasteStackLimit, pasteStackLimit) || other.pasteStackLimit == pasteStackLimit)&&(identical(other.grants, grants) || other.grants == grants)&&(identical(other.tkn, tkn) || other.tkn == tkn)&&(identical(other.managementUrl, managementUrl) || other.managementUrl == managementUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,serverId,created,modified,userId,planName,subId,source,trialStart,trialEnd,collections,itemsPerCollection,dragNdrop,theming,syncHours,ads,syncInterval,activeTill,maxSyncDevices,customExclusionRules,pasteStackLimit,grants,tkn,managementUrl]);

@override
String toString() {
  return 'Subscription(id: $id, serverId: $serverId, created: $created, modified: $modified, userId: $userId, planName: $planName, subId: $subId, source: $source, trialStart: $trialStart, trialEnd: $trialEnd, collections: $collections, itemsPerCollection: $itemsPerCollection, dragNdrop: $dragNdrop, theming: $theming, syncHours: $syncHours, ads: $ads, syncInterval: $syncInterval, activeTill: $activeTill, maxSyncDevices: $maxSyncDevices, customExclusionRules: $customExclusionRules, pasteStackLimit: $pasteStackLimit, grants: $grants, tkn: $tkn, managementUrl: $managementUrl)';
}


}

/// @nodoc
abstract mixin class $SubscriptionCopyWith<$Res>  {
  factory $SubscriptionCopyWith(Subscription value, $Res Function(Subscription) _then) = _$SubscriptionCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false, includeFromJson: false) int? id,@JsonKey(name: "id", includeToJson: false) int? serverId,@JsonKey(name: "created")@DateTimeConverter() DateTime created,@JsonKey(name: "modified")@DateTimeConverter() DateTime modified, String userId, String planName, String subId, String source,@DateTimeConverter() DateTime? trialStart,@DateTimeConverter() DateTime? trialEnd, int collections, int itemsPerCollection,@JsonKey(name: "drag_n_drop") bool dragNdrop, bool theming,@JsonKey(name: "syncHr") int syncHours, bool ads,@JsonKey(name: "syncInt") int syncInterval,@DateTimeConverter() DateTime? activeTill,@JsonKey(name: "devices") int maxSyncDevices,@JsonKey(name: "cers") bool customExclusionRules,@JsonKey(name: "ps_limit") int pasteStackLimit, int grants, String? tkn,@JsonKey(includeFromJson: false, includeToJson: false) String? managementUrl
});




}
/// @nodoc
class _$SubscriptionCopyWithImpl<$Res>
    implements $SubscriptionCopyWith<$Res> {
  _$SubscriptionCopyWithImpl(this._self, this._then);

  final Subscription _self;
  final $Res Function(Subscription) _then;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? serverId = freezed,Object? created = null,Object? modified = null,Object? userId = null,Object? planName = null,Object? subId = null,Object? source = null,Object? trialStart = freezed,Object? trialEnd = freezed,Object? collections = null,Object? itemsPerCollection = null,Object? dragNdrop = null,Object? theming = null,Object? syncHours = null,Object? ads = null,Object? syncInterval = null,Object? activeTill = freezed,Object? maxSyncDevices = null,Object? customExclusionRules = null,Object? pasteStackLimit = null,Object? grants = null,Object? tkn = freezed,Object? managementUrl = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime,modified: null == modified ? _self.modified : modified // ignore: cast_nullable_to_non_nullable
as DateTime,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,planName: null == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String,subId: null == subId ? _self.subId : subId // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,trialStart: freezed == trialStart ? _self.trialStart : trialStart // ignore: cast_nullable_to_non_nullable
as DateTime?,trialEnd: freezed == trialEnd ? _self.trialEnd : trialEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,collections: null == collections ? _self.collections : collections // ignore: cast_nullable_to_non_nullable
as int,itemsPerCollection: null == itemsPerCollection ? _self.itemsPerCollection : itemsPerCollection // ignore: cast_nullable_to_non_nullable
as int,dragNdrop: null == dragNdrop ? _self.dragNdrop : dragNdrop // ignore: cast_nullable_to_non_nullable
as bool,theming: null == theming ? _self.theming : theming // ignore: cast_nullable_to_non_nullable
as bool,syncHours: null == syncHours ? _self.syncHours : syncHours // ignore: cast_nullable_to_non_nullable
as int,ads: null == ads ? _self.ads : ads // ignore: cast_nullable_to_non_nullable
as bool,syncInterval: null == syncInterval ? _self.syncInterval : syncInterval // ignore: cast_nullable_to_non_nullable
as int,activeTill: freezed == activeTill ? _self.activeTill : activeTill // ignore: cast_nullable_to_non_nullable
as DateTime?,maxSyncDevices: null == maxSyncDevices ? _self.maxSyncDevices : maxSyncDevices // ignore: cast_nullable_to_non_nullable
as int,customExclusionRules: null == customExclusionRules ? _self.customExclusionRules : customExclusionRules // ignore: cast_nullable_to_non_nullable
as bool,pasteStackLimit: null == pasteStackLimit ? _self.pasteStackLimit : pasteStackLimit // ignore: cast_nullable_to_non_nullable
as int,grants: null == grants ? _self.grants : grants // ignore: cast_nullable_to_non_nullable
as int,tkn: freezed == tkn ? _self.tkn : tkn // ignore: cast_nullable_to_non_nullable
as String?,managementUrl: freezed == managementUrl ? _self.managementUrl : managementUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Subscription].
extension SubscriptionPatterns on Subscription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Subscription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Subscription() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Subscription value)  $default,){
final _that = this;
switch (_that) {
case _Subscription():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Subscription value)?  $default,){
final _that = this;
switch (_that) {
case _Subscription() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false, includeFromJson: false)  int? id, @JsonKey(name: "id", includeToJson: false)  int? serverId, @JsonKey(name: "created")@DateTimeConverter()  DateTime created, @JsonKey(name: "modified")@DateTimeConverter()  DateTime modified,  String userId,  String planName,  String subId,  String source, @DateTimeConverter()  DateTime? trialStart, @DateTimeConverter()  DateTime? trialEnd,  int collections,  int itemsPerCollection, @JsonKey(name: "drag_n_drop")  bool dragNdrop,  bool theming, @JsonKey(name: "syncHr")  int syncHours,  bool ads, @JsonKey(name: "syncInt")  int syncInterval, @DateTimeConverter()  DateTime? activeTill, @JsonKey(name: "devices")  int maxSyncDevices, @JsonKey(name: "cers")  bool customExclusionRules, @JsonKey(name: "ps_limit")  int pasteStackLimit,  int grants,  String? tkn, @JsonKey(includeFromJson: false, includeToJson: false)  String? managementUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Subscription() when $default != null:
return $default(_that.id,_that.serverId,_that.created,_that.modified,_that.userId,_that.planName,_that.subId,_that.source,_that.trialStart,_that.trialEnd,_that.collections,_that.itemsPerCollection,_that.dragNdrop,_that.theming,_that.syncHours,_that.ads,_that.syncInterval,_that.activeTill,_that.maxSyncDevices,_that.customExclusionRules,_that.pasteStackLimit,_that.grants,_that.tkn,_that.managementUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false, includeFromJson: false)  int? id, @JsonKey(name: "id", includeToJson: false)  int? serverId, @JsonKey(name: "created")@DateTimeConverter()  DateTime created, @JsonKey(name: "modified")@DateTimeConverter()  DateTime modified,  String userId,  String planName,  String subId,  String source, @DateTimeConverter()  DateTime? trialStart, @DateTimeConverter()  DateTime? trialEnd,  int collections,  int itemsPerCollection, @JsonKey(name: "drag_n_drop")  bool dragNdrop,  bool theming, @JsonKey(name: "syncHr")  int syncHours,  bool ads, @JsonKey(name: "syncInt")  int syncInterval, @DateTimeConverter()  DateTime? activeTill, @JsonKey(name: "devices")  int maxSyncDevices, @JsonKey(name: "cers")  bool customExclusionRules, @JsonKey(name: "ps_limit")  int pasteStackLimit,  int grants,  String? tkn, @JsonKey(includeFromJson: false, includeToJson: false)  String? managementUrl)  $default,) {final _that = this;
switch (_that) {
case _Subscription():
return $default(_that.id,_that.serverId,_that.created,_that.modified,_that.userId,_that.planName,_that.subId,_that.source,_that.trialStart,_that.trialEnd,_that.collections,_that.itemsPerCollection,_that.dragNdrop,_that.theming,_that.syncHours,_that.ads,_that.syncInterval,_that.activeTill,_that.maxSyncDevices,_that.customExclusionRules,_that.pasteStackLimit,_that.grants,_that.tkn,_that.managementUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeToJson: false, includeFromJson: false)  int? id, @JsonKey(name: "id", includeToJson: false)  int? serverId, @JsonKey(name: "created")@DateTimeConverter()  DateTime created, @JsonKey(name: "modified")@DateTimeConverter()  DateTime modified,  String userId,  String planName,  String subId,  String source, @DateTimeConverter()  DateTime? trialStart, @DateTimeConverter()  DateTime? trialEnd,  int collections,  int itemsPerCollection, @JsonKey(name: "drag_n_drop")  bool dragNdrop,  bool theming, @JsonKey(name: "syncHr")  int syncHours,  bool ads, @JsonKey(name: "syncInt")  int syncInterval, @DateTimeConverter()  DateTime? activeTill, @JsonKey(name: "devices")  int maxSyncDevices, @JsonKey(name: "cers")  bool customExclusionRules, @JsonKey(name: "ps_limit")  int pasteStackLimit,  int grants,  String? tkn, @JsonKey(includeFromJson: false, includeToJson: false)  String? managementUrl)?  $default,) {final _that = this;
switch (_that) {
case _Subscription() when $default != null:
return $default(_that.id,_that.serverId,_that.created,_that.modified,_that.userId,_that.planName,_that.subId,_that.source,_that.trialStart,_that.trialEnd,_that.collections,_that.itemsPerCollection,_that.dragNdrop,_that.theming,_that.syncHours,_that.ads,_that.syncInterval,_that.activeTill,_that.maxSyncDevices,_that.customExclusionRules,_that.pasteStackLimit,_that.grants,_that.tkn,_that.managementUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Subscription extends Subscription {
   _Subscription({@JsonKey(includeToJson: false, includeFromJson: false) this.id, @JsonKey(name: "id", includeToJson: false) this.serverId, @JsonKey(name: "created")@DateTimeConverter() required this.created, @JsonKey(name: "modified")@DateTimeConverter() required this.modified, required this.userId, required this.planName, required this.subId, required this.source, @DateTimeConverter() this.trialStart, @DateTimeConverter() this.trialEnd, this.collections = defaultCollectionCount, this.itemsPerCollection = defaultMaxItemPerCollection, @JsonKey(name: "drag_n_drop") this.dragNdrop = false, this.theming = false, @JsonKey(name: "syncHr") this.syncHours = defaultSyncHourOffset, this.ads = true, @JsonKey(name: "syncInt") this.syncInterval = defaultBestEffortSyncInterval, @DateTimeConverter() this.activeTill, @JsonKey(name: "devices") this.maxSyncDevices = defaultNoOfSyncedDevices, @JsonKey(name: "cers") this.customExclusionRules = false, @JsonKey(name: "ps_limit") this.pasteStackLimit = defaultPasteStackLimit, this.grants = 0, this.tkn, @JsonKey(includeFromJson: false, includeToJson: false) this.managementUrl}): super._();
  factory _Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);

@override@JsonKey(includeToJson: false, includeFromJson: false) final  int? id;
@override@JsonKey(name: "id", includeToJson: false) final  int? serverId;
@override@JsonKey(name: "created")@DateTimeConverter() final  DateTime created;
@override@JsonKey(name: "modified")@DateTimeConverter() final  DateTime modified;
@override final  String userId;
@override final  String planName;
@override final  String subId;
@override final  String source;
@override@DateTimeConverter() final  DateTime? trialStart;
@override@DateTimeConverter() final  DateTime? trialEnd;
@override@JsonKey() final  int collections;
@override@JsonKey() final  int itemsPerCollection;
@override@JsonKey(name: "drag_n_drop") final  bool dragNdrop;
@override@JsonKey() final  bool theming;
@override@JsonKey(name: "syncHr") final  int syncHours;
@override@JsonKey() final  bool ads;
@override@JsonKey(name: "syncInt") final  int syncInterval;
@override@DateTimeConverter() final  DateTime? activeTill;
@override@JsonKey(name: "devices") final  int maxSyncDevices;
@override@JsonKey(name: "cers") final  bool customExclusionRules;
@override@JsonKey(name: "ps_limit") final  int pasteStackLimit;
@override@JsonKey() final  int grants;
@override final  String? tkn;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  String? managementUrl;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionCopyWith<_Subscription> get copyWith => __$SubscriptionCopyWithImpl<_Subscription>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Subscription&&(identical(other.id, id) || other.id == id)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.created, created) || other.created == created)&&(identical(other.modified, modified) || other.modified == modified)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.planName, planName) || other.planName == planName)&&(identical(other.subId, subId) || other.subId == subId)&&(identical(other.source, source) || other.source == source)&&(identical(other.trialStart, trialStart) || other.trialStart == trialStart)&&(identical(other.trialEnd, trialEnd) || other.trialEnd == trialEnd)&&(identical(other.collections, collections) || other.collections == collections)&&(identical(other.itemsPerCollection, itemsPerCollection) || other.itemsPerCollection == itemsPerCollection)&&(identical(other.dragNdrop, dragNdrop) || other.dragNdrop == dragNdrop)&&(identical(other.theming, theming) || other.theming == theming)&&(identical(other.syncHours, syncHours) || other.syncHours == syncHours)&&(identical(other.ads, ads) || other.ads == ads)&&(identical(other.syncInterval, syncInterval) || other.syncInterval == syncInterval)&&(identical(other.activeTill, activeTill) || other.activeTill == activeTill)&&(identical(other.maxSyncDevices, maxSyncDevices) || other.maxSyncDevices == maxSyncDevices)&&(identical(other.customExclusionRules, customExclusionRules) || other.customExclusionRules == customExclusionRules)&&(identical(other.pasteStackLimit, pasteStackLimit) || other.pasteStackLimit == pasteStackLimit)&&(identical(other.grants, grants) || other.grants == grants)&&(identical(other.tkn, tkn) || other.tkn == tkn)&&(identical(other.managementUrl, managementUrl) || other.managementUrl == managementUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,serverId,created,modified,userId,planName,subId,source,trialStart,trialEnd,collections,itemsPerCollection,dragNdrop,theming,syncHours,ads,syncInterval,activeTill,maxSyncDevices,customExclusionRules,pasteStackLimit,grants,tkn,managementUrl]);

@override
String toString() {
  return 'Subscription(id: $id, serverId: $serverId, created: $created, modified: $modified, userId: $userId, planName: $planName, subId: $subId, source: $source, trialStart: $trialStart, trialEnd: $trialEnd, collections: $collections, itemsPerCollection: $itemsPerCollection, dragNdrop: $dragNdrop, theming: $theming, syncHours: $syncHours, ads: $ads, syncInterval: $syncInterval, activeTill: $activeTill, maxSyncDevices: $maxSyncDevices, customExclusionRules: $customExclusionRules, pasteStackLimit: $pasteStackLimit, grants: $grants, tkn: $tkn, managementUrl: $managementUrl)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionCopyWith<$Res> implements $SubscriptionCopyWith<$Res> {
  factory _$SubscriptionCopyWith(_Subscription value, $Res Function(_Subscription) _then) = __$SubscriptionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false, includeFromJson: false) int? id,@JsonKey(name: "id", includeToJson: false) int? serverId,@JsonKey(name: "created")@DateTimeConverter() DateTime created,@JsonKey(name: "modified")@DateTimeConverter() DateTime modified, String userId, String planName, String subId, String source,@DateTimeConverter() DateTime? trialStart,@DateTimeConverter() DateTime? trialEnd, int collections, int itemsPerCollection,@JsonKey(name: "drag_n_drop") bool dragNdrop, bool theming,@JsonKey(name: "syncHr") int syncHours, bool ads,@JsonKey(name: "syncInt") int syncInterval,@DateTimeConverter() DateTime? activeTill,@JsonKey(name: "devices") int maxSyncDevices,@JsonKey(name: "cers") bool customExclusionRules,@JsonKey(name: "ps_limit") int pasteStackLimit, int grants, String? tkn,@JsonKey(includeFromJson: false, includeToJson: false) String? managementUrl
});




}
/// @nodoc
class __$SubscriptionCopyWithImpl<$Res>
    implements _$SubscriptionCopyWith<$Res> {
  __$SubscriptionCopyWithImpl(this._self, this._then);

  final _Subscription _self;
  final $Res Function(_Subscription) _then;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? serverId = freezed,Object? created = null,Object? modified = null,Object? userId = null,Object? planName = null,Object? subId = null,Object? source = null,Object? trialStart = freezed,Object? trialEnd = freezed,Object? collections = null,Object? itemsPerCollection = null,Object? dragNdrop = null,Object? theming = null,Object? syncHours = null,Object? ads = null,Object? syncInterval = null,Object? activeTill = freezed,Object? maxSyncDevices = null,Object? customExclusionRules = null,Object? pasteStackLimit = null,Object? grants = null,Object? tkn = freezed,Object? managementUrl = freezed,}) {
  return _then(_Subscription(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime,modified: null == modified ? _self.modified : modified // ignore: cast_nullable_to_non_nullable
as DateTime,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,planName: null == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String,subId: null == subId ? _self.subId : subId // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,trialStart: freezed == trialStart ? _self.trialStart : trialStart // ignore: cast_nullable_to_non_nullable
as DateTime?,trialEnd: freezed == trialEnd ? _self.trialEnd : trialEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,collections: null == collections ? _self.collections : collections // ignore: cast_nullable_to_non_nullable
as int,itemsPerCollection: null == itemsPerCollection ? _self.itemsPerCollection : itemsPerCollection // ignore: cast_nullable_to_non_nullable
as int,dragNdrop: null == dragNdrop ? _self.dragNdrop : dragNdrop // ignore: cast_nullable_to_non_nullable
as bool,theming: null == theming ? _self.theming : theming // ignore: cast_nullable_to_non_nullable
as bool,syncHours: null == syncHours ? _self.syncHours : syncHours // ignore: cast_nullable_to_non_nullable
as int,ads: null == ads ? _self.ads : ads // ignore: cast_nullable_to_non_nullable
as bool,syncInterval: null == syncInterval ? _self.syncInterval : syncInterval // ignore: cast_nullable_to_non_nullable
as int,activeTill: freezed == activeTill ? _self.activeTill : activeTill // ignore: cast_nullable_to_non_nullable
as DateTime?,maxSyncDevices: null == maxSyncDevices ? _self.maxSyncDevices : maxSyncDevices // ignore: cast_nullable_to_non_nullable
as int,customExclusionRules: null == customExclusionRules ? _self.customExclusionRules : customExclusionRules // ignore: cast_nullable_to_non_nullable
as bool,pasteStackLimit: null == pasteStackLimit ? _self.pasteStackLimit : pasteStackLimit // ignore: cast_nullable_to_non_nullable
as int,grants: null == grants ? _self.grants : grants // ignore: cast_nullable_to_non_nullable
as int,tkn: freezed == tkn ? _self.tkn : tkn // ignore: cast_nullable_to_non_nullable
as String?,managementUrl: freezed == managementUrl ? _self.managementUrl : managementUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
