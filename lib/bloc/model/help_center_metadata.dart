import 'dart:convert';

class HelpCenterMetadata {
  final String code;
  final MetadataCategory category;
  final String stringValue;
  final int intValue;
  final double doubleValue;
  final bool boolValue;

  HelpCenterMetadata(
    this.code,
    this.category,
    this.stringValue,
    this.intValue,
    this.doubleValue,
    this.boolValue,
  );

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'category': category,
      'stringValue': stringValue,
      'intValue': intValue,
      'doubleValue': doubleValue,
      'bool': bool,
    };
  }

  factory HelpCenterMetadata.fromMap(Map<String, dynamic> map) {
    return HelpCenterMetadata(
      map['code'] ?? '',
      map['category'] ?? '',
      map['stringValue'] ?? '',
      map['intValue'] ?? '',
      map['doubleValue'] ?? '',
      map['bool'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HelpCenterMetadata.fromJson(
    String source,
  ) =>
      HelpCenterMetadata.fromMap(
        json.decode(source),
      );
}

enum MetadataCategory {
  title,
  subtitle,
  image,
  listItem,
  paragraph,
}
