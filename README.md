# About
Setup Flutter Version Management: A simple CLI to manage Flutter SDK versions.  
https://github.com/leoafarias/fvm

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
        with:
          version: latest

      - name: Install Flutter SDK
        run: fvm use stable

      - name: Print Flutter SDK version
        run: fvm flutter --version
```

# License

Licensed under the [MIT License].
