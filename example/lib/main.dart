import 'package:flutter/material.dart';
import 'package:flutter_gitgraph/flutter_gitgraph.dart';

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
      ),
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CommitWidget(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TagWidget(),
                      ),
                    ],
                  ),
                  BranchWidget(),
                  Row(
                    children: [
                      Row(
                        children: [
                          CommitWidget(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TagWidget(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  BranchWidget(),
                  Row(
                    children: [
                      CommitWidget(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TagWidget(),
                      ),
                    ],
                  ),
                  BranchWidget(),
                  Row(
                    children: [
                      CommitWidget(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TagWidget(),
                      ),
                    ],
                  ),
                ],
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [Text("master")],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
