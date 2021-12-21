import 'package:awsl/models/photo.dart';
import 'package:awsl/services/network/responses/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_photo_response.g.dart';

@JsonSerializable()
class ListPhotoResponse extends BaseResponse{
  ListPhotoResponse();

  @JsonKey(name: 'results')
  List<Photo>? photos;

  factory ListPhotoResponse.fromJson(Map<String, dynamic> json) => _$ListPhotoResponseFromJson(json);
}