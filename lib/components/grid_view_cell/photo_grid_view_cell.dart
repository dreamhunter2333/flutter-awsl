import 'package:awsl/models/photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PhotoGridViewCell extends StatelessWidget {
  const PhotoGridViewCell({Key? key, required this.photo}) : super(key: key);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Stack(children: [
              // Container(
              //     alignment: Alignment.center,
              //     child: Image(
              //       image: AssetImage('logo.png'),
              //       width: 30.0,
              //       height: 30.0,
              //     )
              // ),
              (() {
                if (photo.picInfo?.large?.url != null) {
                  return CachedNetworkImage(
                      // width: double.infinity,
                      // height: double.infinity,
                      fit: BoxFit.fitWidth,
                      imageUrl: photo.picInfo!.large!.url!,
                      errorWidget: (context, widget, error) =>
                          const Icon(Icons.error));
                } else {
                  return Container();
                }
              }())
            ]
            )
        )
    );
  }
}
