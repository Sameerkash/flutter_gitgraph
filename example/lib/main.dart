import 'package:flutter/material.dart';
import 'package:flutter_gitgraph/flutter_gitgraph.dart';

const COMMIT_DATA = [
  {'id': 'cmt_1', 'name': 'h45edf'},
  {'id': 'cmt_2', 'name': 'ed3sdf', 'prev': 'cmt_1'},
  {'id': 'cmt_3', 'name': 'asd32n', 'prev': 'cmt_2'},
  {'id': 'cmt_4', 'name': 'bsh32j', 'prev': 'cmt_3'},
  {'id': 'cmt_5', 'name': 'f3h3dr', 'prev': 'cmt_2'},
  {'id': 'cmt_6', 'name': 'jf3djs', 'prev': 'cmt_3'},
  {'id': 'cmt_7', 'name': 'z45dsw', 'prev': 'cmt_3'},
  {'id': 'cmt_8', 'name': 'djw4ls', 'prev': 'cmt_6'},
  {'id': 'cmt_9', 'name': '3edfk3', 'prev': 'cmt_4'},
  {'id': 'cmt_10', 'name': 'fdhj3fg', 'prev': 'cmt_4'},
  {'id': 'cmt_11', 'name': 'dk32fhj', 'prev': 'cmt_5'},
  {'id': 'cmt_12', 'name': 'dhj45kv', 'prev': 'cmt_1'}
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Commit> commits = [];

  @override
  void initState() {
    super.initState();
    parseData();
  }

  parseData() {
    // Assuming that the list is already sorted
    COMMIT_DATA.forEach((element) {
      Commit ele = Commit.fromMap(element);
      commits.add(ele);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GitGraph(commits: commits),
      ),
    );
  }
}
