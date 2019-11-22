import 'package:flutter/material.dart';
import 'package:flutter_app/channel/channel_plugin.dart';

class ChannelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final String title = "";
    return new MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: _getAndroidVersion,
            child: Text('点击获取系统版本号'),
          ),
        ),
      ),
    );
  }

  Future<Null> _getAndroidVersion() {
    FlutterPluginDemo.platformVersion.then((String version) {
      print('$version');
    });
    return null;
  }
}
