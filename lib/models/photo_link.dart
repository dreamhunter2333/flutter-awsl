import 'package:json_annotation/json_annotation.dart';

part 'photo_link.g.dart';

@JsonSerializable()
class PhotoLink{
  PhotoLink();

  late String? url;
  late int? width;
  late int? height;
  @JsonKey(name: 'cut_type')
  late String? cutType;
  late String? type;

  factory PhotoLink.fromJson(Map<String, dynamic> json) => _$PhotoLinkFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoLinkToJson(this);
}