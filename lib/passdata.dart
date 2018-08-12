import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

void main() {
  runApp(new MaterialApp(
    title: 'Passing Data',
    home: new TodoScreen(
        todos: new List<Todo>.generate(
            10, (index) => new Todo('Todo $index', 'TodoDetail $index'))),
  ));
}

class TodoScreen extends StatelessWidget {
  final List<Todo> todos;

  TodoScreen({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todos'),
      ),
      body: new ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return new ListTile(
              title: new Text(todos[index].title),
              onTap: () {
                Navigator.push(
                    context,
                    // 跳转到详情
                    new MaterialPageRoute(
                        builder: (context) =>
                            new DetailScreen(todo: todos[index])));
              },
            );
          }),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Todo todo;

  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("${todo.title}"),
        ),
        body: new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Text('${todo.description}'),
        ));
  }
}
