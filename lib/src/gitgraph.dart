import 'package:flutter/material.dart';

import 'models/commit.dart';
import 'widget/graph_painter.dart';

/// The widget used to show a Git workflow graph. It uses [Commit] data to draw
/// a graph using [GraphPainter].
class GitGraph extends StatefulWidget {
  const GitGraph({
    Key key,
    @required this.commits,
  }) : super(key: key);

  /// The List of [Commit]s to be dispplayed
  final List<Commit> commits;

  @override
  _GitGraphState createState() => _GitGraphState();
}

class _GitGraphState extends State<GitGraph> {
  /// List of [Commit]s.
  List<Commit> commits = [];

  /// A Map of commit child ids to be drawn.
  Map<String, List<String>> commitChildData = {};

  /// A Map of [Commit]s used to draw a curved branch.
  Map<String, Commit> commitsMap = {};

  /// A List to keep track of the position of [Commit]s already drawn.
  List<Offset> usedPositions = [];

  void parseData() {
    commits = widget.commits;
    commits.forEach((element) {
      commitChildData[element.id] = [];
      commitsMap[element.id] = element;
      if (element.prev != null) {
        if (commitChildData[element.prev] == null) {
          commitChildData[element.prev] = [];
        }
        commitChildData[element.prev].add(element.id);
      }
    });
  }

  ///
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

  ///
  void calculatePositions(Commit element, Offset position) {
    // 100 is Unity Y Movement

    element.position = position;
    element.painted = true;
    commitsMap[element.id] = element;
    if (commitChildData[element.id].isNotEmpty) {
      List<String> children = commitChildData[element.id];
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
  void initState() {
    super.initState();
    parseData();
    Size canvasSize = Size(500, 700);
    calculatePositions(
        commits.first, Offset(canvasSize.width / 2, canvasSize.height - 100));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        key: Key('graph'),
        size: Size(500, 700),
        painter: GraphPainter(
          data: commits,
          commitMap: commitsMap,
          childrenData: commitChildData,
        ),
      ),
    );
  }
}
