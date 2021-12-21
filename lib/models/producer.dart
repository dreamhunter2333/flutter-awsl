import 'package:json_annotation/json_annotation.dart';

part 'producer.g.dart';

@JsonSerializable()
class Producer{
  Producer();

  String? uid;
  String? name;

  factory Producer.fromJson(Map<String, dynamic> json) => _$ProducerFromJson(json);
  Map<String, dynamic> toJson() => _$ProducerToJson(this);
}