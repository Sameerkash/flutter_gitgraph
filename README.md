# Flutter_gitgraph

A Flutter library to easily visualize shiny Git Graphs.

![MIT License](https://img.shields.io/badge/License-MIT-yellow.svg)

## Getting started

Add as a dependency

```yaml
dependencies:
  flutter_gitgraph: latest_version
```

Declare a list of commits

```dart
const COMMIT_DATA = [
  {'id': 'cmt_1', 'name': 'h45edf'},
  {'id': 'cmt_2', 'name': 'ed3sdf', 'prev': 'cmt_1'},
  {'id': 'cmt_3', 'name': 'asd32n', 'prev': 'cmt_2'},
  {'id': 'cmt_4', 'name': 'bsh32j', 'prev': 'cmt_3'},
  {'id': 'cmt_5', 'name': 'f3h3dr', 'prev': 'cmt_2'},
  {'id': 'cmt_6', 'name': 'jf3djs', 'prev': 'cmt_3'},
  {'id': 'cmt_7', 'name': 'z45dsw', 'prev': 'cmt_3'},
  {'id': 'cmt_8', 'name': 'djw4ls', 'prev': 'cmt_6'},
  {'id': 'cmt_9', 'name': '3edfk3', 'prev': 'cmt_4'},
  {'id': 'cmt_10', 'name': 'fdhj3fg', 'prev': 'cmt_4'},
  {'id': 'cmt_11', 'name': 'dk32fhj', 'prev': 'cmt_5'},
  {'id': 'cmt_12', 'name': 'dhj45kv', 'prev': 'cmt_1'}
];
```

Add it to a List

```dart
 List<Commit> commits = [];
```

Pass it as a parameter to the widget

```dart
  body: Center(
        child: GitGraph(commits: commits),
      ),
```

## Running the project locally

<!--
Pre-requisites:

-   [Flutter](https://flutter.dev/) -->

Setting things up:

1.  Clone the repository: `git clone git@github.com:Sameerkash/flutter_gitgraph.git`
2.  To view your current channel: `flutter channel`
3.  Change the flutter chanell to beta to test it for web: `flutter channel dev`
4.  Upgrade: `flutter upgrade`

## Contributing

### [Contributing Guide](CONTRIBUTING.md)

Read our [contributing guide](CONTRIBUTING.md) to learn about our development process, how to propose bugfixes and improvements.

### Good First Issues

To help you get your feet wet and get you familiar with our contribution process, we have a list of good first issues that contain bugs/features which have a relatively limited scope. This is a great place to get started.

## Versioning

We use [SemVer](semver) as a guideline for our versioning here.

## Copyright and License

Copyright (c) 2021 Sameer Kashyap under the [MIT license](LICENSE).

Inspired by [GitGraph.js](gitgtaphjs.com)
