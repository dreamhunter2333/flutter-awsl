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

  final _data = <String>[];
  int _count = 0;

  final countPerPage = 10;
  var _isFetching = false;

  @override
  void initState() {
    _initData();
    super.initState();
  }

  void _initData() async {
    _isFetching = true;
    _data.clear();
    final countFuture = fetchCount().then((value) => _count = value);
    final dataFuture = fetchData(countPerPage, 0).then((value) => _data.addAll(value));
    final futures = [countFuture, dataFuture];
    await Future.wait(futures);
    setState(() { });
    _isFetching = false;
  }

  Future fetchNextPage() async {
    if (_isFetching) return;
    _isFetching = true;
    final offset = _data.length;
    final result = await fetchData(countPerPage, offset);
    _data.addAll(result);
    setState(() {});
    _isFetching = false;
  }

  Future<List<String>> fetchData(limit, offset) async {
    final url = "http://awsl-py.dev.jcstaff.club/list?limit=$limit&offset=$offset";
    final response = await http.get(Uri.parse(url), headers: {'Content-Type': 'application/json; charset=UTF-8'});
    final urlList = json.decode(response.body);
    final result = <String>[];
    for (final url in urlList) {
      result.add(url["pic_info"]["large"]["url"]);
    }
    return result;
  }

  Future<int> fetchCount() async {
    final response = await http.get(Uri.parse("http://awsl-py.dev.jcstaff.club/list_count"));
    return int.parse(response.body);
  }

  Widget _buildListView() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _count,
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _data.length - countPerPage && _data.length <= _count) {
            fetchNextPage();
          }
          if (index >= _data.length) return Container();
          return Image.network(_data[index]);
        });
  }

  Future _refreshData() async {
    return _initData();
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
