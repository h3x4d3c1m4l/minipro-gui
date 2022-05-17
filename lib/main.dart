// Copyright 2022 Sander in 't Hout.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:miniprogui/blocs/settings/settings_bloc.dart';
import 'package:miniprogui/components/system/app_bloc_provider_and_initializer.dart';
import 'package:miniprogui/components/system/app_easy_localization.dart';
import 'package:miniprogui/components/system/temporary_fluent_localization_delegate.dart';
import 'package:miniprogui/models/_all.dart';
import 'package:miniprogui/pages/_all.dart';
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

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, settingsState) {
        return FluentApp(
          title: 'Minipro (TL866 series) GUI',
          home: NavigationView(
            pane: NavigationPane(
              displayMode: PaneDisplayMode.top,
              selected: index,
              onChanged: (i) => setState(() => index = i),
              items: [
                PaneItem(icon: const Icon(FluentIcons.upload), title: Text('programming.title'.tr())),
                PaneItem(icon: const Icon(FluentIcons.check_mark), title: Text('icTesting.title'.tr())),
              ],
              footerItems: [
                PaneItem(icon: const Icon(FluentIcons.settings), title: Text('settings.title'.tr())),
                PaneItem(icon: const Icon(FluentIcons.info), title: Text('about.title'.tr())),
              ],
            ),
            content: NavigationBody(
              index: index,
              children: const [
                ProgrammingPage(),
                IcTestingPage(),
                SettingsPage(),
                AboutPage(),
              ],
            ),
          ),
          theme: _getThemeData(settingsState.settings.appTheme),
          debugShowCheckedModeBanner: false,

          // easy_localization
          localizationsDelegates: [...context.localizationDelegates, const TemporaryFluentLocalizationDelegate()],
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        );
      },
    );
  }

  ThemeData _getThemeData(AppTheme appTheme) {
    switch (appTheme) {
      case AppTheme.byDevice:
        return _systemUsesDarkMode ? ThemeData.dark() : ThemeData.light();
      case AppTheme.light:
        return ThemeData.light();
      case AppTheme.dark:
        return ThemeData.dark();
    }
  }
}
