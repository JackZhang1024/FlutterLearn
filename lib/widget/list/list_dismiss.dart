import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ListPage extends StatelessWidget {
  final List<String> items;

  ListPage({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Dismissing Items';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return new Dismissible(
                key: new Key(item),
                onDismissed: (direction) {
                  items.removeAt(index);
                  Scaffold.of(context).showSnackBar(
                      new SnackBar(content: new Text('$item dismissed')));
                },
                background: new Container(
                  color: Colors.red,
                ),
                child: new ListTile(title: new Text('$item')),
              );
            }),
      ),
    );
  }
}
