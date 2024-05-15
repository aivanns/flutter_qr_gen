import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class QrCode {
  const QrCode({
    required this.data,
    this.fill,
    this.backColor,
    this.boxSize,
    this.border,
  });

  final String data;
  final String? fill;
  final String? backColor;
  final int? boxSize;
  final int? border;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
      'fill': fill,
      'backColor': backColor,
      'boxSize': boxSize,
      'border': border,
    };
  }

  factory QrCode.fromMap(Map<String, dynamic> map) {
    return QrCode(
      data: map['data'] as String,
      fill: map['fill'] != null ? map['fill'] as String : null,
      backColor: map['backColor'] != null ? map['backColor'] as String : null,
      boxSize: map['boxSize'] != null ? map['boxSize'] as int : null,
      border: map['border'] != null ? map['border'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QrCode.fromJson(String source) => QrCode.fromMap(json.decode(source) as Map<String, dynamic>);
}
