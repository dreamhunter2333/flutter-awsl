// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoInfo _$PhotoInfoFromJson(Map<String, dynamic> json) => PhotoInfo()
  ..thumbnail = json['thumbnail'] == null
      ? null
      : PhotoLink.fromJson(json['thumbnail'] as Map<String, dynamic>)
  ..bmiddle = json['bmiddle'] == null
      ? null
      : PhotoLink.fromJson(json['bmiddle'] as Map<String, dynamic>)
  ..large = json['large'] == null
      ? null
      : PhotoLink.fromJson(json['large'] as Map<String, dynamic>)
  ..original = json['original'] == null
      ? null
      : PhotoLink.fromJson(json['original'] as Map<String, dynamic>)
  ..largest = json['largest'] == null
      ? null
      : PhotoLink.fromJson(json['largest'] as Map<String, dynamic>)
  ..mw2000 = json['mw2000'] == null
      ? null
      : PhotoLink.fromJson(json['mw2000'] as Map<String, dynamic>)
  ..type = json['type'] as String?
  ..objectId = json['object_id'] as String?
  ..photoId = json['photo_id'] as String?
  ..photoTag = json['photo_tag'] as int?
  ..picStatus = json['pic_status'] as int?;

Map<String, dynamic> _$PhotoInfoToJson(PhotoInfo instance) => <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'bmiddle': instance.bmiddle,
      'large': instance.large,
      'original': instance.original,
      'largest': instance.largest,
      'mw2000': instance.mw2000,
      'type': instance.type,
      'object_id': instance.objectId,
      'photo_id': instance.photoId,
      'photo_tag': instance.photoTag,
      'pic_status': instance.picStatus,
    };
