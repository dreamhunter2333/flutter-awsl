import 'package:awsl/services/network/requests/base_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_producer_photo_count_request.g.dart';

@JsonSerializable()
class GetProducerPhotoCountRequest extends BaseRequest{
  GetProducerPhotoCountRequest();

  @override
  @JsonKey(ignore: true)
  String get api => super.api;

  @JsonKey(name: 'uid')
  late String uid;

  @override
  Map<String, dynamic> toJson() => _$GetProducerPhotoCountRequestToJson(this);
}