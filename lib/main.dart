import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:transparent_image/transparent_image.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    final dataFuture =
        fetchData(countPerPage, 0).then((value) => _data.addAll(value));
    final futures = [countFuture, dataFuture];
    await Future.wait(futures);
    setState(() {});
    _isFetching = false;
  }

  Future fetchNextPage(index) async {
    if (_isFetching) return;
    if (_data.length >= _count || index + 3 < _data.length) return;
    _isFetching = true;
    final offset = _data.length;
    final result = await fetchData(countPerPage, offset);
    _data.addAll(result);
    setState(() {});
    _isFetching = false;
  }

  Future<List<String>> fetchData(limit, offset) async {
    final url =
        "http://awsl-py.dev.jcstaff.club/list?limit=$limit&offset=$offset";
    final response = await http.get(Uri.parse(url),
        headers: {'Content-Type': 'application/json; charset=UTF-8'});
    final urlList = json.decode(response.body);
    final result = <String>[];
    for (final url in urlList) {
      result.add(url["pic_info"]["large"]["url"]);
    }
    return result;
  }

  Future<int> fetchCount() async {
    final response =
        await http.get(Uri.parse("http://awsl-py.dev.jcstaff.club/list_count"));
    return int.parse(response.body);
  }

  Future _refreshData() async {
    print("_refreshData");
    return _initData();
  }

  void _like() async {
    await Fluttertoast.showToast(
        msg: " 暂不支持点赞，敬请期待",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    // 生成所有页
    for (int i = 0; i < _data.length; i++) {
      children.add(Page(index: "$i/$_count", url: _data[i]));
    }
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
        child: PageView(
          scrollDirection: Axis.vertical, // 滑动方向为垂直方向
          children: children,
          onPageChanged: fetchNextPage,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _like,
          tooltip: 'Like',
          child: const Icon(Icons.favorite, color: Colors.pink),
          backgroundColor: Colors.pink.shade50),
    );
  }
}

// Tab 页面
class Page extends StatefulWidget {
  const Page({Key? key, required this.index, required this.url})
      : super(key: key);

  final String index;
  final String url;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand, //未定位widget占满Stack整个空间
      children: <Widget>[
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: widget.url,
        ),
        Positioned(
          top: 18.0,
          child: Text(widget.index, textScaleFactor: 1.5),
        )
      ],
    );
  }
}
