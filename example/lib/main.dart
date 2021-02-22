import 'package:flutter/material.dart';

const COMMIT_DATA = [
  {"id": "cmt_1", "msg": "Commit 1"},
  {"id": "cmt_2", "msg": "Commit 2", "parent": "cmt_1"},
  {"id": "cmt_3", "msg": "Commit 3", "parent": "cmt_2"},
  {"id": "cmt_4", "msg": "Commit 4", "parent": "cmt_2"},
  {"id": "cmt_5", "msg": "Commit 5", "parent": "cmt_2"},
  {"id": "cmt_6", "msg": "Commit 6", "parent": "cmt_3"},
  {"id": "cmt_7", "msg": "Commit 7", "parent": "cmt_3"},
  {"id": "cmt_8", "msg": "Commit 8", "parent": "cmt_4"},
  {"id": "cmt_9", "msg": "Commit 9", "parent": "cmt_4"},
  {"id": "cmt_10", "msg": "Commit 10", "parent": "cmt_4"},
  {"id": "cmt_11", "msg": "Commit 10", "parent": "cmt_5"},
  {"id": "cmt_12", "msg": "Commit 10", "parent": "cmt_1"}
];

class Commit {
  String id, msg, parent;
  Offset position;
  bool painted = false;

  Commit({this.id, this.msg, this.parent});

  Commit.fromJson(Map<String, dynamic> data) {
    this.id = data['id'];
    this.msg = data['msg'];
    this.parent = data['parent'];
  }
}

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
  Map<String, List<String>> cmtChildData = {};
  Map<String, Commit> commitsMap = {};
  List<Offset> usedPositions = [];

  @override
  void initState() {
    super.initState();
    parseData();
    Size canvasSize = Size(500, 500);
    calculatePositions(
        commits.first, Offset(canvasSize.width / 2, canvasSize.height - 100));
  }

  parseData() {
    // Assuming that the list is already sorted
    commits = COMMIT_DATA.map((cmt) => Commit.fromJson(cmt)).toList();
    commits.forEach((element) {
      cmtChildData[element.id] = [];
      commitsMap[element.id] = element;
      if (element.parent != null) {
        if (cmtChildData[element.parent] == null) {
          cmtChildData[element.parent] = [];
        }
        cmtChildData[element.parent].add(element.id);
      }
    });
  }

  List<Offset> getChildPositions(Offset levelPosition, int childCount) {
    // 50 is Unity X Movement

    double firstX = levelPosition.dx;
    // Subtracting 50 (Unit X Width) to
    Offset firstPosition = Offset(firstX - 50, levelPosition.dy);
    List<Offset> positions = [];
    for (int y = 0; y < childCount; y++) {
      firstPosition = firstPosition.translate(50, 0);
      while (usedPositions.contains(firstPosition)) {
        firstPosition = firstPosition.translate(50, 0);
      }
      positions.add(firstPosition);
      usedPositions.add(firstPosition);
    }
    return positions;
  }

  calculatePositions(Commit element, Offset position) {
    // 100 is Unity Y Movement

    element.position = position;
    element.painted = true;
    commitsMap[element.id] = element;
    if (cmtChildData[element.id].isNotEmpty) {
      List<String> children = cmtChildData[element.id];
      Offset childrenLevelPosition = element.position.translate(0, -100);
      List<Offset> childPositions =
          getChildPositions(childrenLevelPosition, children.length);
      for (int y = 0; y < children.length; y++) {
        Commit subChild = commitsMap[children[y]];
        if (!subChild.painted) {
          calculatePositions(subChild, childPositions[y]);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            child: CustomPaint(
              size: Size(500, 700),
              painter: MyCustomPainter(
                  data: commits,
                  cmtMap: commitsMap,
                  childrenData: cmtChildData),
            ),
          ),
        ));
  }
}

class MyCustomPainter extends CustomPainter {
  final List<Commit> data;
  final Map<String, Commit> cmtMap;
  final Map<String, List<String>> childrenData;

  MyCustomPainter({this.data, this.cmtMap, this.childrenData});

  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    Paint linePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    Paint curvePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    Paint controlHandlePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    for (int x = 0; x < data.length; x++) {
      Commit element = data[x];
      canvas.drawCircle(cmtMap[element.id].position, 5, circlePaint);
      List<String> children = childrenData[element.id];
      if (children.isNotEmpty) {
        for (int y = 0; y < children.length; y++) {
          Commit childElement = cmtMap[children[y]];

          bool isOnLine = childElement.position.dx == element.position.dx;
          if (isOnLine) {
            // Drawing Line
            canvas.drawLine(element.position, childElement.position, linePaint);
          } else {
            // Creating Curved Path from Parent to Child
            Path path = Path();
            path.moveTo(element.position.dx, element.position.dy);
            path.cubicTo(
                element.position.dx,
                element.position.dy - 50,
                childElement.position.dx,
                childElement.position.dy + 50,
                childElement.position.dx,
                childElement.position.dy);
            canvas.drawPath(path, curvePaint);

            // Drawing Control Handles
            canvas.drawCircle(
                Offset(element.position.dx, element.position.dy - 50),
                2,
                controlHandlePaint);
            canvas.drawCircle(
                Offset(childElement.position.dx, childElement.position.dy + 50),
                2,
                controlHandlePaint);
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
