import 'package:flutter/material.dart';

import 'awsl/awsl.dart';

void main() {
  runApp(const MyApp());
}

class Pair<T1, T2> {
  final T1 t1;
  final T2 t2;

  Pair(this.t1, this.t2);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awsl',
      darkTheme: ThemeData.dark(),
      home: const Awsl(),
    );
  }
}
