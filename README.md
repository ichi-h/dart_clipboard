# dart_clipboard

A Dart package to operate the clipboard using Rust FFI.

_dart_clipboard_ uses the dynamic library of [ippee / libclipboard](https://github.com/ippee/libclipboard) crate and requires you to download or build it.  
This crate uses [aweinstock314 / rust-clipboard](https://github.com/aweinstock314/rust-clipboard), but the purpose of this package is not to be a wrapper for it. That is to make it easily and intuitively to operate the clipboard in Dart.

## Installation

### 1. Add package

```shell
dart pub add dart_clipboard
```

### 2. Prepare dynamic library

#### A: Use the existing build files

On your Dart project directory, run the following commands.

```shell
# on Windows
curl -LJO https://github.com/ippee/libclipboard/releases/download/0.1.0/libclipboard.dll

# on macOS
curl -LJO https://github.com/ippee/libclipboard/releases/download/0.1.0/libclipboard.dylib

# on Linux
curl -LJO https://github.com/ippee/libclipboard/releases/download/0.1.0/libclipboard.so
```

#### B: Use your own built files

This way is available in the environment which can use Rust.

First, add [ippee / libclipboard](https://github.com/ippee/libclipboard) repository as a submodule.

```shell
git submodule add git@github.com:ippee/libclipboard.git ./tool/libclipboard/
```

Next, build the dynamic library with:

```shell
cd ./tool/libclipboard/
cargo build --release
```

Finally, make the symbolic link to the built file,

```shell
# on Windows
./make_symlink.ps1

# on macOS/Linux
bash ./make_symlink.sh
```

or copy it to the Dart project directory.

```shell
# on Windows
./copy_lib.ps1

# on macOS/Linux
bash ./copy_lib.sh
```

### Notes

If you publish the Dart application which uses this package, put the dynamic library in the same directory with the executable.

## Example

```dart
import 'package:dart_clipboard/dart_clipboard.dart';

void main() {
  var contents;

  // Get contents of the clipboard.
  contents = Clipboard.getContents();

  // Set contents to the clipboard.
  contents = "All the world's a stage";
  Clipboard.setContents(contents);
}

```

## License

_dart_clipboard_ is under the MIT License.

Note that [aweinstock314 / rust-clipboard](https://github.com/aweinstock314/rust-clipboard) is dual-licensed under MIT and Apache2.

## References

- [Dart Meets Rust: a match made in heaven ✨ - DEV Community](https://dev.to/sunshine-chain/dart-meets-rust-a-match-made-in-heaven-9f5)
- [How to call a Rust function from Dart using FFI | by Sacha Arbonel | Flutter Community | Medium](https://medium.com/flutter-community/how-to-call-a-rust-function-from-dart-using-ffi-f48f3ea3af2c)
