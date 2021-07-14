// Copyright (c) 2021 ippee
// This source code is under the MIT License.
// See http://opensource.org/licenses/mit-license.php

class PlatformException implements Exception {
  /// An exception thrown when called from unsupported platforms.
  PlatformException(String message);
}
