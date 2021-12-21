// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_photo_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListPhotoRequest _$ListPhotoRequestFromJson(Map<String, dynamic> json) =>
    ListPhotoRequest()
      ..uid = json['uid'] as String?
      ..offset = json['offset'] as int?
      ..limit = json['limit'] as int?;

Map<String, dynamic> _$ListPhotoRequestToJson(ListPhotoRequest instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'offset': instance.offset,
      'limit': instance.limit,
    };
