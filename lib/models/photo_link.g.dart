// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoLink _$PhotoLinkFromJson(Map<String, dynamic> json) => PhotoLink()
  ..url = json['url'] as String?
  ..type = json['type'] as String?
  ..cutType = json['cut_type'] as int?
  ..width = PhotoLink._widthOrHeightFromJson(json['width'])
  ..height = PhotoLink._widthOrHeightFromJson(json['height']);

Map<String, dynamic> _$PhotoLinkToJson(PhotoLink instance) => <String, dynamic>{
      'url': instance.url,
      'type': instance.type,
      'cut_type': instance.cutType,
      'width': instance.width,
      'height': instance.height,
    };
