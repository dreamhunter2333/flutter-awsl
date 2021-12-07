// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_producer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListProducerResponse _$ListProducerResponseFromJson(
        Map<String, dynamic> json) =>
    ListProducerResponse()
      ..producers = (json['results'] as List<dynamic>)
          .map((e) => Producer.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ListProducerResponseToJson(
        ListProducerResponse instance) =>
    <String, dynamic>{
      'results': instance.producers,
    };
