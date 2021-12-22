import 'dart:ffi';

import 'package:awsl/components/base_widget_state.dart';
import 'package:awsl/models/photo.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhotoDetailsScreen extends StatefulWidget {
  PhotoDetailsScreen(this.photo, {Key? key, this.title})
      : super(key: key){

    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    //     statusBarColor: Colors.white, // this one for android
    //     statusBarBrightness: Brightness.light// this one for iOS
    // ));
  }

  final String? title;
  final Photo photo;

  @override
  State<StatefulWidget> createState() => _PhotoDetailsState();
}

class _PhotoDetailsState extends BaseWidgetState<PhotoDetailsScreen> {
  Photo get photo => widget.photo;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Colors.black,
      ),
        child: SafeArea(
      child: Container(
      child: ExtendedImage.network(
          photo.picInfo?.large?.url ?? '',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.contain,
          cache: true,
          mode: ExtendedImageMode.gesture,
          initGestureConfigHandler: (state) {
            return GestureConfig(
              minScale: 0.9,
              animationMinScale: 0.7,
              maxScale: 3.0,
              animationMaxScale: 3.5,
              speed: 1.0,
              inertialSpeed: 100.0,
              initialScale: 1.0,
              inPageView: false,
              initialAlignment: InitialAlignment.center,
            );
          },
        ),
      ),
    ));
  }
}
