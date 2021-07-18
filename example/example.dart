// Copyright (c) 2021 ippee
// This source code is under the MIT License.
// See http://opensource.org/licenses/mit-license.php

import 'package:dart_clipboard/dart_clipboard.dart';

void main() {
  var contents;

  // Get contents of the clipboard.
  contents = Clipboard.getContents();

  // Set contents to the clipboard.
  contents = "All the world's a stage";
  Clipboard.setContents(contents);
}
