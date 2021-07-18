// Copyright (c) 2021 ippee
// This source code is under the MIT License.
// See http://opensource.org/licenses/mit-license.php

library dart_clipboard;

import 'dart:io';
import 'dart:ffi';
import 'package:ffi/ffi.dart';

import 'platform_exception.dart';

/// Type of set_contents method on Rust side.
typedef RustSetContents = Void Function(Pointer<Utf8>);

/// Type of get_contents method on Rust side.
typedef RustGetContents = Pointer<Utf8> Function();

/// Type of set_contents method on Dart side.
typedef DartSetContents = void Function(Pointer<Utf8>);

/// Type of get_contents method on Dart side.
typedef DartGetContents = Pointer<Utf8> Function();

/// Class for operating the clipboard.
///
/// ## How to use
///
/// ### getContents
///
/// Get contents of the clipboard.
///
/// ```dart
/// var contents = Clipboard.getContents();
/// ```
///
/// ### setContents
///
/// Set contents to the clipboard.
///
/// ```dart
/// var contents = "All the world's a stage";
/// Clipboard.setContents(contents);
/// ```
class Clipboard {
  /// Get clipboard contents as [String].
  static String getContents() {
    var dl = _loadLib();

    DartGetContents get_contents;
    get_contents =
        dl.lookup<NativeFunction<RustGetContents>>('get_contents').asFunction();

    return get_contents().toDartString();
  }

  /// Set contents received to the clipboard.
  ///
  /// The type of the argument is [String].
  static void setContents(String contents) {
    var dl = _loadLib();

    DartSetContents set_contents;
    set_contents =
        dl.lookup<NativeFunction<RustSetContents>>('set_contents').asFunction();

    var ptr = contents.toNativeUtf8();
    set_contents(ptr);
  }

  /// Load the dynamic library according to the platform.
  ///
  /// Returns a [DynamicLibrary] instance.
  ///
  /// If you call [_loadLib] from an unsupported platform, it throws
  /// PlatformException.
  static DynamicLibrary _loadLib() {
    var libPath = '${Directory.current.path}/';

    if (Platform.isWindows) {
      libPath += 'libclipboard.dll';
    } else if (Platform.isMacOS) {
      libPath += 'libclipboard.dylib';
    } else if (Platform.isLinux) {
      libPath += 'libclipboard.so';
    } else {
      throw PlatformException('${Platform.operatingSystem} is not supported.');
    }

    return DynamicLibrary.open(libPath);
  }
}
