import 'package:awsl/models/producer.dart';
import 'package:awsl/services/network/responses/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_producer_response.g.dart';

@JsonSerializable()
class ListProducerResponse extends BaseResponse{
  ListProducerResponse();

  @JsonKey(name: 'results')
  late List<Producer> producers;

  factory ListProducerResponse.fromJson(Map<String, dynamic> json) => _$ListProducerResponseFromJson(json);
}