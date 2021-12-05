import 'package:json_annotation/json_annotation.dart';

import 'package:awsl/models/photo_link.dart';

part 'photo_info.g.dart';

@JsonSerializable()
class PhotoInfo{
  PhotoInfo();

  late PhotoLink thumbnail;
  late PhotoLink bmiddle;
  late PhotoInfo large;
  late PhotoLink original;
  late PhotoLink largest;
  late PhotoLink mw2000;

  @JsonKey(name: 'object_id')
  late String objectId;
  @JsonKey(name: 'photo_id')
  late String photoId;
  @JsonKey(name: 'photo_tag')
  late int photoTag;
  late String type;
  @JsonKey(name: 'pic_status')
  late int picStatus;

  factory PhotoInfo.fromJson(Map<String, dynamic> json) => _$PhotoInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoInfoToJson(this);
}