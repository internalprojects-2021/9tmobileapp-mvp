import 'package:json_annotation/json_annotation.dart';
import 'package:mobileapp/data/models/story_page.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  int id;
  String? name;
  String? image;
  int? order;

  Character({
    required this.id,
    this.name,
    this.image,
    this.order,
  });

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
