// Copyright (c) 2021 ippee
// This source code is under the MIT License.
// See http://opensource.org/licenses/mit-license.php

library dart_clipboard;

/// An exception thrown when called from unsupported platforms.
class PlatformException implements Exception {
  /// Create new instance of [PlatformException].
  PlatformException(String message);
}
