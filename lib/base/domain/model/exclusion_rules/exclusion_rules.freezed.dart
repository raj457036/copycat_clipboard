// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exclusion_rules.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppInfo {

 String get name; String? get path; String? get identifier;
/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppInfoCopyWith<AppInfo> get copyWith => _$AppInfoCopyWithImpl<AppInfo>(this as AppInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.path, path) || other.path == path)&&(identical(other.identifier, identifier) || other.identifier == identifier));
}


@override
int get hashCode => Object.hash(runtimeType,name,path,identifier);

@override
String toString() {
  return 'AppInfo(name: $name, path: $path, identifier: $identifier)';
}


}

/// @nodoc
abstract mixin class $AppInfoCopyWith<$Res>  {
  factory $AppInfoCopyWith(AppInfo value, $Res Function(AppInfo) _then) = _$AppInfoCopyWithImpl;
@useResult
$Res call({
 String name, String? path, String? identifier
});




}
/// @nodoc
class _$AppInfoCopyWithImpl<$Res>
    implements $AppInfoCopyWith<$Res> {
  _$AppInfoCopyWithImpl(this._self, this._then);

  final AppInfo _self;
  final $Res Function(AppInfo) _then;

/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? path = freezed,Object? identifier = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,identifier: freezed == identifier ? _self.identifier : identifier // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppInfo].
extension AppInfoPatterns on AppInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppInfo value)  $default,){
final _that = this;
switch (_that) {
case _AppInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppInfo value)?  $default,){
final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? path,  String? identifier)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
return $default(_that.name,_that.path,_that.identifier);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? path,  String? identifier)  $default,) {final _that = this;
switch (_that) {
case _AppInfo():
return $default(_that.name,_that.path,_that.identifier);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? path,  String? identifier)?  $default,) {final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
return $default(_that.name,_that.path,_that.identifier);case _:
  return null;

}
}

}

/// @nodoc


class _AppInfo extends AppInfo {
   _AppInfo({this.name = '', this.path, this.identifier}): super._();
  

@override@JsonKey() final  String name;
@override final  String? path;
@override final  String? identifier;

/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppInfoCopyWith<_AppInfo> get copyWith => __$AppInfoCopyWithImpl<_AppInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.path, path) || other.path == path)&&(identical(other.identifier, identifier) || other.identifier == identifier));
}


@override
int get hashCode => Object.hash(runtimeType,name,path,identifier);

@override
String toString() {
  return 'AppInfo(name: $name, path: $path, identifier: $identifier)';
}


}

/// @nodoc
abstract mixin class _$AppInfoCopyWith<$Res> implements $AppInfoCopyWith<$Res> {
  factory _$AppInfoCopyWith(_AppInfo value, $Res Function(_AppInfo) _then) = __$AppInfoCopyWithImpl;
@override @useResult
$Res call({
 String name, String? path, String? identifier
});




}
/// @nodoc
class __$AppInfoCopyWithImpl<$Res>
    implements _$AppInfoCopyWith<$Res> {
  __$AppInfoCopyWithImpl(this._self, this._then);

  final _AppInfo _self;
  final $Res Function(_AppInfo) _then;

/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? path = freezed,Object? identifier = freezed,}) {
  return _then(_AppInfo(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,identifier: freezed == identifier ? _self.identifier : identifier // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ExclusionRules {

/// including password patterns and password managers
 bool get enable; bool get creditCard; bool get phone; bool get passwordManager; bool get email; bool get sensitiveUrls; List<String> get patterns; List<String> get titles; List<String> get urls; List<AppInfo> get apps;
/// Create a copy of ExclusionRules
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExclusionRulesCopyWith<ExclusionRules> get copyWith => _$ExclusionRulesCopyWithImpl<ExclusionRules>(this as ExclusionRules, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExclusionRules&&(identical(other.enable, enable) || other.enable == enable)&&(identical(other.creditCard, creditCard) || other.creditCard == creditCard)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.passwordManager, passwordManager) || other.passwordManager == passwordManager)&&(identical(other.email, email) || other.email == email)&&(identical(other.sensitiveUrls, sensitiveUrls) || other.sensitiveUrls == sensitiveUrls)&&const DeepCollectionEquality().equals(other.patterns, patterns)&&const DeepCollectionEquality().equals(other.titles, titles)&&const DeepCollectionEquality().equals(other.urls, urls)&&const DeepCollectionEquality().equals(other.apps, apps));
}


@override
int get hashCode => Object.hash(runtimeType,enable,creditCard,phone,passwordManager,email,sensitiveUrls,const DeepCollectionEquality().hash(patterns),const DeepCollectionEquality().hash(titles),const DeepCollectionEquality().hash(urls),const DeepCollectionEquality().hash(apps));

@override
String toString() {
  return 'ExclusionRules(enable: $enable, creditCard: $creditCard, phone: $phone, passwordManager: $passwordManager, email: $email, sensitiveUrls: $sensitiveUrls, patterns: $patterns, titles: $titles, urls: $urls, apps: $apps)';
}


}

/// @nodoc
abstract mixin class $ExclusionRulesCopyWith<$Res>  {
  factory $ExclusionRulesCopyWith(ExclusionRules value, $Res Function(ExclusionRules) _then) = _$ExclusionRulesCopyWithImpl;
@useResult
$Res call({
 bool enable, bool creditCard, bool phone, bool passwordManager, bool email, bool sensitiveUrls, List<String> patterns, List<String> titles, List<String> urls, List<AppInfo> apps
});




}
/// @nodoc
class _$ExclusionRulesCopyWithImpl<$Res>
    implements $ExclusionRulesCopyWith<$Res> {
  _$ExclusionRulesCopyWithImpl(this._self, this._then);

  final ExclusionRules _self;
  final $Res Function(ExclusionRules) _then;

/// Create a copy of ExclusionRules
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enable = null,Object? creditCard = null,Object? phone = null,Object? passwordManager = null,Object? email = null,Object? sensitiveUrls = null,Object? patterns = null,Object? titles = null,Object? urls = null,Object? apps = null,}) {
  return _then(_self.copyWith(
enable: null == enable ? _self.enable : enable // ignore: cast_nullable_to_non_nullable
as bool,creditCard: null == creditCard ? _self.creditCard : creditCard // ignore: cast_nullable_to_non_nullable
as bool,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as bool,passwordManager: null == passwordManager ? _self.passwordManager : passwordManager // ignore: cast_nullable_to_non_nullable
as bool,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as bool,sensitiveUrls: null == sensitiveUrls ? _self.sensitiveUrls : sensitiveUrls // ignore: cast_nullable_to_non_nullable
as bool,patterns: null == patterns ? _self.patterns : patterns // ignore: cast_nullable_to_non_nullable
as List<String>,titles: null == titles ? _self.titles : titles // ignore: cast_nullable_to_non_nullable
as List<String>,urls: null == urls ? _self.urls : urls // ignore: cast_nullable_to_non_nullable
as List<String>,apps: null == apps ? _self.apps : apps // ignore: cast_nullable_to_non_nullable
as List<AppInfo>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExclusionRules].
extension ExclusionRulesPatterns on ExclusionRules {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExclusionRules value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExclusionRules() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExclusionRules value)  $default,){
final _that = this;
switch (_that) {
case _ExclusionRules():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExclusionRules value)?  $default,){
final _that = this;
switch (_that) {
case _ExclusionRules() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enable,  bool creditCard,  bool phone,  bool passwordManager,  bool email,  bool sensitiveUrls,  List<String> patterns,  List<String> titles,  List<String> urls,  List<AppInfo> apps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExclusionRules() when $default != null:
return $default(_that.enable,_that.creditCard,_that.phone,_that.passwordManager,_that.email,_that.sensitiveUrls,_that.patterns,_that.titles,_that.urls,_that.apps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enable,  bool creditCard,  bool phone,  bool passwordManager,  bool email,  bool sensitiveUrls,  List<String> patterns,  List<String> titles,  List<String> urls,  List<AppInfo> apps)  $default,) {final _that = this;
switch (_that) {
case _ExclusionRules():
return $default(_that.enable,_that.creditCard,_that.phone,_that.passwordManager,_that.email,_that.sensitiveUrls,_that.patterns,_that.titles,_that.urls,_that.apps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enable,  bool creditCard,  bool phone,  bool passwordManager,  bool email,  bool sensitiveUrls,  List<String> patterns,  List<String> titles,  List<String> urls,  List<AppInfo> apps)?  $default,) {final _that = this;
switch (_that) {
case _ExclusionRules() when $default != null:
return $default(_that.enable,_that.creditCard,_that.phone,_that.passwordManager,_that.email,_that.sensitiveUrls,_that.patterns,_that.titles,_that.urls,_that.apps);case _:
  return null;

}
}

}

/// @nodoc


class _ExclusionRules extends ExclusionRules {
   _ExclusionRules({this.enable = true, this.creditCard = false, this.phone = false, this.passwordManager = true, this.email = false, this.sensitiveUrls = false, final  List<String> patterns = const [], final  List<String> titles = const [], final  List<String> urls = const [], final  List<AppInfo> apps = const []}): _patterns = patterns,_titles = titles,_urls = urls,_apps = apps,super._();
  

/// including password patterns and password managers
@override@JsonKey() final  bool enable;
@override@JsonKey() final  bool creditCard;
@override@JsonKey() final  bool phone;
@override@JsonKey() final  bool passwordManager;
@override@JsonKey() final  bool email;
@override@JsonKey() final  bool sensitiveUrls;
 final  List<String> _patterns;
@override@JsonKey() List<String> get patterns {
  if (_patterns is EqualUnmodifiableListView) return _patterns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_patterns);
}

 final  List<String> _titles;
@override@JsonKey() List<String> get titles {
  if (_titles is EqualUnmodifiableListView) return _titles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_titles);
}

 final  List<String> _urls;
@override@JsonKey() List<String> get urls {
  if (_urls is EqualUnmodifiableListView) return _urls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_urls);
}

 final  List<AppInfo> _apps;
@override@JsonKey() List<AppInfo> get apps {
  if (_apps is EqualUnmodifiableListView) return _apps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_apps);
}


/// Create a copy of ExclusionRules
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExclusionRulesCopyWith<_ExclusionRules> get copyWith => __$ExclusionRulesCopyWithImpl<_ExclusionRules>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExclusionRules&&(identical(other.enable, enable) || other.enable == enable)&&(identical(other.creditCard, creditCard) || other.creditCard == creditCard)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.passwordManager, passwordManager) || other.passwordManager == passwordManager)&&(identical(other.email, email) || other.email == email)&&(identical(other.sensitiveUrls, sensitiveUrls) || other.sensitiveUrls == sensitiveUrls)&&const DeepCollectionEquality().equals(other._patterns, _patterns)&&const DeepCollectionEquality().equals(other._titles, _titles)&&const DeepCollectionEquality().equals(other._urls, _urls)&&const DeepCollectionEquality().equals(other._apps, _apps));
}


@override
int get hashCode => Object.hash(runtimeType,enable,creditCard,phone,passwordManager,email,sensitiveUrls,const DeepCollectionEquality().hash(_patterns),const DeepCollectionEquality().hash(_titles),const DeepCollectionEquality().hash(_urls),const DeepCollectionEquality().hash(_apps));

@override
String toString() {
  return 'ExclusionRules(enable: $enable, creditCard: $creditCard, phone: $phone, passwordManager: $passwordManager, email: $email, sensitiveUrls: $sensitiveUrls, patterns: $patterns, titles: $titles, urls: $urls, apps: $apps)';
}


}

/// @nodoc
abstract mixin class _$ExclusionRulesCopyWith<$Res> implements $ExclusionRulesCopyWith<$Res> {
  factory _$ExclusionRulesCopyWith(_ExclusionRules value, $Res Function(_ExclusionRules) _then) = __$ExclusionRulesCopyWithImpl;
@override @useResult
$Res call({
 bool enable, bool creditCard, bool phone, bool passwordManager, bool email, bool sensitiveUrls, List<String> patterns, List<String> titles, List<String> urls, List<AppInfo> apps
});




}
/// @nodoc
class __$ExclusionRulesCopyWithImpl<$Res>
    implements _$ExclusionRulesCopyWith<$Res> {
  __$ExclusionRulesCopyWithImpl(this._self, this._then);

  final _ExclusionRules _self;
  final $Res Function(_ExclusionRules) _then;

/// Create a copy of ExclusionRules
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enable = null,Object? creditCard = null,Object? phone = null,Object? passwordManager = null,Object? email = null,Object? sensitiveUrls = null,Object? patterns = null,Object? titles = null,Object? urls = null,Object? apps = null,}) {
  return _then(_ExclusionRules(
enable: null == enable ? _self.enable : enable // ignore: cast_nullable_to_non_nullable
as bool,creditCard: null == creditCard ? _self.creditCard : creditCard // ignore: cast_nullable_to_non_nullable
as bool,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as bool,passwordManager: null == passwordManager ? _self.passwordManager : passwordManager // ignore: cast_nullable_to_non_nullable
as bool,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as bool,sensitiveUrls: null == sensitiveUrls ? _self.sensitiveUrls : sensitiveUrls // ignore: cast_nullable_to_non_nullable
as bool,patterns: null == patterns ? _self._patterns : patterns // ignore: cast_nullable_to_non_nullable
as List<String>,titles: null == titles ? _self._titles : titles // ignore: cast_nullable_to_non_nullable
as List<String>,urls: null == urls ? _self._urls : urls // ignore: cast_nullable_to_non_nullable
as List<String>,apps: null == apps ? _self._apps : apps // ignore: cast_nullable_to_non_nullable
as List<AppInfo>,
  ));
}


}

// dart format on
