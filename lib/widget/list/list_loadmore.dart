import 'package:flutter/material.dart';

class ListLoadMorePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListLoadMoreState();
  }
}

class _ListLoadMoreState extends State<ListLoadMorePage> {
  var listItems = ['北京', '上海', '广州', '深圳', '杭州', '苏州', '天津', '武汉', '成都', '西安'];

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final title = '列表加载更多控件';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text(title),
          ),
          body: RefreshIndicator(
              child: ListView(
                controller: _scrollController,
                children: _listVerticalWidget(),
              ),
              onRefresh: _handleRefresh)),
    );
  }

  List<Widget> _listVerticalWidget() {
    return listItems.map((city) => _buildItem(city)).toList();
  }

  _loadData() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      List<String> list = List<String>.from(listItems);
      list.addAll(listItems);
      listItems = list;
    });
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      listItems = listItems.reversed.toList();
    });
    return null;
  }

  Widget _buildItem(String city) {
    return Container(
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      margin: EdgeInsets.only(bottom: 2),
      child: Text(city, style: TextStyle(color: Colors.white, fontSize: 14)),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }
}
