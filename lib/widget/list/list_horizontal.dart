import 'package:flutter/material.dart';

class ListHorizontalPage extends StatelessWidget {
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
    final title = '水平滚动列表控件';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _listHorizontalWidget(),
            )),
      ),
    );
  }

  List<Widget> _listHorizontalWidget() {
    return listItems.map((city) => _buildItem(city)).toList();
  }

  Widget _buildItem(String city) {
    return Container(
      width: 120,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      margin: EdgeInsets.only(right: 10),
      child: Text(city, style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
