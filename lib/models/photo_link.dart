import 'package:json_annotation/json_annotation.dart';

part 'photo_link.g.dart';

@JsonSerializable()
class PhotoLink{
  PhotoLink();

  late String? url;
  late int? width;
  late int? height;
  late String? type;

  @JsonKey(name: 'cut_type')
  late String? cutType;

  factory PhotoLink.fromJson(Map<String, dynamic> json) => _$PhotoLinkFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoLinkToJson(this);
}