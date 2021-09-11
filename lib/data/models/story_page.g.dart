// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryPage _$StoryPageFromJson(Map<String, dynamic> json) {
  return StoryPage(
    type: json['type'] as String?,
    cnUrl: json['cnUrl'] as String?,
    delay: json['delay'] as String?,
    enUrl: json['enUrl'] as String?,
    viUrl: json['viUrl'] as String?,
    enText: json['enText'] as String?,
    userId: json['userId'] as String?,
    pageNumber: json['pageNumber'] as int?,
    characterId: json['characterId'] as int?,
    displayMode: json['displayMode'] as String?,
    defaultSource: json['defaultSource'] as String?,
    pageThumbnail: json['pageThumbnail'] as String?,
    collaboratorsAudio: json['collaboratorsAudio'] as String?,
  );
}

Map<String, dynamic> _$StoryPageToJson(StoryPage instance) => <String, dynamic>{
      'type': instance.type,
      'cnUrl': instance.cnUrl,
      'delay': instance.delay,
      'enUrl': instance.enUrl,
      'viUrl': instance.viUrl,
      'enText': instance.enText,
      'userId': instance.userId,
      'pageNumber': instance.pageNumber,
      'characterId': instance.characterId,
      'displayMode': instance.displayMode,
      'defaultSource': instance.defaultSource,
      'pageThumbnail': instance.pageThumbnail,
      'collaboratorsAudio': instance.collaboratorsAudio,
    };
