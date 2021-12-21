import 'package:awsl/services/network/requests/base_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_photo_request.g.dart';

@JsonSerializable()
class ListPhotoRequest extends BaseRequest{
  ListPhotoRequest();

  @override
  @JsonKey(ignore: true)
  String get api => 'list';

  @JsonKey(name: 'uid')
  String? uid;
  @JsonKey(name: 'offset')
  int? offset;
  @JsonKey(name: 'limit')
  int? limit;

  @override
  Map<String, dynamic> toJson() => _$ListPhotoRequestToJson(this);
}