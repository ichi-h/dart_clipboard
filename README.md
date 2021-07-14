# dart_clipboard

A Dart package to operate the clipboard using Rust FFI.

In Rust, I create FFI methods by using [aweinstock314 / rust-clipboard](https://github.com/aweinstock314/rust-clipboard) crate and build them as dynamic libraries.

The purpose of this package is not to be a wrapper for it, but to make it easily and intuitively to operate the clipboard in Dart.

This package is like first aid and not a very smart solution. The best way is to do it in Dart alone. If such a package is available, I recommend using it.

## Installation

Add the following to your pubspec.yaml.

```
dependencies:
  dart_clipboard: ^0.1.0
```

or run the following command.

```shell
dart pub get dart_clipboard
```

## Example

```dart
import 'package:dart_clipboard/dart_clipboard.dart';

void main() {
  var clipboard = Clipboard();

  var contents;

  // Get contents of the clipboard.
  contents = clipboard.getContents();

  // Set contents to the clipboard.
  contents = "All the world's a stage";
  clipboard.setContents(contents);
}
```

## License

_dart_clipboard_ is under the MIT License.

Note that [aweinstock314 / rust-clipboard](https://github.com/aweinstock314/rust-clipboard) is dual-licensed under MIT and Apache2.

## References

- [Dart Meets Rust: a match made in heaven ✨ - DEV Community](https://dev.to/sunshine-chain/dart-meets-rust-a-match-made-in-heaven-9f5)
- [How to call a Rust function from Dart using FFI | by Sacha Arbonel | Flutter Community | Medium](https://medium.com/flutter-community/how-to-call-a-rust-function-from-dart-using-ffi-f48f3ea3af2c)
