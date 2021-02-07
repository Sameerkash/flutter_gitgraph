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
        child: Row(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                BranchWidget(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommitWidget(),
                    SizedBox(
                      height: 25,
                    ),
                    CommitWidget(),
                    SizedBox(
                      height: 25,
                    ),
                    CommitWidget(),
                    SizedBox(
                      height: 25,
                    ),
                    CommitWidget(),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text("master")],
            )
          ],
        ),
      ),
    );
  }
}
