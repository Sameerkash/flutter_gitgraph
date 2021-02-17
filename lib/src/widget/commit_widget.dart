import 'package:flutter/material.dart';

/// A solid circle which represnets a commit in the workflow
class CommitWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
    
    );
  }
}
