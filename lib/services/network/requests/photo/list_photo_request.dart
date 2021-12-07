import 'package:awsl/services/network/requests/base_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_photo_request.g.dart';

@JsonSerializable()
class ListPhotoRequest extends BaseRequest{
  ListPhotoRequest();

  @override
  @JsonKey(ignore: true)
  String get api => super.api;

  @JsonKey(name: 'uid')
  late String uid;
  @JsonKey(name: 'page')
  late int page;
  @JsonKey(name: 'limit')
  late int limit;

  @override
  Map<String, dynamic> toJson() => _$ListPhotoRequestToJson(this);
}