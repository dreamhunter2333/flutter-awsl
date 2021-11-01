import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
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

class Awsl extends StatefulWidget {
  static const title = 'Awsl';

  const Awsl({Key? key}) : super(key: key);

  @override
  _AwslState createState() => _AwslState();
}

class _AwslState extends State<Awsl> {
  final _androidRefreshKey = GlobalKey<RefreshIndicatorState>();
  late final List<String> _awslData = <String>[];
  late int _awslCount = 0;

  @override
  void initState() {
    _initData();
    super.initState();
  }

  void _initData() {
    _awslData.clear();
    fetchCount();
    fetchData(10, 0);
  }

  convertData(List urlList) {
    for (var url in urlList) {
      _awslData.add(url["pic_info"]["large"]["url"]);
    }
  }

  fetchData(limit, offset) {
    var url = Uri.parse("http://awsl-py.dev.jcstaff.club/list?limit=" +
        limit.toString() +
        "&offset=" +
        offset.toString());
    http
        .get(url, headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        })
        .then((value) => {
              for (var url in json.decode(value.body))
                {_awslData.add(url["pic_info"]["large"]["url"])}
            })
        .whenComplete(() => setState(() => {}));
  }

  fetchCount() {
    http
        .get(Uri.parse("http://awsl-py.dev.jcstaff.club/list_count"))
        .then((value) => _awslCount = int.parse(value.body))
        .whenComplete(() => setState(() => {}));
  }

  Widget _buildListView() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _awslCount,
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _awslData.length - 10 &&
              _awslData.length <= _awslCount) {
            fetchData(10, index);
          }
          if (index >= _awslData.length) return Container();
          return Image.network(_awslData[index]);
        });
  }

  Future<void> _refreshData() {
    return Future.delayed(
      // This is just an arbitrary delay that simulates some network activity.
      const Duration(seconds: 2),
      () => setState(() => _initData()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Awsl.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async =>
                await _androidRefreshKey.currentState!.show(),
          ),
        ],
      ),
      body: RefreshIndicator(
        key: _androidRefreshKey,
        onRefresh: _refreshData,
        child: _buildListView(),
      ),
    );
  }
}
