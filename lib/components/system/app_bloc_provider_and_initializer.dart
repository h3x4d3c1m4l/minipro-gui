// Copyright 2022 Sander in 't Hout.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniprogui/blocs/settings/settings_bloc.dart';

class AppBlocProviderAndInitializer extends StatelessWidget {
  final Widget child;

  const AppBlocProviderAndInitializer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // first initialize Settings and Database
        BlocProvider<SettingsBloc>(
          create: (context) {
            final bloc = SettingsBloc();
            bloc.add(LoadSettingsFromStorageEvent());
            return bloc;
          },
        ),
      ],
      child: child,
    );
  }
}
