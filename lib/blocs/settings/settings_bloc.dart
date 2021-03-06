// Copyright 2022 Sander in 't Hout.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:miniprogui/models/_enums.dart';
import 'package:miniprogui/models/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_bloc.freezed.dart';
part 'settings_event.dart';
part 'settings_state.dart';

/// BLoC that uses shared_preferences to load and save settings (e.g. language).
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState.withDefaultSettings()) {
    on<LoadSettingsFromStorageEvent>(_onLoadSettingsFromStorage);
    on<SaveSettings>(_onSaveSettingsEvent, transformer: sequential());
    on<WriteSettingsToStorage>(_onWriteSettingsToStorageEvent, transformer: sequential());
  }

  FutureOr<void> _onLoadSettingsFromStorage(LoadSettingsFromStorageEvent event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(
      isInitialized: true,
      settings: await _readSettings(),
    ));
  }

  FutureOr<void> _onSaveSettingsEvent(SaveSettings event, Emitter<SettingsState> emit) {
    emit(state.copyWith(settings: event.settings));
    add(WriteSettingsToStorage(event.settings));
  }

  FutureOr<void> _onWriteSettingsToStorageEvent(WriteSettingsToStorage event, Emitter<SettingsState> emit) async {
    await _writeSettings(event.settings);
  }

  static Future<Settings> _readSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final defaultSettings = Settings.withDefaults();

    return Settings(
      languageCode: prefs.getString('languageCode') ?? defaultSettings.languageCode,
      appTheme: AppTheme.values.firstWhereOrNull((v) => v.key == prefs.getInt('appTheme')) ??
          defaultSettings.appTheme,
      settingsUpgradedToBuild: prefs.getInt('settingsUpgradedToBuild') ?? defaultSettings.settingsUpgradedToBuild,
      settingsUpgradedToVersion:
          prefs.getString('settingsUpgradedToVersion') ?? defaultSettings.settingsUpgradedToVersion,
    );
  }

  static Future<void> _writeSettings(Settings settings) async {
    final prefs = await SharedPreferences.getInstance();

    if (settings.languageCode != null) {
      await prefs.setString('languageCode', settings.languageCode!);
    } else {
      await prefs.remove('languageCode');
    }
    await prefs.setInt('appTheme', settings.appTheme.key);
    await prefs.setInt('firstStartBuild', settings.settingsUpgradedToBuild);
    await prefs.setString('firstStartVersion', settings.settingsUpgradedToVersion);
  }
}
