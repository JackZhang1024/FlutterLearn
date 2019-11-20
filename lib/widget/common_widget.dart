import 'package:flutter/material.dart';

class CommonWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final title = '常见控件';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text(title),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text('水平列表'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/list_vertical');
                  },
                ),
                RaisedButton(
                  child: Text('垂直列表'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/list_horizontal');
                  },
                ),
                RaisedButton(
                  child: Text('展开折叠列表'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/list_expansion');
                  },
                ),
                RaisedButton(
                  child: Text('网格列表'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/list_gridview');
                  },
                ),
                RaisedButton(
                  child: Text('下拉刷新列表'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/list_refresh');
                  },
                ),
                RaisedButton(
                  child: Text('上拉加载列表'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/list_loadmore');
                  },
                ),
              ],
            ),
          )),
    );
  }
}
