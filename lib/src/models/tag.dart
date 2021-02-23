import 'dart:convert';

/// A [Tag] is an optional metadata that can appear on top of a [Commit] [id]
class Tag {
  /// [version] is metadata that should be added to a [Tag].
  final String version;
  Tag({
    this.version,
  });

  Tag copyWith({
    String version,
  }) {
    return Tag(
      version: version ?? this.version,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'version': version,
    };
  }

  factory Tag.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Tag(
      version: map['version'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Tag.fromJson(String source) => Tag.fromMap(json.decode(source));

  @override
  String toString() => 'Tag(version: $version)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Tag && o.version == version;
  }

  @override
  int get hashCode => version.hashCode;
}
