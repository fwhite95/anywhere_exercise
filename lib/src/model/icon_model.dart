import 'package:flutter/material.dart';

@immutable
class IconModel {
  final String height;
  final String url;
  final String width;

  const IconModel({
    required this.height,
    required this.url,
    required this.width,
  });

  IconModel copyWith({
    String? height,
    String? url,
    String? width,
  }) {
    return IconModel(
      height: height ?? this.height,
      url: url ?? this.url,
      width: width ?? this.width,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'Height': height});
    result.addAll({'URL': url});
    result.addAll({'Width': width});

    return result;
  }

  factory IconModel.fromMap(Map<String, dynamic> map) {
    return IconModel(
      height: map['Height'] ?? '',
      url: map['URL'] ?? '',
      width: map['Width'] ?? '',
    );
  }

  @override
  String toString() {
    return 'IconModel(Height: $height, URL: $url, Width: $width)';
  }
}
