// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo()
  ..wbUrl = json['wb_url'] as String?
  ..picInfo = json['pic_info'] == null
      ? null
      : PhotoInfo.fromJson(json['pic_info'] as Map<String, dynamic>);

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'wb_url': instance.wbUrl,
      'pic_info': instance.picInfo,
    };
