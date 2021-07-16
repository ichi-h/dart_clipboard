# dart_clipboard

A Dart package to operate the clipboard using Rust FFI.

In Rust, I create FFI methods by using [aweinstock314 / rust-clipboard](https://github.com/aweinstock314/rust-clipboard) crate and build them as dynamic libraries.

The purpose of this package is not to be a wrapper for it, but to make it easily and intuitively to operate the clipboard in Dart.

This package is like first aid and not a very smart solution. The best way is to do it from the low layer in Dart. If such a package is available, I recommend using it.

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
However, if you update this package, you will have to go through this process again.

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

### Pattern B: Use your own build files

This pattern takes a lot of work for installation, but you can update this package easily.  
Also, please install Rust beforehand.

First, add [ippee / libclipboard](https://github.com/ippee/libclipboard) repository as a submodule.

```shell
git submodule add git@github.com:ippee/libclipboard.git ./tool/libclipboard/
```

Next, build the dynamic library with:

```shell
cd ./tool/libclipboard/
cargo build
```

Finally, make the symbolic link to the built file,

```shell
# on Windows
cd ../../
New-Item -Type SymbolicLink ./libclipboard.dll -Value .\tool\libclipboard\target\debug\libclipboard.dll

# on macOS/Linux
bash ./make_symlink.sh
```

or copy the library to the Dart project directory.

```shell
# on Windows
cp ./target/debug/libclipboard.dll ../../

# on macOS/Linux
bash ./copy_lib.sh
```

If you publish the Dart application which uses [ippee / dart_clipboard](https://github.com/ippee/dart_clipboard), put the dynamic library in the same directory with the executable.

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
