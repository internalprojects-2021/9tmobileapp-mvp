// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Story _$StoryFromJson(Map<String, dynamic> json) {
  return Story(
    id: json['id'] as String,
    order: json['order'] as int?,
    pages: (json['pages'] as List<dynamic>?)
        ?.map((e) => StoryPage.fromJson(e as Map<String, dynamic>))
        .toList(),
    title: json['title'] as String?,
    status: json['status'] as String?,
    background: json['background'] as String?,
    characters: (json['characters'] as List<dynamic>?)
        ?.map((e) => Character.fromJson(e as Map<String, dynamic>))
        .toList(),
    isFeatured: json['isFeatured'] as bool?,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$StoryToJson(Story instance) => <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'pages': _storyListToJson(instance.pages),
      'title': instance.title,
      'status': instance.status,
      'background': instance.background,
      'characters': _characterListToJson(instance.characters),
      'isFeatured': instance.isFeatured,
      'description': instance.description,
    };
