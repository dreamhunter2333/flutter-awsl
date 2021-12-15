import 'package:json_annotation/json_annotation.dart';

part 'producer.g.dart';

@JsonSerializable()
class Producer{
  Producer();

  late String? uid;
  late String? name;

  factory Producer.fromJson(Map<String, dynamic> json) => _$ProducerFromJson(json);
  Map<String, dynamic> toJson() => _$ProducerToJson(this);
}