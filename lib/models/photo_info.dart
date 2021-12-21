import 'package:json_annotation/json_annotation.dart';

import 'package:awsl/models/photo_link.dart';

part 'photo_info.g.dart';

@JsonSerializable()
class PhotoInfo{
  PhotoInfo();

  PhotoLink? thumbnail;
  PhotoLink? bmiddle;
  PhotoLink? large;
  PhotoLink? original;
  PhotoLink? largest;
  PhotoLink? mw2000;
  String? type;

  @JsonKey(name: 'object_id')
  String? objectId;

  @JsonKey(name: 'photo_id')
  String? photoId;

  @JsonKey(name: 'photo_tag')
  int? photoTag;

  @JsonKey(name: 'pic_status')
  int? picStatus;

  factory PhotoInfo.fromJson(Map<String, dynamic> json) => _$PhotoInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoInfoToJson(this);
}