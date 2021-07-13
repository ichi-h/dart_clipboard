// Copyright (c) 2021 ippee
// This source code is under the MIT License.
// See http://opensource.org/licenses/mit-license.php

import 'package:test/test.dart';
import 'package:dart_clipboard/dart_clipboard.dart';

void main() {
  test('set/get clipboard contents', () {
    var clipboard = Clipboard();
    var contents = "All the world's a stage";

    clipboard.setContents(contents);
    var result = clipboard.getContents();

    expect(result, equals(contents));
  });
}
