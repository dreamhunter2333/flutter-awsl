// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_photo_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListPhotoRequest _$ListPhotoRequestFromJson(Map<String, dynamic> json) =>
    ListPhotoRequest()
      ..uid = json['uid'] as String?
      ..page = json['page'] as int?
      ..limit = json['limit'] as int?;

Map<String, dynamic> _$ListPhotoRequestToJson(ListPhotoRequest instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'page': instance.page,
      'limit': instance.limit,
    };
