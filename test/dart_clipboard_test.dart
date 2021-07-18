// Copyright (c) 2021 ippee
// This source code is under the MIT License.
// See http://opensource.org/licenses/mit-license.php

import 'package:test/test.dart';
import 'package:dart_clipboard/dart_clipboard.dart';

void main() {
  test('set/get clipboard contents', () {
    var contents = "All the world's a stage";
    Clipboard.setContents(contents);
    var result = Clipboard.getContents();

    expect(result, equals(contents));
  });
}
