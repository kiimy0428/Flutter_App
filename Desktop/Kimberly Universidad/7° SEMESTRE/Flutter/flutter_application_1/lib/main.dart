import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: '// TODO:'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class ToDoItemModel{
  String text;
  int order; 
  bool checked;

  ToDoItemModel(this.text, {required this.order, this.checked: false});
}

class _MyHomePageState extends State<MyHomePage> {
  List<ToDoItemModel> items = [
    ToDoItemModel('A', order: 0, checked: true),
    ToDoItemModel('B', order: 1),
    ToDoItemModel('C', order: 2),
  ];

UpdateList(e){
  setState(() {
    List<ToDoItemModel> checkeds = 
      this.items.where((element) => element.checked).toList();
  checkeds.sort((a,b) => a.order - b.order);

  List<ToDoItemModel> uncheckeds = 
      this.items.where((element) => !element.checked).toList();
  uncheckeds.sort((a,b) => a.order - b.order);

  this.items.clear();
  this.items.addAll([...uncheckeds, ...checkeds]);
  });
}

 @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(widget.title),
        toolbarHeight: 180,
      ),
      body: ListView(
        children: [
          ...this.items.map((e) => ListTile(
            leading: Checkbox(
              checkColor: Colors.transparent,
              activeColor: Colors.grey.shade500,
              onChanged: (e){},
              value: e.checked,
            ),
            title: Opacity (
              opacity: e.checked ? 0.5 : 1,
              child: Text(
                e.text,
                style: TextStyle(
                  color: e.checked ? Colors.grey.shade500 : Colors.black, 
                  decoration: e.checked ? TextDecoration.lineThrough :
                  null,
                ),
              ),

            ),
          )),
        ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
