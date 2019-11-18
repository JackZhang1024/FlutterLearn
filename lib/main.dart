import 'package:flutter/material.dart';
import 'package:flutter_app/widget/ListPage.dart';
import 'package:flutter_app/widget/ImagePage.dart';

/* Flutter学习首页 */
void main() =>
    runApp(new MaterialApp(
      title: "MaterialApp",
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.amberAccent,
        accentColor: Colors.lightGreen
      ),
      routes: <String, WidgetBuilder>{
        '/widgets': (BuildContext context)=> new ListPage(items: new List<String>.generate(20, (index) => "Item ${index + 1}")),
        '/image': (BuildContext context)=> new ImagePage(),
      },
      home: new TutorialHome(),
    ));

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          onPressed: null,
          tooltip: 'Navigation',
        ),
        title: new Text('Flutter 学习'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: null,
            tooltip: 'Search',
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                 //Navigator.of(context).pushNamed('/widgets');
                Navigator.of(context).pushNamed('/image');
              },
              child: Text(
                '控件',
                style: TextStyle(fontSize: 14, color: Colors.black),),
            ),
            RaisedButton(
              onPressed: (){

              },
              child: Text(
                '主题',
                style: TextStyle(fontSize: 14, color: Colors.black),),
            ),
            RaisedButton(
              onPressed: (){

              },
              child: Text(
                '数据存储',
                style: TextStyle(fontSize: 14, color: Colors.black),),
            ),
            RaisedButton(
              onPressed: (){

              },
              child: Text(
                '网络',
                style: TextStyle(fontSize: 14, color: Colors.black),),
            ),
            RaisedButton(
              onPressed: (){

              },
              child: Text(
                '手势',
                style: TextStyle(fontSize: 14, color: Colors.black),),
            ),
            RaisedButton(
              onPressed: (){

              },
              child: Text(
                '动画',
                style: TextStyle(fontSize: 14, color: Colors.black),),
            ),
            RaisedButton(
              onPressed: (){
                print('按钮一');
              },
              child: Text(
                '异步',
                style: TextStyle(fontSize: 14, color: Colors.black),),
            ),
            RaisedButton(
              onPressed: (){

              },
              child: Text(
                '导航',
                style: TextStyle(fontSize: 14, color: Colors.black),),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        tooltip: 'Menu',
        child: new Icon(Icons.add),
      ),
    );
  }
}

class InkButton extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new InkWell(
      onTap: (){
        final snackBar = new SnackBar(content: new Text('SnackBar'));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Text('RrippleView'),
      ),

    );
  }
}


