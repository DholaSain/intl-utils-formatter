<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# intl_utils_formatter

`intl_utils_formatter` is a Dart package providing a command-line tool that aids
in the formatting and sorting of `.arb` files used in internationalizing Flutter
apps.

It allows you to define a list of `.arb` file paths within your project's
`pubspec.yaml` configuration and formats these files to ensure consistency and
standardization.

## Features

- Sort & format `.arb` files with a single command.
- It'll sort `.arb` files in asc order with metadata keys.
- Easily specify `.arb` file paths in `pubspec.yaml`.
- Integrates smoothly with your existing Flutter localization workflow.

## Installation

Add `intl_utils_formatter` as a development dependency in your Flutter project:

```yaml
dev_dependencies:
  intl_utils_formatter: <latest_version>
```

## Configuration

Configure the paths to your .arb files in your pubspec.yaml under the
intl_utils_formatter key like so:

```yaml
intl_utils_formatter:
  files:
    - path/to/your/first/file.arb
    - path/to/your/second/file.arb
```

#### Example

Here is an example:

```yaml
intl_utils_formatter:
  files:
    - lib/l10n/intl_en.arb
    - lib/l10n/intl_ur.arb
```

## Usage

To format your .arb files, run the following command in the root directory of
your Flutter project:

```shell
dart run intl_utils_formatter:format
```

Make sure that all specified file paths under intl_utils_formatter configuration
are correct. The formatter will process each listed .arb file.

## License

This tool is licensed under the
[MIT License](https://raw.githubusercontent.com/DholaSain/intl-utils-formatter/main/LICENSE).
See the LICENSE file for full license text.
