import 'package:flutter/material.dart';

class ListExpansionPage extends StatelessWidget {
  static const CITY_NAMES = {
    '北京': ['东城区', '西城区', '朝阳区', '海淀区', '丰台区', '昌平区', '石景山区', '顺义区'],
    '上海': ['黄浦区', '徐汇区', '长宁区', '静安区', '普陀区', '闸北区', '虹口区'],
    '广州': ['越秀', '海珠', '荔湾', '天河', '白云', '黄埔', '南沙', '番禺'],
  };

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final title = '列表展开与收起';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: ListView(
          children: _listExpansionWidget(),
        ),
      ),
    );
  }

  List<Widget> _listExpansionWidget() {
    List<Widget> widgets = [];
    CITY_NAMES.keys.forEach((city) {
      widgets.add(_item(city, CITY_NAMES[city]));
    });
    return widgets;
  }

  Widget _item(String city, List<String> subCities) {
    return ExpansionTile(
      title: Text(city, style: TextStyle(color: Colors.black54, fontSize: 20)),
      children: subCities.map((subCity) => _buildSub(subCity)).toList(),
      onExpansionChanged: (bool expand) {
        print('$expand');
      },///
    );
  }

  Widget _buildSub(String subCity) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
          height: 50,
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(color: Colors.lightBlueAccent),
          child: Text(subCity),
          alignment: Alignment.centerLeft,
      ),
    );
  }
}
