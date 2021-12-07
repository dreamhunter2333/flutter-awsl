import 'package:awsl/services/network/responses/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_producer_photo_count_response.g.dart';

@JsonSerializable()
class GetProducerPhotoCountResponse extends BaseResponse{
  GetProducerPhotoCountResponse();

  @JsonKey(name: 'results')
  late int count;

  factory GetProducerPhotoCountResponse.fromJson(Map<String, dynamic> json) => _$GetProducerPhotoCountResponseFromJson(json);
}