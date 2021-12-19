// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoLink _$PhotoLinkFromJson(Map<String, dynamic> json) => PhotoLink()
  ..url = json['url'] as String?
  ..width = json['width'] as int?
  ..height = json['height'] as int?
  ..type = json['type'] as String?
  ..cutType = json['cut_type'] as String?;

Map<String, dynamic> _$PhotoLinkToJson(PhotoLink instance) => <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'type': instance.type,
      'cut_type': instance.cutType,
    };
