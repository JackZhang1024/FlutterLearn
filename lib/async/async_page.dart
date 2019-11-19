import 'dart:async';
import 'dart:math';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/network/post_model.dart';
import 'package:http/http.dart' as http;

// Future 表示在接下来的某个事件的错误或者值
// Future 常用方法

// async await
class AsyncPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(title: '异步处理', home: _AsyncHome());
  }
}

class _AsyncHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('异步处理'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: _doPrint,
              child: Text('延迟打印'),
            ),
            RaisedButton(
              onPressed: _whenComplete,
              child: Text('WhenComplete'),
            ),
            RaisedButton(
              onPressed: _futureTimeout,
              child: Text('TimeOut'),
            ),
            FutureBuilder<PostModel>(
              future: _fetchGetPostModel(),
              builder: (context, snaptShot) {
                switch (snaptShot.connectionState) {
                  case ConnectionState.none:
                    return new Text('Input a URL to start');
                    break;
                  case ConnectionState.waiting:
                    return new Center(child: new CircularProgressIndicator());
                    break;
                  case ConnectionState.active:
                    return new Text('');
                    break;
                  case ConnectionState.done:
                    if (snaptShot.hasData) {
                       return new Text('${snaptShot.data.title}');
                    } else if (snaptShot.hasError) {
                       return new Text('${snaptShot.error}');
                    }
                    break;
                }
              },
            )
          ],
        ),
      ),
    );
  }

  _doPrint() {
    print('t1: ${DateTime.now().toString()}');
    _delayPrint();
    print('t2: ${DateTime.now().toString()}');
  }

  _delayPrint() async {
    int result = await Future.delayed(Duration(milliseconds: 2000), () {
      return Future.value(10);
    });
    print('t3: ${DateTime.now().toString()} $result');
  }

  _whenComplete() async {
    var random = Random();
    Future.delayed(Duration(seconds: 3), () {
      if (random.nextBool()) {
        return 100;
      } else {
        throw 'boom';
      }
    }).then(print).catchError(print).whenComplete(() {
      print('Done');
    });
  }

  _futureTimeout() {
    Future.delayed(Duration(seconds: 3), () {
      return 1;
    }).timeout(Duration(seconds: 2)).then(print).catchError(print);
  }

  // FutureBuilder 异步操作和UI更新放到一块
  Future<PostModel> _fetchGetPostModel() async {
    var response =
        await http.get('https://jsonplaceholder.typicode.com/posts/1');
    var result = json.decode(response.body);
    return PostModel.fromJson(result);
  }
}
