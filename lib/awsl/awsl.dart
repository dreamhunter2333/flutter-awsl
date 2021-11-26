import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:extended_image/extended_image.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wakelock/wakelock.dart';

import '../main.dart';

const baseUrl = "http://awsl-py.dev.jcstaff.club";

class Awsl extends StatefulWidget {
  static const title = 'Awsl';

  const Awsl({Key? key}) : super(key: key);

  @override
  _AwslState createState() => _AwslState();
}

class _AwslState extends State<Awsl> {
  final _androidRefreshKey = GlobalKey<RefreshIndicatorState>();

  final List<Pair<String, String>> _data = [];
  int _count = 0;

  // 当页码
  var curIndex = 0;
  // wb user id
  var producer = "";
  // wb user list
  late List<Pair<String, String>> producerList = [];
  final countPerPage = 10;
  var _isFetching = false;
  final PageController _controller = PageController(initialPage: 0);
  var _isAutoDisplay = false;

  @override
  void initState() {
    Wakelock.enable();
    fetchProducers();
    _initData();
    super.initState();
  }

  Future _initData() async {
    _isFetching = true;
    _data.clear();
    final countFuture = fetchCount().then((value) => _count = value);
    final dataFuture =
        fetchData(countPerPage, 0).then((value) => _data.addAll(value));
    final futures = [countFuture, dataFuture];
    await Future.wait(futures);
    setState(() {});
    _isFetching = false;
    _isAutoDisplay = false;
  }

  Future fetchNextPage(index) async {
    curIndex = index;
    if (_isFetching) return;
    if (_data.length >= _count || index + 3 < _data.length) return;
    _isFetching = true;
    final offset = _data.length;
    final result = await fetchData(countPerPage, offset);
    _data.addAll(result);
    setState(() {});
    _isFetching = false;
  }

  Future fetchProducers() async {
    final response = await http.get(Uri.parse(baseUrl + "/producers"));
    Utf8Decoder utf8decoder = const Utf8Decoder();
    String responseString = utf8decoder.convert(response.bodyBytes);
    final res = json.decode(responseString);
    producerList = List.generate(
        res.length, (index) => Pair(res[index]["uid"], res[index]["name"]));
    producer = producerList.isNotEmpty ? producerList[0].t1 : "";
  }

  Future<List<Pair<String, String>>> fetchData(limit, offset) async {
    var url = baseUrl + "/list?limit=$limit&offset=$offset";
    if (producer.isNotEmpty) url += "&uid=$producer";
    final response = await http.get(Uri.parse(url),
        headers: {'Content-Type': 'application/json; charset=UTF-8'});
    final urlList = json.decode(response.body);
    return List.generate(
        urlList.length,
        (index) => Pair(urlList[index]["pic_info"]["large"]["url"],
            urlList[index]["wb_url"]));
  }

  Future<int> fetchCount() async {
    var url = baseUrl + "/list_count";
    if (producer.isNotEmpty) url += "?uid=$producer";
    final response = await http.get(Uri.parse(url));
    return int.parse(response.body);
  }

  Future<void> changeLanguage() async {
    List<SimpleDialogOption> children = List.generate(
        producerList.length,
        (index) => SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, producerList[index].t1);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(producerList[index].t2),
              ),
            ));
    String? uid = await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择来源'),
            children: children,
          );
        });

    if (uid != null) {
      producer = uid;
      await _initData();
      _up();
    }
  }

  Future _refreshData() async {
    await _initData();
    _up();
  }

  void _autoPlay() async {
    _isAutoDisplay = !_isAutoDisplay;
    if (_isAutoDisplay) {
      Timer.periodic(const Duration(milliseconds: 3000), (value) async {
        if (!_isAutoDisplay || curIndex >= _count) {
          value.cancel();
          return;
        }
        _controller.animateToPage(curIndex + 1,
            duration: const Duration(milliseconds: 200),
            curve: Curves.bounceInOut);
        setState(() {});
      });
    }
    await Fluttertoast.showToast(
        msg: _isAutoDisplay ? "已开始自动播放，再次点击可停止" : "已停止自动播放",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _up() {
    _controller.animateToPage(0,
        duration: const Duration(milliseconds: 200), curve: Curves.bounceInOut);
  }

  Future _save() async {
    var data = await getNetworkImageData(_data[curIndex].t1, useCache: true);
    var filePath = await ImageGallerySaver.saveImage(data!);
    await Fluttertoast.showToast(
        msg: "已保存到相册: " + filePath.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future _open() async {
    if (!await launch(_data[curIndex].t2)) {
      throw 'Could not launch $_data[curIndex].t2';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Awsl.title),
        actions: [
          IconButton(
              icon: const Icon(Icons.settings), onPressed: changeLanguage),
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
        child: ExtendedImageGesturePageView.builder(
          itemBuilder: (BuildContext context, int index) {
            var item = _data[index].t1;
            Widget image = ExtendedImage.network(item,
                fit: BoxFit.contain, mode: ExtendedImageMode.gesture);
            image = Container(
              child: image,
              padding: const EdgeInsets.all(5.0),
            );
            return image;
          },
          itemCount: _data.length,
          onPageChanged: fetchNextPage,
          controller: _controller,
          scrollDirection: Axis.vertical,
        ),
      ),
      floatingActionButton: Column(mainAxisSize: MainAxisSize.min, children: [
        FloatingActionButton(
            onPressed: _autoPlay,
            tooltip: 'Auto Play',
            child: const Icon(Icons.play_circle, color: Colors.pink),
            backgroundColor: Colors.pink.shade50),
        const SizedBox(height: 10),
        FloatingActionButton(
            onPressed: _up,
            tooltip: 'Up',
            child: const Icon(Icons.arrow_upward, color: Colors.pink),
            backgroundColor: Colors.pink.shade50),
        const SizedBox(height: 10),
        FloatingActionButton(
            onPressed: _save,
            tooltip: 'Save',
            child: const Icon(Icons.save, color: Colors.pink),
            backgroundColor: Colors.pink.shade50),
        const SizedBox(height: 10),
        FloatingActionButton(
            onPressed: _open,
            tooltip: 'open',
            child: const Icon(Icons.open_in_browser, color: Colors.pink),
            backgroundColor: Colors.pink.shade50)
      ]),
    );
  }
}
