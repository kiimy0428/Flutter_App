import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'TO_DO_LIST'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class ToDoItemModel {
  String text;
  int order;
  bool checked;

  ToDoItemModel(this.text, {required this.order, this.checked: false});
}

class _MyHomePageState extends State<MyHomePage> {
  List<ToDoItemModel> items = [
    ToDoItemModel('Ordenar el closet', order: 0),
    ToDoItemModel('Ir por pan y leche', order: 1),
    ToDoItemModel('Hacer la trea de Ciencia ', order: 2),
    ToDoItemModel('Pagar la luz y agua', order: 3),
    ToDoItemModel('Hacer ejercicio', order: 4)
  ];
  updateList(e) {
    setState(() {
      List<ToDoItemModel> checkeds =
          this.items.where((element) => element.checked).toList();
      checkeds.sort((a, b) => a.order - b.order);

      List<ToDoItemModel> uncheckeds =
          this.items.where((element) => !element.checked).toList();
      uncheckeds.sort((a, b) => a.order - b.order);

      this.items.clear();
      this.items.addAll([...uncheckeds, ...checkeds]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],*/
        title: Text(widget.title),
        toolbarHeight: 100,
      ),
      body: ListView(
        children: [
          ...this.items.map((e) => ListTile(
                leading: Checkbox(
                  checkColor: Colors.green,
                  onChanged: (e) {},
                  value: e.checked,
                ),
                title: Opacity(
                  opacity: e.checked ? 0.5 : 1,
                  child: Text(
                    e.text,
                    style: TextStyle(
                      color: e.checked ? Colors.grey.shade500 : Colors.black,
                      decoration: e.checked ? TextDecoration.lineThrough : null,
                    ),
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {
                      print("More icon");
                    },
                    icon: Icon(Icons.more_vert)),
                onTap: () {
                  e.checked = !e.checked;
                  updateList(e);
                },
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}