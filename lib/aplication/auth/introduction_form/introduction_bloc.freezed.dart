// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'introduction_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IntroductionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String restoName) restoName,
    required TResult Function(String restoLocation) restoLocation,
    required TResult Function(String restotable) restoTable,
    required TResult Function() createResto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String restoName)? restoName,
    TResult Function(String restoLocation)? restoLocation,
    TResult Function(String restotable)? restoTable,
    TResult Function()? createResto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String restoName)? restoName,
    TResult Function(String restoLocation)? restoLocation,
    TResult Function(String restotable)? restoTable,
    TResult Function()? createResto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RestoName value) restoName,
    required TResult Function(_RestoLocation value) restoLocation,
    required TResult Function(_RestoTable value) restoTable,
    required TResult Function(_CreateResto value) createResto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RestoName value)? restoName,
    TResult Function(_RestoLocation value)? restoLocation,
    TResult Function(_RestoTable value)? restoTable,
    TResult Function(_CreateResto value)? createResto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RestoName value)? restoName,
    TResult Function(_RestoLocation value)? restoLocation,
    TResult Function(_RestoTable value)? restoTable,
    TResult Function(_CreateResto value)? createResto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroductionEventCopyWith<$Res> {
  factory $IntroductionEventCopyWith(
          IntroductionEvent value, $Res Function(IntroductionEvent) then) =
      _$IntroductionEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$IntroductionEventCopyWithImpl<$Res>
    implements $IntroductionEventCopyWith<$Res> {
  _$IntroductionEventCopyWithImpl(this._value, this._then);

  final IntroductionEvent _value;
  // ignore: unused_field
  final $Res Function(IntroductionEvent) _then;
}

/// @nodoc
abstract class _$$_RestoNameCopyWith<$Res> {
  factory _$$_RestoNameCopyWith(
          _$_RestoName value, $Res Function(_$_RestoName) then) =
      __$$_RestoNameCopyWithImpl<$Res>;
  $Res call({String restoName});
}

/// @nodoc
class __$$_RestoNameCopyWithImpl<$Res>
    extends _$IntroductionEventCopyWithImpl<$Res>
    implements _$$_RestoNameCopyWith<$Res> {
  __$$_RestoNameCopyWithImpl(
      _$_RestoName _value, $Res Function(_$_RestoName) _then)
      : super(_value, (v) => _then(v as _$_RestoName));

  @override
  _$_RestoName get _value => super._value as _$_RestoName;

  @override
  $Res call({
    Object? restoName = freezed,
  }) {
    return _then(_$_RestoName(
      restoName == freezed
          ? _value.restoName
          : restoName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RestoName implements _RestoName {
  const _$_RestoName(this.restoName);

  @override
  final String restoName;

  @override
  String toString() {
    return 'IntroductionEvent.restoName(restoName: $restoName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestoName &&
            const DeepCollectionEquality().equals(other.restoName, restoName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(restoName));

  @JsonKey(ignore: true)
  @override
  _$$_RestoNameCopyWith<_$_RestoName> get copyWith =>
      __$$_RestoNameCopyWithImpl<_$_RestoName>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String restoName) restoName,
    required TResult Function(String restoLocation) restoLocation,
    required TResult Function(String restotable) restoTable,
    required TResult Function() createResto,
  }) {
    return restoName(this.restoName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String restoName)? restoName,
    TResult Function(String restoLocation)? restoLocation,
    TResult Function(String restotable)? restoTable,
    TResult Function()? createResto,
  }) {
    return restoName?.call(this.restoName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String restoName)? restoName,
    TResult Function(String restoLocation)? restoLocation,
    TResult Function(String restotable)? restoTable,
    TResult Function()? createResto,
    required TResult orElse(),
  }) {
    if (restoName != null) {
      return restoName(this.restoName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RestoName value) restoName,
    required TResult Function(_RestoLocation value) restoLocation,
    required TResult Function(_RestoTable value) restoTable,
    required TResult Function(_CreateResto value) createResto,
  }) {
    return restoName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RestoName value)? restoName,
    TResult Function(_RestoLocation value)? restoLocation,
    TResult Function(_RestoTable value)? restoTable,
    TResult Function(_CreateResto value)? createResto,
  }) {
    return restoName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RestoName value)? restoName,
    TResult Function(_RestoLocation value)? restoLocation,
    TResult Function(_RestoTable value)? restoTable,
    TResult Function(_CreateResto value)? createResto,
    required TResult orElse(),
  }) {
    if (restoName != null) {
      return restoName(this);
    }
    return orElse();
  }
}

abstract class _RestoName implements IntroductionEvent {
  const factory _RestoName(final String restoName) = _$_RestoName;

  String get restoName => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_RestoNameCopyWith<_$_RestoName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RestoLocationCopyWith<$Res> {
  factory _$$_RestoLocationCopyWith(
          _$_RestoLocation value, $Res Function(_$_RestoLocation) then) =
      __$$_RestoLocationCopyWithImpl<$Res>;
  $Res call({String restoLocation});
}

/// @nodoc
class __$$_RestoLocationCopyWithImpl<$Res>
    extends _$IntroductionEventCopyWithImpl<$Res>
    implements _$$_RestoLocationCopyWith<$Res> {
  __$$_RestoLocationCopyWithImpl(
      _$_RestoLocation _value, $Res Function(_$_RestoLocation) _then)
      : super(_value, (v) => _then(v as _$_RestoLocation));

  @override
  _$_RestoLocation get _value => super._value as _$_RestoLocation;

  @override
  $Res call({
    Object? restoLocation = freezed,
  }) {
    return _then(_$_RestoLocation(
      restoLocation == freezed
          ? _value.restoLocation
          : restoLocation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RestoLocation implements _RestoLocation {
  const _$_RestoLocation(this.restoLocation);

  @override
  final String restoLocation;

  @override
  String toString() {
    return 'IntroductionEvent.restoLocation(restoLocation: $restoLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestoLocation &&
            const DeepCollectionEquality()
                .equals(other.restoLocation, restoLocation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(restoLocation));

  @JsonKey(ignore: true)
  @override
  _$$_RestoLocationCopyWith<_$_RestoLocation> get copyWith =>
      __$$_RestoLocationCopyWithImpl<_$_RestoLocation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String restoName) restoName,
    required TResult Function(String restoLocation) restoLocation,
    required TResult Function(String restotable) restoTable,
    required TResult Function() createResto,
  }) {
    return restoLocation(this.restoLocation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String restoName)? restoName,
    TResult Function(String restoLocation)? restoLocation,
    TResult Function(String restotable)? restoTable,
    TResult Function()? createResto,
  }) {
    return restoLocation?.call(this.restoLocation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String restoName)? restoName,
    TResult Function(String restoLocation)? restoLocation,
    TResult Function(String restotable)? restoTable,
    TResult Function()? createResto,
    required TResult orElse(),
  }) {
    if (restoLocation != null) {
      return restoLocation(this.restoLocation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RestoName value) restoName,
    required TResult Function(_RestoLocation value) restoLocation,
    required TResult Function(_RestoTable value) restoTable,
    required TResult Function(_CreateResto value) createResto,
  }) {
    return restoLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RestoName value)? restoName,
    TResult Function(_RestoLocation value)? restoLocation,
    TResult Function(_RestoTable value)? restoTable,
    TResult Function(_CreateResto value)? createResto,
  }) {
    return restoLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RestoName value)? restoName,
    TResult Function(_RestoLocation value)? restoLocation,
    TResult Function(_RestoTable value)? restoTable,
    TResult Function(_CreateResto value)? createResto,
    required TResult orElse(),
  }) {
    if (restoLocation != null) {
      return restoLocation(this);
    }
    return orElse();
  }
}

abstract class _RestoLocation implements IntroductionEvent {
  const factory _RestoLocation(final String restoLocation) = _$_RestoLocation;

  String get restoLocation => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_RestoLocationCopyWith<_$_RestoLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RestoTableCopyWith<$Res> {
  factory _$$_RestoTableCopyWith(
          _$_RestoTable value, $Res Function(_$_RestoTable) then) =
      __$$_RestoTableCopyWithImpl<$Res>;
  $Res call({String restotable});
}

/// @nodoc
class __$$_RestoTableCopyWithImpl<$Res>
    extends _$IntroductionEventCopyWithImpl<$Res>
    implements _$$_RestoTableCopyWith<$Res> {
  __$$_RestoTableCopyWithImpl(
      _$_RestoTable _value, $Res Function(_$_RestoTable) _then)
      : super(_value, (v) => _then(v as _$_RestoTable));

  @override
  _$_RestoTable get _value => super._value as _$_RestoTable;

  @override
  $Res call({
    Object? restotable = freezed,
  }) {
    return _then(_$_RestoTable(
      restotable == freezed
          ? _value.restotable
          : restotable // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RestoTable implements _RestoTable {
  const _$_RestoTable(this.restotable);

  @override
  final String restotable;

  @override
  String toString() {
    return 'IntroductionEvent.restoTable(restotable: $restotable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestoTable &&
            const DeepCollectionEquality()
                .equals(other.restotable, restotable));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(restotable));

  @JsonKey(ignore: true)
  @override
  _$$_RestoTableCopyWith<_$_RestoTable> get copyWith =>
      __$$_RestoTableCopyWithImpl<_$_RestoTable>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String restoName) restoName,
    required TResult Function(String restoLocation) restoLocation,
    required TResult Function(String restotable) restoTable,
    required TResult Function() createResto,
  }) {
    return restoTable(restotable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String restoName)? restoName,
    TResult Function(String restoLocation)? restoLocation,
    TResult Function(String restotable)? restoTable,
    TResult Function()? createResto,
  }) {
    return restoTable?.call(restotable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String restoName)? restoName,
    TResult Function(String restoLocation)? restoLocation,
    TResult Function(String restotable)? restoTable,
    TResult Function()? createResto,
    required TResult orElse(),
  }) {
    if (restoTable != null) {
      return restoTable(restotable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RestoName value) restoName,
    required TResult Function(_RestoLocation value) restoLocation,
    required TResult Function(_RestoTable value) restoTable,
    required TResult Function(_CreateResto value) createResto,
  }) {
    return restoTable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RestoName value)? restoName,
    TResult Function(_RestoLocation value)? restoLocation,
    TResult Function(_RestoTable value)? restoTable,
    TResult Function(_CreateResto value)? createResto,
  }) {
    return restoTable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RestoName value)? restoName,
    TResult Function(_RestoLocation value)? restoLocation,
    TResult Function(_RestoTable value)? restoTable,
    TResult Function(_CreateResto value)? createResto,
    required TResult orElse(),
  }) {
    if (restoTable != null) {
      return restoTable(this);
    }
    return orElse();
  }
}

abstract class _RestoTable implements IntroductionEvent {
  const factory _RestoTable(final String restotable) = _$_RestoTable;

  String get restotable => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_RestoTableCopyWith<_$_RestoTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CreateRestoCopyWith<$Res> {
  factory _$$_CreateRestoCopyWith(
          _$_CreateResto value, $Res Function(_$_CreateResto) then) =
      __$$_CreateRestoCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CreateRestoCopyWithImpl<$Res>
    extends _$IntroductionEventCopyWithImpl<$Res>
    implements _$$_CreateRestoCopyWith<$Res> {
  __$$_CreateRestoCopyWithImpl(
      _$_CreateResto _value, $Res Function(_$_CreateResto) _then)
      : super(_value, (v) => _then(v as _$_CreateResto));

  @override
  _$_CreateResto get _value => super._value as _$_CreateResto;
}

/// @nodoc

class _$_CreateResto implements _CreateResto {
  const _$_CreateResto();

  @override
  String toString() {
    return 'IntroductionEvent.createResto()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CreateResto);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String restoName) restoName,
    required TResult Function(String restoLocation) restoLocation,
    required TResult Function(String restotable) restoTable,
    required TResult Function() createResto,
  }) {
    return createResto();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String restoName)? restoName,
    TResult Function(String restoLocation)? restoLocation,
    TResult Function(String restotable)? restoTable,
    TResult Function()? createResto,
  }) {
    return createResto?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String restoName)? restoName,
    TResult Function(String restoLocation)? restoLocation,
    TResult Function(String restotable)? restoTable,
    TResult Function()? createResto,
    required TResult orElse(),
  }) {
    if (createResto != null) {
      return createResto();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RestoName value) restoName,
    required TResult Function(_RestoLocation value) restoLocation,
    required TResult Function(_RestoTable value) restoTable,
    required TResult Function(_CreateResto value) createResto,
  }) {
    return createResto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RestoName value)? restoName,
    TResult Function(_RestoLocation value)? restoLocation,
    TResult Function(_RestoTable value)? restoTable,
    TResult Function(_CreateResto value)? createResto,
  }) {
    return createResto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RestoName value)? restoName,
    TResult Function(_RestoLocation value)? restoLocation,
    TResult Function(_RestoTable value)? restoTable,
    TResult Function(_CreateResto value)? createResto,
    required TResult orElse(),
  }) {
    if (createResto != null) {
      return createResto(this);
    }
    return orElse();
  }
}

abstract class _CreateResto implements IntroductionEvent {
  const factory _CreateResto() = _$_CreateResto;
}

/// @nodoc
mixin _$IntroductionState {
  RestoFields get restoName => throw _privateConstructorUsedError;
  RestoFields get restoLocation => throw _privateConstructorUsedError;
  RestoFields get tableNumber => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IntroductionStateCopyWith<IntroductionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroductionStateCopyWith<$Res> {
  factory $IntroductionStateCopyWith(
          IntroductionState value, $Res Function(IntroductionState) then) =
      _$IntroductionStateCopyWithImpl<$Res>;
  $Res call(
      {RestoFields restoName,
      RestoFields restoLocation,
      RestoFields tableNumber,
      bool isSubmitting});
}

/// @nodoc
class _$IntroductionStateCopyWithImpl<$Res>
    implements $IntroductionStateCopyWith<$Res> {
  _$IntroductionStateCopyWithImpl(this._value, this._then);

  final IntroductionState _value;
  // ignore: unused_field
  final $Res Function(IntroductionState) _then;

  @override
  $Res call({
    Object? restoName = freezed,
    Object? restoLocation = freezed,
    Object? tableNumber = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_value.copyWith(
      restoName: restoName == freezed
          ? _value.restoName
          : restoName // ignore: cast_nullable_to_non_nullable
              as RestoFields,
      restoLocation: restoLocation == freezed
          ? _value.restoLocation
          : restoLocation // ignore: cast_nullable_to_non_nullable
              as RestoFields,
      tableNumber: tableNumber == freezed
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as RestoFields,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_IntroductionStateCopyWith<$Res>
    implements $IntroductionStateCopyWith<$Res> {
  factory _$$_IntroductionStateCopyWith(_$_IntroductionState value,
          $Res Function(_$_IntroductionState) then) =
      __$$_IntroductionStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {RestoFields restoName,
      RestoFields restoLocation,
      RestoFields tableNumber,
      bool isSubmitting});
}

/// @nodoc
class __$$_IntroductionStateCopyWithImpl<$Res>
    extends _$IntroductionStateCopyWithImpl<$Res>
    implements _$$_IntroductionStateCopyWith<$Res> {
  __$$_IntroductionStateCopyWithImpl(
      _$_IntroductionState _value, $Res Function(_$_IntroductionState) _then)
      : super(_value, (v) => _then(v as _$_IntroductionState));

  @override
  _$_IntroductionState get _value => super._value as _$_IntroductionState;

  @override
  $Res call({
    Object? restoName = freezed,
    Object? restoLocation = freezed,
    Object? tableNumber = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_$_IntroductionState(
      restoName: restoName == freezed
          ? _value.restoName
          : restoName // ignore: cast_nullable_to_non_nullable
              as RestoFields,
      restoLocation: restoLocation == freezed
          ? _value.restoLocation
          : restoLocation // ignore: cast_nullable_to_non_nullable
              as RestoFields,
      tableNumber: tableNumber == freezed
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as RestoFields,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_IntroductionState implements _IntroductionState {
  const _$_IntroductionState(
      {required this.restoName,
      required this.restoLocation,
      required this.tableNumber,
      required this.isSubmitting});

  @override
  final RestoFields restoName;
  @override
  final RestoFields restoLocation;
  @override
  final RestoFields tableNumber;
  @override
  final bool isSubmitting;

  @override
  String toString() {
    return 'IntroductionState(restoName: $restoName, restoLocation: $restoLocation, tableNumber: $tableNumber, isSubmitting: $isSubmitting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IntroductionState &&
            const DeepCollectionEquality().equals(other.restoName, restoName) &&
            const DeepCollectionEquality()
                .equals(other.restoLocation, restoLocation) &&
            const DeepCollectionEquality()
                .equals(other.tableNumber, tableNumber) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(restoName),
      const DeepCollectionEquality().hash(restoLocation),
      const DeepCollectionEquality().hash(tableNumber),
      const DeepCollectionEquality().hash(isSubmitting));

  @JsonKey(ignore: true)
  @override
  _$$_IntroductionStateCopyWith<_$_IntroductionState> get copyWith =>
      __$$_IntroductionStateCopyWithImpl<_$_IntroductionState>(
          this, _$identity);
}

abstract class _IntroductionState implements IntroductionState {
  const factory _IntroductionState(
      {required final RestoFields restoName,
      required final RestoFields restoLocation,
      required final RestoFields tableNumber,
      required final bool isSubmitting}) = _$_IntroductionState;

  @override
  RestoFields get restoName => throw _privateConstructorUsedError;
  @override
  RestoFields get restoLocation => throw _privateConstructorUsedError;
  @override
  RestoFields get tableNumber => throw _privateConstructorUsedError;
  @override
  bool get isSubmitting => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_IntroductionStateCopyWith<_$_IntroductionState> get copyWith =>
      throw _privateConstructorUsedError;
}
