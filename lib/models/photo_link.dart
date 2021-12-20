import 'package:json_annotation/json_annotation.dart';

part 'photo_link.g.dart';

@JsonSerializable()
class PhotoLink{
  PhotoLink();

  String? url;
  int? width;
  int? height;
  String? type;

  @JsonKey(name: 'cut_type')
  int? cutType;

  factory PhotoLink.fromJson(Map<String, dynamic> json) => _$PhotoLinkFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoLinkToJson(this);
}