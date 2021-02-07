import 'package:flutter/material.dart';

/// A straight line which represents a Branch in the workflow
class BranchWidget extends StatelessWidget {
  final int height;
  const BranchWidget({
    Key key,
    this.height,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 400,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(15)),
    );
  }
}
