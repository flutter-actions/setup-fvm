[GitHub Action]: https://github.com/flutter-actions/setup-fvm
[MIT License]: https://github.com/flutter-actions/setup-fvm/blob/main/LICENSE

# About

> [!WARNING]
> Currently, the action only supports Linux and macOS runners.

This [GitHub Action] installs and sets up of a [Flutter Version Management](https://github.com/leoafarias/fvm) by [@leoafarias](https://github.com/leoafarias). An alternative to the [flutter-actions/setup-flutter](https://github.com/flutter-actions/setup-flutter) action.

## Inputs

The action takes the following inputs:
  * `version`: The version of FVM to install. Default: `latest`.

## Usage

Install the latest FVM:

```yml
name: Flutter

on:
  push:

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - name: Setup Flutter Version Management CLI
        uses: flutter-actions/setup-fvm@v1

      - name: Install Flutter SDK
        run: echo yes | fvm use stable

      - name: Print Flutter SDK version
        run: fvm flutter --version
```

> [!IMPORTANT]
> Do not use both `flutter-actions/setup-flutter` and `flutter-actions/setup-fvm` in the same workflow. It provides the same functionality, so just pick one.

# License

Licensed under the [MIT License].
