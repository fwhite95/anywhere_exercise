import 'package:anywhere_exercise/src/model/character_model.dart';
import 'package:flutter/material.dart';

@immutable
class Duck {
  final String abstractSource;
  final String abstractURL;
  final String heading;
  final List<Character> relatedTopics;

  const Duck({
    required this.abstractSource,
    required this.abstractURL,
    required this.heading,
    required this.relatedTopics,
  });

  Duck copyWith({
    String? abstractSource,
    String? abstractURL,
    String? heading,
    List<Character>? relatedTopics,
  }) {
    return Duck(
      abstractSource: abstractSource ?? this.abstractSource,
      abstractURL: abstractURL ?? this.abstractURL,
      heading: heading ?? this.heading,
      relatedTopics: relatedTopics ?? this.relatedTopics,
    );
  }

  Map<String, dynamic> toMap() {
    final res = <String, dynamic>{};

    res.addAll({'AbstractSource': abstractSource});
    res.addAll({'AbstractURL': abstractURL});
    res.addAll({'Heading': heading});
    res.addAll({'RelatedTopics': relatedTopics});

    return res;
  }

  factory Duck.fromMap(Map<String, dynamic> map) {
    List<Character> list = [];
    if (map['RelatedTopics'] != null) {
      map['RelatedTopics'].forEach((v) {
        list.add(Character.fromMap(v));
      });
    }
    return Duck(
      abstractSource: map['AbstractSource'] ?? '',
      abstractURL: map['AbstractURL'] ?? '',
      heading: map['Heading'] ?? '',
      relatedTopics: list,
    );
  }

  @override
  String toString() {
    return 'CharacterModel(AbstractSource: $abstractSource, AbstractURL: $abstractURL, Heading: $heading, RelatedTopics: $relatedTopics)';
  }
}
