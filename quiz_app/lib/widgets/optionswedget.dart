import 'package:flutter/material.dart';

class optins_wedget extends StatelessWidget {
  const optins_wedget({
    super.key,
    required this.options,
    this.color,
  });
  final String options;
  final color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      //  shape: CircleBorder(eccentricity: BorderSide.),
      child: ListTile(
        title: Center(
          child: Text(
            "$options",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
