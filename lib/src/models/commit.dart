import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

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

  ///
  final String parent;

  ///
  Offset position;

  ///
  bool painted = false;

  /// A List of [Tag]
  final List<Tag> tags;
  Commit({
    this.id,
    this.name,
    this.author,
    this.parent,
    this.tags,
  });

  Commit copyWith({
    String id,
    String name,
    String author,
    String parent,
    List<Tag> tags,
  }) {
    return Commit(
      id: id ?? this.id,
      name: name ?? this.name,
      author: author ?? this.author,
      parent: parent ?? this.parent,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'author': author,
      'parent': parent,
      'tags': tags?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Commit.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Commit(
      id: map['id'],
      name: map['name'],
      author: map['author'],
      parent: map['parent'],
      tags: List<Tag>.from(map['tags']?.map((x) => Tag.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Commit.fromJson(String source) => Commit.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Commit(id: $id, name: $name, author: $author, parent: $parent, tags: $tags)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Commit &&
        o.id == id &&
        o.name == name &&
        o.author == author &&
        o.parent == parent &&
        listEquals(o.tags, tags);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        author.hashCode ^
        parent.hashCode ^
        tags.hashCode;
  }
}
