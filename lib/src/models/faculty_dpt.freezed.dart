// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'faculty_dpt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FacultyDpt _$FacultyDptFromJson(Map<String, dynamic> json) {
  return _FacultyDpt.fromJson(json);
}

/// @nodoc
class _$FacultyDptTearOff {
  const _$FacultyDptTearOff();

  _FacultyDpt call(
      {required String dptCode,
      required String dptName,
      required String faculty}) {
    return _FacultyDpt(
      dptCode: dptCode,
      dptName: dptName,
      faculty: faculty,
    );
  }

  FacultyDpt fromJson(Map<String, Object?> json) {
    return FacultyDpt.fromJson(json);
  }
}

/// @nodoc
const $FacultyDpt = _$FacultyDptTearOff();

/// @nodoc
mixin _$FacultyDpt {
  String get dptCode => throw _privateConstructorUsedError;
  String get dptName => throw _privateConstructorUsedError;

  /// as picked from [Faculty]
  String get faculty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacultyDptCopyWith<FacultyDpt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacultyDptCopyWith<$Res> {
  factory $FacultyDptCopyWith(
          FacultyDpt value, $Res Function(FacultyDpt) then) =
      _$FacultyDptCopyWithImpl<$Res>;
  $Res call({String dptCode, String dptName, String faculty});
}

/// @nodoc
class _$FacultyDptCopyWithImpl<$Res> implements $FacultyDptCopyWith<$Res> {
  _$FacultyDptCopyWithImpl(this._value, this._then);

  final FacultyDpt _value;
  // ignore: unused_field
  final $Res Function(FacultyDpt) _then;

  @override
  $Res call({
    Object? dptCode = freezed,
    Object? dptName = freezed,
    Object? faculty = freezed,
  }) {
    return _then(_value.copyWith(
      dptCode: dptCode == freezed
          ? _value.dptCode
          : dptCode // ignore: cast_nullable_to_non_nullable
              as String,
      dptName: dptName == freezed
          ? _value.dptName
          : dptName // ignore: cast_nullable_to_non_nullable
              as String,
      faculty: faculty == freezed
          ? _value.faculty
          : faculty // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FacultyDptCopyWith<$Res> implements $FacultyDptCopyWith<$Res> {
  factory _$FacultyDptCopyWith(
          _FacultyDpt value, $Res Function(_FacultyDpt) then) =
      __$FacultyDptCopyWithImpl<$Res>;
  @override
  $Res call({String dptCode, String dptName, String faculty});
}

/// @nodoc
class __$FacultyDptCopyWithImpl<$Res> extends _$FacultyDptCopyWithImpl<$Res>
    implements _$FacultyDptCopyWith<$Res> {
  __$FacultyDptCopyWithImpl(
      _FacultyDpt _value, $Res Function(_FacultyDpt) _then)
      : super(_value, (v) => _then(v as _FacultyDpt));

  @override
  _FacultyDpt get _value => super._value as _FacultyDpt;

  @override
  $Res call({
    Object? dptCode = freezed,
    Object? dptName = freezed,
    Object? faculty = freezed,
  }) {
    return _then(_FacultyDpt(
      dptCode: dptCode == freezed
          ? _value.dptCode
          : dptCode // ignore: cast_nullable_to_non_nullable
              as String,
      dptName: dptName == freezed
          ? _value.dptName
          : dptName // ignore: cast_nullable_to_non_nullable
              as String,
      faculty: faculty == freezed
          ? _value.faculty
          : faculty // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FacultyDpt implements _FacultyDpt {
  _$_FacultyDpt(
      {required this.dptCode, required this.dptName, required this.faculty});

  factory _$_FacultyDpt.fromJson(Map<String, dynamic> json) =>
      _$$_FacultyDptFromJson(json);

  @override
  final String dptCode;
  @override
  final String dptName;
  @override

  /// as picked from [Faculty]
  final String faculty;

  @override
  String toString() {
    return 'FacultyDpt(dptCode: $dptCode, dptName: $dptName, faculty: $faculty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FacultyDpt &&
            const DeepCollectionEquality().equals(other.dptCode, dptCode) &&
            const DeepCollectionEquality().equals(other.dptName, dptName) &&
            const DeepCollectionEquality().equals(other.faculty, faculty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dptCode),
      const DeepCollectionEquality().hash(dptName),
      const DeepCollectionEquality().hash(faculty));

  @JsonKey(ignore: true)
  @override
  _$FacultyDptCopyWith<_FacultyDpt> get copyWith =>
      __$FacultyDptCopyWithImpl<_FacultyDpt>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FacultyDptToJson(this);
  }
}

abstract class _FacultyDpt implements FacultyDpt {
  factory _FacultyDpt(
      {required String dptCode,
      required String dptName,
      required String faculty}) = _$_FacultyDpt;

  factory _FacultyDpt.fromJson(Map<String, dynamic> json) =
      _$_FacultyDpt.fromJson;

  @override
  String get dptCode;
  @override
  String get dptName;
  @override

  /// as picked from [Faculty]
  String get faculty;
  @override
  @JsonKey(ignore: true)
  _$FacultyDptCopyWith<_FacultyDpt> get copyWith =>
      throw _privateConstructorUsedError;
}
