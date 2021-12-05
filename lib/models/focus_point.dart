import 'package:json_annotation/json_annotation.dart';

part 'focus_point.g.dart';

@JsonSerializable()
class FocusPoint{
  FocusPoint();

  late double left;
  late double top;
  late double width;
  late double height;

  factory FocusPoint.fromJson(Map<String, dynamic> json) => _$FocusPointFromJson(json);
  Map<String, dynamic> toJson() => _$FocusPointToJson(this);
}