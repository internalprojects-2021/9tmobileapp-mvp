import 'package:json_annotation/json_annotation.dart';

part 'story_page.g.dart';

@JsonSerializable()
class StoryPage {
  String? type;
  String? cnUrl;
  String? delay;
  String? enUrl;
  String? viUrl;
  String? enText;
  String? userId;
  int? pageNumber;
  int? characterId;
  String? displayMode;
  String? defaultSource;
  String? pageThumbnail;
  String? collaboratorsAudio;
  StoryPage({
    this.type,
    this.cnUrl,
    this.delay,
    this.enUrl,
    this.viUrl,
    this.enText,
    this.userId,
    this.pageNumber,
    this.characterId,
    this.displayMode,
    this.defaultSource,
    this.pageThumbnail,
    this.collaboratorsAudio,
  });

  factory StoryPage.fromJson(Map<String, dynamic> json) =>
      _$StoryPageFromJson(json);
  Map<String, dynamic> toJson() => _$StoryPageToJson(this);
}
