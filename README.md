# SwiftComputerScience

Collection of Swift projects for Computer Science concepts and topics.

### Usage

Standalone scripts need to be run with `swift <FileName.swift>`.

Apps or tests require [Bazel](https://bazel.build/), as well as knowledge about it's [targets, labels, and BUILD files](https://docs.bazel.build/versions/master/build-ref.html).

Note: All `App` and `Tests` targets are macOS only because of [bazelbuild/rules_swift/issues/51](https://github.com/bazelbuild/rules_swift/issues/51#issuecomment-413661604), if that ever gets fixed, switching to `swift_binary` and `swift_test` will be possible.

### Sources

* [Stanford's CS106](https://www.youtube.com/playlist?list=PLFE6E58F856038C69)
* [Stanford CS Education Library](http://cslibrary.stanford.edu/)
* [Khan Academy's Computer Science subject](https://www.khanacademy.org/)
