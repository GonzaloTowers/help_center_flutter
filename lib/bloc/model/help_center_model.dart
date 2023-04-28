import 'dart:convert';

class HelpCenterModel {
  final String title;
  final String content;

  HelpCenterModel(
    this.title,
    this.content,
  );

  HelpCenterModel copyWith({
    String? title,
    String? content,
  }) {
    return HelpCenterModel(
      title ?? this.title,
      content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
    };
  }

  factory HelpCenterModel.fromMap(Map<String, dynamic> map) {
    return HelpCenterModel(
      map['title'] ?? '',
      map['content'] ?? '',
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
    return 'HelpCenterModel(title: $title, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HelpCenterModel &&
        other.title == title &&
        other.content == content;
  }

  @override
  int get hashCode {
    return title.hashCode ^ content.hashCode;
  }
}
