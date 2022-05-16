// Copyright 2022 Sander in 't Hout.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:miniprogui/components/system/temporary_fluent_localization_delegate.dart';
import 'package:miniprogui/pages/_all.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Minipro (TL866 series) GUI',
      home: NavigationView(
        pane: NavigationPane(
          displayMode: PaneDisplayMode.top,
          selected: index,
          onChanged: (i) => setState(() => index = i),
          items: [
            PaneItem(icon: const Icon(FluentIcons.b_i_dashboard), title: Text('Test 1'.tr())),
            PaneItem(icon: const Icon(FluentIcons.d365_core_h_r), title: Text('Test 2'.tr())),
          ],
          footerItems: [
            PaneItemSeparator(),
            PaneItem(icon: const Icon(FluentIcons.settings), title: Text('settings.title'.tr())),
            PaneItem(icon: const Icon(FluentIcons.info), title: Text('about.title'.tr())),
          ],
        ),
        content: NavigationBody(
          index: index,
          children: const [
            ProgrammingPage(),
            LogicTestingPage(),
            SettingsPage(),
            AboutPage(),
          ],
        ),
      ),

      // easy_localization
      localizationsDelegates: [...context.localizationDelegates, const TemporaryFluentLocalizationDelegate()],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
