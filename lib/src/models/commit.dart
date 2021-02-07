import 'tag.dart';

/// Represents a checkpoint in time in a particular branch
/// A Commit should belong to a branch and cannot exist independently.
class Commit {
  /// A [Commit] [id] is a hash value that unqiuely identifies the commit.
  /// Unlike git, this is only used to display additional information along
  /// with the [name]
  final String id;

  /// A name is the message given to idenitfy a commit in a [Branch]
  final String name;

  /// [author] is a metadata to appear in the subtitle below the [name]
  final String author;

  /// A List of [Tag]
  final List<Tag> tags;
  Commit({
    this.id,
    this.name,
    this.author,
    this.tags,
  });
}
