import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:mobileapp/data/models/character.dart';
import 'package:mobileapp/data/models/story_page.dart';

part 'story.g.dart';

@JsonSerializable(explicitToJson: true)
class Story {
  String id;
  int? order;
  @JsonKey(toJson: _storyListToJson)
  List<StoryPage>? pages;
  String? title;
  String? status;
  String? background;
  @JsonKey(toJson: _characterListToJson)
  List<Character>? characters;
  bool? isFeatured;
  String? description;

  Story(
      {required this.id,
      this.order,
      this.pages,
      this.title,
      this.status,
      this.background,
      this.characters,
      this.isFeatured,
      this.description});

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
  Map<String, dynamic> toJson() => _$StoryToJson(this);
}

List<Map<String, dynamic>> _storyListToJson(List<StoryPage>? items) {
  return items?.map((e) => e.toJson()).toList() ?? [];
}

List<Map<String, dynamic>> _characterListToJson(List<Character>? items) {
  return items?.map((e) => e.toJson()).toList() ?? [];
}
