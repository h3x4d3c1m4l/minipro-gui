// Copyright 2022 Sander in 't Hout.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_ui/fluent_ui.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
      content: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity, // expand horizontally
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('about.title'.tr()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
