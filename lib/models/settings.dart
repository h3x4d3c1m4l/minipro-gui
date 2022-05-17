// Copyright 2022 Sander in 't Hout.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:miniprogui/models/_enums.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'settings.freezed.dart';

@freezed
class Settings with _$Settings {
  const factory Settings({
    String? languageCode,
    required AppTheme appTheme,
    required int settingsUpgradedToBuild,
    required String settingsUpgradedToVersion,
  }) = _Settings;
  const Settings._();

  factory Settings.withDefaults() => Settings(
        appTheme: AppTheme.byDevice,
        settingsUpgradedToBuild: int.parse(GetIt.I<PackageInfo>().buildNumber),
        settingsUpgradedToVersion: GetIt.I<PackageInfo>().version,
      );
}
