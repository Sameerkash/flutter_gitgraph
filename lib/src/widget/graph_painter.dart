import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../models/commit.dart';


/// The [CustomPainter] class that is used to draw the [Commit] tree.
class GraphPainter extends CustomPainter {
  final List<Commit> data;
  final Map<String, Commit> commitMap;
  final Map<String, List<String>> childrenData;

  GraphPainter({
    @required this.data,
    @required this.commitMap,
    @required this.childrenData,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    Paint linePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    Paint curvePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    Paint controlHandlePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    for (int x = 0; x < data.length; x++) {
      Commit element = data[x];
      canvas.drawCircle(commitMap[element.id].position, 10, circlePaint);

      final builder = ui.ParagraphBuilder(ui.ParagraphStyle());
      builder.pushStyle(ui.TextStyle(
        fontSize: 10,
        // color: iconColor,
      ));
      builder.addText(commitMap[element.id].name);
      final paragraph = builder.build();
      paragraph.layout(const ui.ParagraphConstraints(width: 40.0));
      final offsetIcon = Offset(commitMap[element.id].position.dx + 12,
          commitMap[element.id].position.dy);
      canvas.drawParagraph(paragraph, offsetIcon);

      List<String> children = childrenData[element.id];
      if (children.isNotEmpty) {
        for (int y = 0; y < children.length; y++) {
          Commit childElement = commitMap[children[y]];

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
            // canvas.drawCircle(
            //     Offset(element.position.dx, element.position.dy - 50),
            //     5,
            //     controlHandlePaint);
            // canvas.drawCircle(
            //     Offset(childElement.position.dx, childElement.position.dy + 50),
            //     5,
            //     controlHandlePaint);
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
