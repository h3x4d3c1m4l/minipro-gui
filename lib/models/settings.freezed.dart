// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Settings {
  String? get languageCode => throw _privateConstructorUsedError;
  int get settingsUpgradedToBuild => throw _privateConstructorUsedError;
  String get settingsUpgradedToVersion => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsCopyWith<Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res>;
  $Res call(
      {String? languageCode,
      int settingsUpgradedToBuild,
      String settingsUpgradedToVersion});
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res> implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  final Settings _value;
  // ignore: unused_field
  final $Res Function(Settings) _then;

  @override
  $Res call({
    Object? languageCode = freezed,
    Object? settingsUpgradedToBuild = freezed,
    Object? settingsUpgradedToVersion = freezed,
  }) {
    return _then(_value.copyWith(
      languageCode: languageCode == freezed
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      settingsUpgradedToBuild: settingsUpgradedToBuild == freezed
          ? _value.settingsUpgradedToBuild
          : settingsUpgradedToBuild // ignore: cast_nullable_to_non_nullable
              as int,
      settingsUpgradedToVersion: settingsUpgradedToVersion == freezed
          ? _value.settingsUpgradedToVersion
          : settingsUpgradedToVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$$_SettingsCopyWith(
          _$_Settings value, $Res Function(_$_Settings) then) =
      __$$_SettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? languageCode,
      int settingsUpgradedToBuild,
      String settingsUpgradedToVersion});
}

/// @nodoc
class __$$_SettingsCopyWithImpl<$Res> extends _$SettingsCopyWithImpl<$Res>
    implements _$$_SettingsCopyWith<$Res> {
  __$$_SettingsCopyWithImpl(
      _$_Settings _value, $Res Function(_$_Settings) _then)
      : super(_value, (v) => _then(v as _$_Settings));

  @override
  _$_Settings get _value => super._value as _$_Settings;

  @override
  $Res call({
    Object? languageCode = freezed,
    Object? settingsUpgradedToBuild = freezed,
    Object? settingsUpgradedToVersion = freezed,
  }) {
    return _then(_$_Settings(
      languageCode: languageCode == freezed
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      settingsUpgradedToBuild: settingsUpgradedToBuild == freezed
          ? _value.settingsUpgradedToBuild
          : settingsUpgradedToBuild // ignore: cast_nullable_to_non_nullable
              as int,
      settingsUpgradedToVersion: settingsUpgradedToVersion == freezed
          ? _value.settingsUpgradedToVersion
          : settingsUpgradedToVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Settings extends _Settings {
  const _$_Settings(
      {this.languageCode,
      required this.settingsUpgradedToBuild,
      required this.settingsUpgradedToVersion})
      : super._();

  @override
  final String? languageCode;
  @override
  final int settingsUpgradedToBuild;
  @override
  final String settingsUpgradedToVersion;

  @override
  String toString() {
    return 'Settings(languageCode: $languageCode, settingsUpgradedToBuild: $settingsUpgradedToBuild, settingsUpgradedToVersion: $settingsUpgradedToVersion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Settings &&
            const DeepCollectionEquality()
                .equals(other.languageCode, languageCode) &&
            const DeepCollectionEquality().equals(
                other.settingsUpgradedToBuild, settingsUpgradedToBuild) &&
            const DeepCollectionEquality().equals(
                other.settingsUpgradedToVersion, settingsUpgradedToVersion));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(languageCode),
      const DeepCollectionEquality().hash(settingsUpgradedToBuild),
      const DeepCollectionEquality().hash(settingsUpgradedToVersion));

  @JsonKey(ignore: true)
  @override
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      __$$_SettingsCopyWithImpl<_$_Settings>(this, _$identity);
}

abstract class _Settings extends Settings {
  const factory _Settings(
      {final String? languageCode,
      required final int settingsUpgradedToBuild,
      required final String settingsUpgradedToVersion}) = _$_Settings;
  const _Settings._() : super._();

  @override
  String? get languageCode => throw _privateConstructorUsedError;
  @override
  int get settingsUpgradedToBuild => throw _privateConstructorUsedError;
  @override
  String get settingsUpgradedToVersion => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      throw _privateConstructorUsedError;
}
