import 'package:flutter/cupertino.dart';

abstract class WidgetStateAnimatable{
  void _buildAnimation();
  void _animation(dynamic state);
}

class BaseWidgetState<T extends StatefulWidget> extends State<T>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}