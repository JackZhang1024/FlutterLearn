import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Navigation Basics',
    home: new FirstScreen(),
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First Screen'),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            // 跳转
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new SecondScreen()));
          },
          child: new Text('Launch new Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.pop(context);

          },
          child: new Text('Go Back'),
        ),
      ),
    );
  }
}
