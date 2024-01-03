import 'package:anywhere_exercise/src/helper.dart';
import 'package:anywhere_exercise/src/model/icon_model.dart';
import 'package:flutter/material.dart';

@immutable
class Character {
  final String firstURL;
  final IconModel icon;
  final String result;
  final String text;
  final String name;

  const Character({
    required this.firstURL,
    required this.icon,
    required this.result,
    required this.text,
    required this.name,
  });

  Character copyWith({
    String? firstURL,
    IconModel? icon,
    String? result,
    String? text,
    String? name,
  }) {
    return Character(
      firstURL: firstURL ?? this.firstURL,
      icon: icon ?? this.icon,
      result: result ?? this.result,
      text: text ?? this.text,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final res = <String, dynamic>{};

    res.addAll({'FirstURL': firstURL});
    res.addAll({'Icon': icon});
    res.addAll({'Result': result});
    res.addAll({'Text': text});
    res.addAll({'Name': name});

    return res;
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      firstURL: map['FirstURL'] ?? '',
      icon: IconModel.fromMap(map['Icon']),
      result: map['Result'] ?? '',
      text: map['Text'] ?? '',
      name: Helper.getName(map['Text'] ?? ''),
    );
  }

  @override
  String toString() {
    return 'CharacterModel(firstURL: $firstURL, icon: $icon, result: $result, text: $text, name: $name)';
  }
}
