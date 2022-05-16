// Copyright 2022 Sander in 't Hout.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get_it/get_it.dart';
import 'package:miniprogui/app.dart';
import 'package:miniprogui/components/system/app_bloc_provider_and_initializer.dart';
import 'package:miniprogui/components/system/app_easy_localization.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:system_theme/system_theme.dart';

final bool _systemUsesDarkMode = SystemTheme.isDarkMode;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  GetIt.I.registerSingleton(await PackageInfo.fromPlatform());
  //GetIt.I.registerSingleton(await DeviceInfoPlugin().deviceInfo);

  runApp(
    FluentTheme(
      data: _systemUsesDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: const AppBlocProviderAndInitializer(
        child: AppEasyLocalization(
          child: App(),
        ),
      ),
    ),
  );
}
