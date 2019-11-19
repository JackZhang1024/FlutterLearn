import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoragePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: '存储处理', home: _StorageHome());
  }
}

class _StorageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('存储处理'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: _savePrefs,
              child: Text('存数据'),
            ),
            RaisedButton(
              onPressed: (){
                _getPrefs().then((String data){
                    print('取数据 $data');
                }).catchError(print);
              },
              child: Text('取数据'),
            )
          ],
        ),
      ),
    );
  }

  _savePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', 'liLy');
  }

  Future<String> _getPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    return  prefs.getString('userName');
  }
}
