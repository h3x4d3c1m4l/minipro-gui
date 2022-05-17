// Copyright 2022 Sander in 't Hout.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

enum AppTheme {
  byDevice(0),
  light(1),
  dark(2);

  final int key;
  const AppTheme(this.key);
}
