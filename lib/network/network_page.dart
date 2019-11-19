import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_app/network/post_model.dart';

class NetWorkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(title: '网络请求', home: _NetWorkHome());
  }
}

class TravelTabModel {
  final String url;
  final List<TravelTab> tabs;

  TravelTabModel({this.url, this.tabs});

  factory TravelTabModel.fromJson(Map<String, dynamic> json) {
    String url = json['url'];
    List<TravelTab> tabs = (json['tabs'] as List).map((data) => TravelTab.fromJson(data)).toList();
    return TravelTabModel(url: url, tabs:  tabs);
  }
}

class TravelTab {
  final String labelName;
  final String channel;

  TravelTab({this.labelName, this.channel});

  factory TravelTab.fromJson(Map<String, dynamic> json) {
    return new TravelTab(
        labelName: json['lableName'], channel: json['channel']);
  }
}

class _NetWorkHome extends StatelessWidget {
  String jsonData =
      '{"url": "xxx", "tabs":[{"lableName":"推荐","channel":"recommend"}, {"lableName":"拍照","channel":"photo"}]}';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('网络请求'),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: null),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _fetchGetPostModel().then((PostModel data) {
                  print('Get请求返回结果 ${data.title}');
                });
              },
              child: Text('GET请求'),
            ),
            RaisedButton(
              onPressed: () {
                _fetchPostMethodPostModel().then((PostModel data) {
                  print('Post请求返回结果 ${data.title}');
                });
              },
              child: Text('POST请求'),
            ),
            RaisedButton(
              onPressed: () {
                _doParseJson(jsonData);
              },
              child: Text('复杂JSON转换'),
            ),
          ],
        ),
      ),
    );
  }

  // https://jsonplaceholder.typicode.com/posts/1
  _fetchGet() async {
    var response =
        await http.get('https://jsonplaceholder.typicode.com/posts/1');
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      print('result $result');
    } else {
      print('Error ${response.statusCode}');
    }
  }

  Future<PostModel> _fetchGetPostModel() async {
    var response =
        await http.get('https://jsonplaceholder.typicode.com/posts/1');
    var result = json.decode(response.body);
    return PostModel.fromJson(result);
  }

  Future<PostModel> _fetchPostMethodPostModel() async {
    var response =
        await http.post('https://jsonplaceholder.typicode.com/posts/1');
    print('Post请求返回状态码 ${response.statusCode}');
    var result = json.decode(response.body);
    return PostModel.fromJson(result);
  }

  _doParseJson(String data) {
    var result = json.decode(data);
    TravelTabModel travelTabModel = TravelTabModel.fromJson(result);
    print('${travelTabModel.url}');
  }

//  body: new Center(
//  child: new FutureBuilder<Post>(
//  future: fetchPost(),
//  builder: (context, snapshot) {
//  if (snapshot.hasData) {
//  return new Text(snapshot.data.title);
//  } else if (snapshot.hasError) {
//  return new Text("${snapshot.error}");
//  }
//
//  // By Default, show a loading spinner
//  return new CircularProgressIndicator();
//  }),
//  ),

}
