// Copyright (c) 2021 ippee
// This source code is under the MIT License.
// See http://opensource.org/licenses/mit-license.php

import 'package:dart_clipboard/dart_clipboard.dart';

void main() {
  var clipboard = Clipboard();

  // Get contents of the clipboard.
  var result = clipboard.getContents();

  // Set contents to the clipboard.
  var contents = "All the world's a stage";
  clipboard.setContents(contents);
}
