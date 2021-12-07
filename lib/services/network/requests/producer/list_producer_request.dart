import 'package:awsl/services/network/requests/base_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_producer_request.g.dart';

@JsonSerializable()
class ListProducerRequest extends BaseRequest{
  ListProducerRequest();

  @override
  @JsonKey(ignore:true)
  String get api => super.api;

  @override
  Map<String, dynamic> toJson() => _$ListProducerRequestToJson(this);
}