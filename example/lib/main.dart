import 'package:flutter/material.dart';
import 'package:flutter_gitgraph/flutter_gitgraph.dart';
import 'package:timelines/timelines.dart';

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

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: CurveWidget(),
      );
  }
}

class Timeline extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var branchPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset offsetTopCenter = size.topCenter(new Offset(0.0, 50.0));
    Offset offsetBottom = size.bottomCenter(new Offset(0.0, 50.0));

    Offset newoffsetTopCenter = size.topCenter(new Offset(119.5, 50.0));
    Offset newoffsetBottom = size.center(new Offset(119.5, -180.0));

    canvas.drawLine(offsetTopCenter, offsetBottom, paint);

    Paint circleFill = new Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill
      ..strokeWidth = 20;

    Paint branchCirle = new Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill
      ..strokeWidth = 20;

    Offset centeroff = size.center(new Offset(0.0, -50.0));

    Offset newOfff = size.center(new Offset(0.0, -50.0));

    Path path = Path();
    path.moveTo(centeroff.dx, centeroff.dy);
    path.cubicTo(newOfff.dx, newOfff.dy, newOfff.dx * 1.2, newOfff.dy,
        centeroff.dx + 120, centeroff.dy * 0.6);

    canvas.drawPath(path, branchPaint);

    canvas.drawLine(newoffsetTopCenter, newoffsetBottom, branchPaint);

    canvas.drawCircle(centeroff, 17.0, circleFill);

    canvas.drawCircle(size.center(new Offset(0.0, -250.0)), 17.0, circleFill);
    canvas.drawCircle(size.center(newOfff), 17.0, circleFill);

    canvas.drawCircle(size.center(new Offset(0.0, 50.0)), 17.0, circleFill);

    canvas.drawCircle(size.center(new Offset(0.0, 200.0)), 17.0, circleFill);

    /// Branch commits
    canvas.drawCircle(size.center(new Offset(119.5, -160)), 17.0, branchCirle);

    canvas.drawCircle(size.center(new Offset(119.5, -250)), 17.0, branchCirle);
    canvas.drawCircle(size.center(new Offset(119.5, -350)), 17.0, branchCirle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
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
            ),
            Container(
              height: 4000,
              child: CurveWidget(),
            )

          ],

        ),
      ),
    );
  }
}


