// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monetization_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MonetizationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(Subscription subscription) active,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(Subscription subscription)? active,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(Subscription subscription)? active,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MonetizationUnknown value) unknown,
    required TResult Function(MonetizationActive value) active,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MonetizationUnknown value)? unknown,
    TResult? Function(MonetizationActive value)? active,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MonetizationUnknown value)? unknown,
    TResult Function(MonetizationActive value)? active,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonetizationStateCopyWith<$Res> {
  factory $MonetizationStateCopyWith(
          MonetizationState value, $Res Function(MonetizationState) then) =
      _$MonetizationStateCopyWithImpl<$Res, MonetizationState>;
}

/// @nodoc
class _$MonetizationStateCopyWithImpl<$Res, $Val extends MonetizationState>
    implements $MonetizationStateCopyWith<$Res> {
  _$MonetizationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MonetizationUnknownImplCopyWith<$Res> {
  factory _$$MonetizationUnknownImplCopyWith(_$MonetizationUnknownImpl value,
          $Res Function(_$MonetizationUnknownImpl) then) =
      __$$MonetizationUnknownImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MonetizationUnknownImplCopyWithImpl<$Res>
    extends _$MonetizationStateCopyWithImpl<$Res, _$MonetizationUnknownImpl>
    implements _$$MonetizationUnknownImplCopyWith<$Res> {
  __$$MonetizationUnknownImplCopyWithImpl(_$MonetizationUnknownImpl _value,
      $Res Function(_$MonetizationUnknownImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MonetizationUnknownImpl implements MonetizationUnknown {
  const _$MonetizationUnknownImpl();

  @override
  String toString() {
    return 'MonetizationState.unknown()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonetizationUnknownImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(Subscription subscription) active,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(Subscription subscription)? active,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(Subscription subscription)? active,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MonetizationUnknown value) unknown,
    required TResult Function(MonetizationActive value) active,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MonetizationUnknown value)? unknown,
    TResult? Function(MonetizationActive value)? active,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MonetizationUnknown value)? unknown,
    TResult Function(MonetizationActive value)? active,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class MonetizationUnknown implements MonetizationState {
  const factory MonetizationUnknown() = _$MonetizationUnknownImpl;
}

/// @nodoc
abstract class _$$MonetizationActiveImplCopyWith<$Res> {
  factory _$$MonetizationActiveImplCopyWith(_$MonetizationActiveImpl value,
          $Res Function(_$MonetizationActiveImpl) then) =
      __$$MonetizationActiveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Subscription subscription});

  $SubscriptionCopyWith<$Res> get subscription;
}

/// @nodoc
class __$$MonetizationActiveImplCopyWithImpl<$Res>
    extends _$MonetizationStateCopyWithImpl<$Res, _$MonetizationActiveImpl>
    implements _$$MonetizationActiveImplCopyWith<$Res> {
  __$$MonetizationActiveImplCopyWithImpl(_$MonetizationActiveImpl _value,
      $Res Function(_$MonetizationActiveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription = null,
  }) {
    return _then(_$MonetizationActiveImpl(
      subscription: null == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as Subscription,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SubscriptionCopyWith<$Res> get subscription {
    return $SubscriptionCopyWith<$Res>(_value.subscription, (value) {
      return _then(_value.copyWith(subscription: value));
    });
  }
}

/// @nodoc

class _$MonetizationActiveImpl implements MonetizationActive {
  const _$MonetizationActiveImpl({required this.subscription});

  @override
  final Subscription subscription;

  @override
  String toString() {
    return 'MonetizationState.active(subscription: $subscription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonetizationActiveImpl &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subscription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonetizationActiveImplCopyWith<_$MonetizationActiveImpl> get copyWith =>
      __$$MonetizationActiveImplCopyWithImpl<_$MonetizationActiveImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(Subscription subscription) active,
  }) {
    return active(subscription);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(Subscription subscription)? active,
  }) {
    return active?.call(subscription);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(Subscription subscription)? active,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(subscription);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MonetizationUnknown value) unknown,
    required TResult Function(MonetizationActive value) active,
  }) {
    return active(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MonetizationUnknown value)? unknown,
    TResult? Function(MonetizationActive value)? active,
  }) {
    return active?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MonetizationUnknown value)? unknown,
    TResult Function(MonetizationActive value)? active,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(this);
    }
    return orElse();
  }
}

abstract class MonetizationActive implements MonetizationState {
  const factory MonetizationActive({required final Subscription subscription}) =
      _$MonetizationActiveImpl;

  Subscription get subscription;
  @JsonKey(ignore: true)
  _$$MonetizationActiveImplCopyWith<_$MonetizationActiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
