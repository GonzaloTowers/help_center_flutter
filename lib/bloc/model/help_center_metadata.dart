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
      enumFromString(map['category']),
      map['stringValue'] ?? '',
      int.parse(map['intValue'] ?? 0),
      double.parse(map['doubleValue'] ?? 0.0),
      bool.fromEnvironment(map['bool'] ?? ''),
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

MetadataCategory enumFromString(String value) {
  MetadataCategory category = MetadataCategory.title;
  switch (value) {
    case 'title':
      category = MetadataCategory.title;
      break;
    case 'subtitle':
      category = MetadataCategory.subtitle;
      break;
    case 'image':
      category = MetadataCategory.image;
      break;
    case 'listItem':
      category = MetadataCategory.listItem;
      break;
    case 'paragraph':
      category = MetadataCategory.paragraph;
      break;
  }
  return category;
}
