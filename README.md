
## Swift Package Collections

The Apparata's Swift package collection JSON files can be added to Xcode from this repository.

### Adding the Collections to Xcode

Each JSON file in the root of the repository is a package collection specification. You can add them to Xcode using raw file github URLs, e.g. for the UI collection:

```
https://raw.githubusercontent.com/apparata/swift-package-collections/main/apparata-ui.json
```

### Generating the Collections

### Install the Generator

Use `mint` to install the generator CLI utility:

```bash
$ mint install apple/swift-package-collection-generator@main
```

### Run the Generator

Run the generator like so in the root of the repository:

```bash
$ package-collection-generate Input/apparata-<variant>.json Unsigned/apparata-<variant>.json --auth-token <github personal auth token>
```

### Sign

Temporarily copy `key.pem` and `swift_package.cer` from safe-keeping to this directory and run:

```bash
$ package-collection-sign Unsigned/apparata-<variant>.json apparata-<variant>.json key.pem swift_package.cer
```
