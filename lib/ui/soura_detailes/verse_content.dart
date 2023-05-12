import 'package:flutter/material.dart';

class VerseContent extends StatelessWidget {
  String Content;

  VerseContent(this.Content);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          Content,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
