# SwiftComputerScience

Collection of Swift projects for Computer Science concepts and topics.

## Usage

TODO: Change this section with instructions on how to build anything, run binaries, test xctests, and debug binaries and xctests.

* Standalone scripts need to be run with `swift <FileName.swift>`.
* Directories with a `Package.swift` file can be built, run, and/or tested by `cd`ing into the directory and executing `swift build`, `swift run`, and/or `swift test` accordingly.
* Directories with a `BUILD` file or `.xcodeproj` directory are being migrated to SwiftPM and likely don't compile.
* To debug a test:

```
$ lldb .build/debug/<executable name>

(lldb) r
```

```
# Get xctest command to use in the next step.
$ swift test -v

$ lldb /Applications/<Xcode>/Contents/Developer/usr/bin/xctest <path to .xctest>

# Launches xctest, not the test itself.
(lldb) process launch

<breakpoint set-up>

# Launches the test.
(lldb) process launch
```

## Sources

* [Stanford's CS106](https://www.youtube.com/playlist?list=PLFE6E58F856038C69)
* [Stanford CS Education Library](http://cslibrary.stanford.edu/)
* [Khan Academy's Computer Science subject](https://www.khanacademy.org/)
