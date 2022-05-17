// Copyright 2022 Sander in 't Hout.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniprogui/blocs/settings/settings_bloc.dart';
import 'package:miniprogui/components/setting_card.dart';
import 'package:miniprogui/models/_all.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SettingsBloc settingsBloc;

  @override
  void initState() {
    super.initState();
    settingsBloc = BlocProvider.of<SettingsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
      content: BlocSelector<SettingsBloc, SettingsState, Settings>(
        bloc: settingsBloc,
        selector: (state) => state.settings,
        builder: (context, settings) {
          return Column(
            children: [
              Flexible(
                child: ListView(
                  children: [
                    // language
                    SettingCard(
                      icon: FluentIcons.locale_language,
                      title: 'settings.settings.language.title'.tr(),
                      subtitle: 'settings.settings.language.subtitle'.tr(),
                      child: SizedBox(
                        width: 125,
                        child: Combobox<String?>(
                          placeholder: Text('settings.settings.language.options.default'.tr()),
                          isExpanded: true,
                          items: getLanguageOptions(),
                          value: settings.languageCode,
                          onChanged: (languageCode) => applyAndStoreLanguage(languageCode),
                        ),
                      ),
                    ),
    
                    const SizedBox(height: 5),
    
                    // app theme
                    SettingCard(
                      icon: FluentIcons.color,
                      title: 'settings.settings.theme.title'.tr(),
                      subtitle: 'settings.settings.theme.subtitle'.tr(),
                      child: SizedBox(
                        width: 100,
                        child: Combobox<AppTheme>(
                          isExpanded: true,
                          items: getAppThemeOptions(),
                          value: settings.appTheme,
                          onChanged: (appTheme) => applyAndStoreAppTheme(appTheme!),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InfoBar(title: Text('settings.changes_will_be_saved_automatically'.tr())),
            ],
          );
        },
      ),
    );
  }

    static List<ComboboxItem<String?>> getLanguageOptions() {
    return <ComboboxItem<String?>>[
      ComboboxItem<String>(child: Text('settings.settings.language.options.default'.tr())),
      ComboboxItem<String>(value: 'en', child: Text('settings.settings.language.options.english'.tr())),
      ComboboxItem<String>(value: 'nl', child: Text('settings.settings.language.options.dutch'.tr())),
    ].lock.unlockView;
  }

  Future applyAndStoreLanguage(String? languageCode) async {
    // save setting
    settingsBloc.add(SaveSettings(
      settingsBloc.state.settings.copyWith(languageCode: languageCode),
    ));

    // set UI
    if (languageCode != null) {
      // user picked an actual language option
      await context.setLocale(Locale(languageCode));
    } else {
      // user picked 'default' option (meaning: set to device language with fallback)

      // note: we should be able to use context.resetLocale() but
      // it force sets the locale to the first device preferred locale even if not supported
      // by us; this will make Flutter crash :(

      // check if we support any locales the user has set as preferred in their OS
      final Locale? supportedLocale = WidgetsBinding.instance.window.locales.firstWhereOrNull((deviceLocale) =>
          context.supportedLocales.any((supportedLocale) => supportedLocale.languageCode == deviceLocale.languageCode));

      if (supportedLocale != null) {
        await context.setLocale(Locale(supportedLocale.languageCode));
      } else {
        await context.setLocale(context.fallbackLocale!);
      }
    }
  }

  static List<ComboboxItem<AppTheme>> getAppThemeOptions() {
    return <ComboboxItem<AppTheme>>[
      ComboboxItem<AppTheme>(value: AppTheme.byDevice, child: Text('settings.settings.theme.options.default'.tr())),
      ComboboxItem<AppTheme>(value: AppTheme.light, child: Text('settings.settings.theme.options.light'.tr())),
      ComboboxItem<AppTheme>(value: AppTheme.dark, child: Text('settings.settings.theme.options.dark'.tr())),
    ].lock.unlockView;
  }

  void applyAndStoreAppTheme(AppTheme appTheme) {
    settingsBloc.add(SaveSettings(
      settingsBloc.state.settings.copyWith(appTheme: appTheme),
    ));
  }
}
