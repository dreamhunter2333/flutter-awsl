import 'package:json_annotation/json_annotation.dart';

part 'focus_point.g.dart';

@JsonSerializable()
class FocusPoint{
  FocusPoint();

  double? left;
  double? top;
  double? width;
  double? height;

  factory FocusPoint.fromJson(Map<String, dynamic> json) => _$FocusPointFromJson(json);
  Map<String, dynamic> toJson() => _$FocusPointToJson(this);
}