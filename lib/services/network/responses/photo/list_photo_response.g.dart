// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_photo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListPhotoResponse _$ListPhotoResponseFromJson(Map<String, dynamic> json) =>
    ListPhotoResponse()
      ..photos = (json['results'] as List<dynamic>)
          .map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ListPhotoResponseToJson(ListPhotoResponse instance) =>
    <String, dynamic>{
      'results': instance.photos,
    };
