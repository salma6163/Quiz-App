import 'package:flutter/material.dart';

class questions_wedget extends StatelessWidget {
  const questions_wedget({
    super.key,
    required this.quistion,
    required this.indexaction,
    required this.total_quistions,
  });
  final String quistion;
  final int indexaction;
  final int total_quistions;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 100),
      margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
      alignment: Alignment.center,
      child: Text(
        "$quistion",
        style: TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w800),
      ),
    );
  }
}
