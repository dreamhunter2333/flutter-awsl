// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FocusPoint _$FocusPointFromJson(Map<String, dynamic> json) => FocusPoint()
  ..left = (json['left'] as num).toDouble()
  ..top = (json['top'] as num).toDouble()
  ..width = (json['width'] as num).toDouble()
  ..height = (json['height'] as num).toDouble();

Map<String, dynamic> _$FocusPointToJson(FocusPoint instance) =>
    <String, dynamic>{
      'left': instance.left,
      'top': instance.top,
      'width': instance.width,
      'height': instance.height,
    };
