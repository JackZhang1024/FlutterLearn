import 'package:flutter/material.dart';

class ListVerticalPage extends StatelessWidget {
  final listItems = [
    '北京',
    '上海',
    '广州',
    '深圳',
    '杭州',
    '苏州',
    '天津',
    '武汉',
    '成都',
    '西安'
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final title = '垂直滚动列表控件';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text(title),
          ),
//          body: ListView(
//            children: _listVerticalWidget(),
//          )),
          body: ListView.builder(
            itemCount: listItems.length,
            itemBuilder: (context, index) {
              return _buildItem(listItems[index]);
            },
          )),
    );
  }

  List<Widget> _listVerticalWidget() {
    return listItems.map((city) => _buildItem(city)).toList();
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
}
