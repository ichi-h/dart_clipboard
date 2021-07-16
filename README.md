# dart_clipboard

A Dart package to operate the clipboard using Rust FFI.

_dart_clipboard_ uses the dynamic library of the [ippee / libclipboard](https://github.com/ippee/libclipboard) crate and requires you to download or build it.  
This crate uses [aweinstock314 / rust-clipboard](https://github.com/aweinstock314/rust-clipboard), but its purpose is not to be wrapper for it. That is to make it easily and intuitively to operate the clipboard in Dart.

This package is like first aid and not a very smart solution. The best way is to do it using low-level APIs in Dart. If such a package is available, I recommend using it.

## Installation

### 1. Add package

Add the following to your pubspec.yaml,

```
dependencies:
  dart_clipboard:
    git: git://github.com/ippee/dart_clipboard.git
```

and run:

```shell
dart pub get
```

### 2. Prepare dynamic library

#### Pattern A: Use the existing build files

This is an easy way to use this package.  
However, if you update this library, you will have to go through this process again.

On your Dart project directory, run the following commands.

```shell
# on Windows
curl -sLJO https://github.com/ippee/libclipboard/releases/download/0.1.0/libclipboard.dll

# on macOS
curl -sLJO https://github.com/ippee/libclipboard/releases/download/0.1.0/libclipboard.dylib

# on Linux
curl -sLJO https://github.com/ippee/libclipboard/releases/download/0.1.0/libclipboard.so
```

When you update the library, change the version number to a newer and run the above command.

#### Pattern B: Use your own built files

This pattern uses Rust, but you can update this easily.  

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

or copy the library to the Dart project directory.

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
