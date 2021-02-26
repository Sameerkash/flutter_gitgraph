import 'package:flutter/material.dart';
import 'package:flutter_gitgraph/flutter_gitgraph.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  List<Commit> commits = [
    Commit(id: 'commit1', name: 'Commit1'),
    Commit(id: 'commit2', name: 'Commit3', prev: 'commit1')
  ];
  testWidgets('Widget has a CustomPaint', (WidgetTester tester) async {
    await tester.pumpWidget(GitGraph(commits: commits));

    final titleFinder = find.byKey(Key('graph'));

    expect(titleFinder, findsOneWidget);
  });
}
