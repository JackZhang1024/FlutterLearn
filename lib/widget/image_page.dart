import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        title: 'Image学习',
        theme: new ThemeData(
            primaryColor: Colors.blue,
            accentColor: Colors.blue,
            backgroundColor: Colors.white,
            brightness: Brightness.light),
        home: new ImageHome());
  }
}

class ImageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('Image学习'),
      ),
      body: new Center(
//          child: Image.network('http://222.186.12.239:20011/mm8/tupai/20160122/k2xvpyl3wpl.jpg',width: 300.0, height: 300.0),
//          child: Image.asset('images/lovely_girl.jpg', width: 300, height: 900,),
//          child: Image(image: AssetImage('images/lovely_girl.jpg'), width: 300, height: 900,),
//          child: Image.file(File('/sdcard/Download/lovely_girl.jpg'), width:  300, height: 900,
        // /data/data/com.luckyboy.flutterapp/files/lovely_girl.jpg
//            child: Image.file(File('/data/data/com.luckyboy.flutterapp/files/lovely_girl.jpg'), width:  300, height: 900,)
        // 相对路径加载图片
//          child: FutureBuilder(
//              future: _getLocalFile('lovely_girl.jpg'),
//              builder: (BuildContext context, AsyncSnapshot<File> snapShot) {
//                return snapShot.data != null
//                    ? Image.file(snapShot.data)
//                    : Container();
//              })

//            child: FadeInImage.memoryNetwork(
//                placeholder: kTransparentImage,
//                image: 'http://222.186.12.239:20011/mm8/tupai/20160122/k2xvpyl3wpl.jpg'),

//             child: CachedNetworkImage(
//                  placeholder: (context, url) => CircularProgressIndicator() ,
//                  imageUrl: 'http://222.186.12.239:20011/mm8/tupai/20160122/k2xvpyl3wpl.jpg'),

        // icon 使用
        // 自定义icon使用
        child: Icon(
          Icons.android,
          size: 100,
        ),
      ),
    );
  }

  Future<File> _getLocalFile(String fileName) async {
//    String dir = (await getExternalStorageDirectory()).path;
//    String dir = (await getTemporaryDirectory()).path; // /data/user/0/com.luckyboy.flutterapp/cache
    String dir = (await getApplicationDocumentsDirectory())
        .path; // /data/user/0/com.luckyboy.flutterapp/app_flutter/lovely_girl.jpg
    print('_getLocalFile $dir');
    File f = new File('$dir/$fileName');
    return f;
  }
}
