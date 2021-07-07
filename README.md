
## Swift Package Collections

The Apparata's Swift package collection JSON files can be added to Xcode from this repository.

### Generating the Collections

### Install the Generator

Use `mint` to install the generator CLI utility:

```bash
$ mint install apple/swift-package-collection-generator@main
```

### Run the Generator

Run the generator like so in the root of the repository:

```bash
$ package-collection-generate Input/apparata-<variant>.json ./apparata-<variant>.json --auth-token <github personal auth token>
```
