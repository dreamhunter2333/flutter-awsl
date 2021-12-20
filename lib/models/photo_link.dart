import 'package:json_annotation/json_annotation.dart';

part 'photo_link.g.dart';

@JsonSerializable()
class PhotoLink{
  PhotoLink();

  String? url;
  String? type;

  @JsonKey(name: 'cut_type')
  int? cutType;
  @JsonKey(fromJson: _widthOrHeightFromJson)
  int? width;
  @JsonKey(fromJson: _widthOrHeightFromJson)
  int? height;

  static int? _widthOrHeightFromJson(dynamic width){
    
    if(width is String){
      return int.parse(width);
    }

    if(width is int){
      return width;
    }

    return null;
  }

  factory PhotoLink.fromJson(Map<String, dynamic> json) => _$PhotoLinkFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoLinkToJson(this);
}