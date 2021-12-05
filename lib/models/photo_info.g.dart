// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoInfo _$PhotoInfoFromJson(Map<String, dynamic> json) => PhotoInfo()
  ..thumbnail = PhotoLink.fromJson(json['thumbnail'] as Map<String, dynamic>)
  ..bmiddle = PhotoLink.fromJson(json['bmiddle'] as Map<String, dynamic>)
  ..large = PhotoInfo.fromJson(json['large'] as Map<String, dynamic>)
  ..original = PhotoLink.fromJson(json['original'] as Map<String, dynamic>)
  ..largest = PhotoLink.fromJson(json['largest'] as Map<String, dynamic>)
  ..mw2000 = PhotoLink.fromJson(json['mw2000'] as Map<String, dynamic>)
  ..objectId = json['object_id'] as String
  ..photoId = json['photo_id'] as String
  ..photoTag = json['photo_tag'] as int
  ..type = json['type'] as String
  ..picStatus = json['pic_status'] as int;

Map<String, dynamic> _$PhotoInfoToJson(PhotoInfo instance) => <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'bmiddle': instance.bmiddle,
      'large': instance.large,
      'original': instance.original,
      'largest': instance.largest,
      'mw2000': instance.mw2000,
      'object_id': instance.objectId,
      'photo_id': instance.photoId,
      'photo_tag': instance.photoTag,
      'type': instance.type,
      'pic_status': instance.picStatus,
    };
