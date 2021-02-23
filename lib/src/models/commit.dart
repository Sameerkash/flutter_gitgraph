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

  /// The [id] of the [Branch] this [Commit] belongs to
  final String parentBranch;

  /// The [id] of the previous [Commit]
  final String prev;

  /// The [id] of the next [Commit]
  final String next;

  /// The poisition at which this [Commit] should appear on the screen.
  Offset position;

  ///
  bool painted;

  /// A List of [Tag]
  final List<Tag> tags;
  Commit({
    this.id,
    this.name,
    this.author,
    this.parentBranch,
    this.prev,
    this.next,
    this.position,
    this.painted = false,
    this.tags,
  });

  Commit copyWith({
    String id,
    String name,
    String author,
    String parentBranch,
    String prev,
    String next,
    Offset position,
    bool painted,
    List<Tag> tags,
  }) {
    return Commit(
      id: id ?? this.id,
      name: name ?? this.name,
      author: author ?? this.author,
      parentBranch: parentBranch ?? this.parentBranch,
      prev: prev ?? this.prev,
      next: next ?? this.next,
      position: position ?? this.position,
      painted: painted ?? this.painted,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'author': author,
      'parentBranch': parentBranch,
      'prev': prev,
      'next': next,
      // 'tags': tags?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Commit.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Commit(
      id: map['id'],
      name: map['name'],
      author: map['author'],
      parentBranch: map['parentBranch'],
      prev: map['prev'],
      next: map['next'],
      // tags: List<Tag>.from(map['tags']?.map((x) => Tag.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Commit.fromJson(String source) => Commit.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Commit(id: $id, name: $name, author: $author, parentBranch: $parentBranch, prev: $prev, next: $next, position: $position, painted: $painted, tags: $tags)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Commit &&
        o.id == id &&
        o.name == name &&
        o.author == author &&
        o.parentBranch == parentBranch &&
        o.prev == prev &&
        o.next == next &&
        o.position == position &&
        o.painted == painted &&
        listEquals(o.tags, tags);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        author.hashCode ^
        parentBranch.hashCode ^
        prev.hashCode ^
        next.hashCode ^
        position.hashCode ^
        painted.hashCode ^
        tags.hashCode;
  }

  // String id, msg, prev;
  // Offset position;
  // bool painted = false;

  // Commit({this.id, this.msg, this.prev});

  // factory Commit.fromJson(Map<String, dynamic> data) {
  //   return Commit(
  //     id: data['id'],
  //     msg: data['msg'],
  //     prev: data['prev'],
  //   );
  // }
}
