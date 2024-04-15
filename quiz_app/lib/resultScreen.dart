import 'package:flutter/material.dart';
import 'package:quiz_app/constant.dart';

class resultScreen extends StatelessWidget {
  const resultScreen({super.key, this.result, this.total});
  final result;
  final total;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz Score",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
        toolbarHeight: 100,
        backgroundColor: bgcolor,
        shadowColor: Colors.white,
      ),
      body: show(),
    );
  }

  Widget show() {
    return AlertDialog(
      content: Padding(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Result = ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              child: Text(
                '$result/$total',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              radius: 70,
              backgroundColor: result == total
                  ? correct
                  : result < total / 2
                      ? incorrect
                      : result > total / 2 && result != total
                          ? Colors.yellow
                          : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
