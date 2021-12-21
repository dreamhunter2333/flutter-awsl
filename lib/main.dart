import 'package:awsl/models/photo.dart';
import 'package:awsl/screens/photo_list/photo_details_screen.dart';
import 'package:awsl/screens/photo_list/photo_list_screen.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Awsl',
      initialRoute: '/',
      routes: {
        '/': (context) => const PhotoListScreen(),
        '/details': (context) => PhotoDetailsScreen(ModalRoute.of(context)?.settings.arguments as Photo)
      },
    );
  }
}
