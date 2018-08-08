import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

// https://github.com/renefloor/flutter_cached_network_image
class MyAppBar extends StatelessWidget {
  final Widget title;

  MyAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 60.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu), tooltip: "AppBar", onPressed: null),
          new Expanded(child: title),
          new IconButton(
              icon: new Icon(Icons.search), tooltip: "Search", onPressed: null)
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              'Title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
            child: new Center(
              child: new Text('Hello World!'),
            ),
          )
        ],
      ),
    );
  }
}

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
        title: new Text('Example Title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: null,
            tooltip: 'Search',
          ),
        ],
      ),
      body: new Center(
        //child: new Text('Content'),
        //child: new MyButton(),
        child: new Counter(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        tooltip: 'Menu',
        child: new Icon(Icons.add),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: () {
        print('Button clicked...');
      },
      child: new Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text('hello World'),
        ),
      ),
    );
  }
}

//  保存状态的Button
class Counter extends StatefulWidget {
  @override
  _CounterState createState() => new _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    // 在setState()中调用会重新调用build方法
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      children: <Widget>[
//        new RaisedButton(
//          onPressed: _increment,
//          child: new Text('RasiseButton'),
//        ),
//        new Text('Counter: $_counter')

        new CounterIncrementor(pressed: _increment),
        new CounterDisplay(count: _counter)
      ],
    );
  }
}

class CounterDisplay extends StatelessWidget {
  final int count;

  CounterDisplay({this.count});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Text('Counter $count');
  }
}

class CounterIncrementor extends StatelessWidget {
  final VoidCallback pressed;

  CounterIncrementor({this.pressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RaisedButton(
      onPressed: pressed,
      child: new Text('Incrementor'),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final appName = 'Material';
    return new MaterialApp(
      title: appName,
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[200],
      ),
      home: new MyHomePage(title: appName),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),

//      body: new Center(
//        child: new Container(
//          color: Theme.of(context).accentColor,
//          child: new Row(
//            children: <Widget>[
//              new Text(
//                  'Text with a background color',
//                  style: Theme.of(context).textTheme.title,
//
//              ),
////              new Image.network('https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true'),
//            ],
//          ),
//        ),
//      ),

//      body: new Image.network(
//        'http://img02.tooopen.com/images/20160509/tooopen_sy_161967094653.jpg',
//      ),

        body: new Stack(
          children: <Widget>[
            new Center(child: new CircularProgressIndicator()),
            new Center(
              child: new FadeInImage.memoryNetwork(placeholder: kTransparentImage,
                  image: 'http://img02.tooopen.com/images/20160509/tooopen_sy_161967094653.jpg'),
            )
          ],

        ),


      floatingActionButton: new Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.yellow),
        child: new FloatingActionButton(
          onPressed: null,
          child: new Icon(Icons.add),
        ),
      ),
    );
  }
}

void main() =>
//    runApp(new MaterialApp(
//      title: "MaterialApp",
//      home: new TutorialHome(),
//      theme: new ThemeData(
//        brightness: Brightness.light,
//        primaryColor: Colors.amberAccent,
//        accentColor: Colors.lightGreen
//      ),
//    ));

    runApp(new MyApp());
