import 'dart:convert';

import 'help_center_metadata.dart';

class HelpCenterModel {
  final String title;
  final String content;
  final List<HelpCenterMetadata> metadata;

  HelpCenterModel(
    this.title,
    this.content,
    this.metadata,
  );

  HelpCenterModel copyWith({
    String? title,
    String? content,
    List<HelpCenterMetadata>? metadata,
  }) {
    return HelpCenterModel(
      title ?? this.title,
      content ?? this.content,
      metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'metadata': metadata,
    };
  }

  factory HelpCenterModel.fromMap(Map<String, dynamic> map) {
    return HelpCenterModel(
      map['title'] ?? '',
      map['content'] ?? '',
      (map['metadata'] as List)
          .map(
            (e) => HelpCenterMetadata.fromMap(e),
          )
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory HelpCenterModel.fromJson(
    String source,
  ) =>
      HelpCenterModel.fromMap(
        json.decode(source),
      );

  @override
  String toString() {
    return 'HelpCenterModel(title: $title, content: $content, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HelpCenterModel &&
        other.title == title &&
        other.content == content &&
        other.metadata == metadata;
  }

  @override
  int get hashCode {
    return title.hashCode ^ content.hashCode ^ metadata.hashCode;
  }
}
