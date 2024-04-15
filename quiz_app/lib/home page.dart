import 'package:flutter/material.dart';
import 'package:quiz_app/constant.dart';
import 'package:quiz_app/models/quistion%20model.dart';
import 'package:quiz_app/resultScreen.dart';

//import 'package:quiz_app/resultScreen.dart';
import 'package:quiz_app/widgets/optionswedget.dart';
import 'package:quiz_app/widgets/question%20wedget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Quistion> _quistionslist = [
    Quistion(
        id: '1',
        options: {'25': false, '14': false, '5': false, '23': true},
        title: "كم هي المدَّة التي استغرقها نزول القرآن الكريم ؟"),
    Quistion(
        id: '2',
        options: {
          'التوبه': true,
          'الفاتحه': false,
          'الرعد': false,
          'النساء': false
        },
        title: "ما هي السُّورة القرآنيَّة التي تخلو من البسملة في بدايتها؟"),
    Quistion(
        id: '3',
        options: {'115': false, '114': true, '200': false, '250': false},
        title: "كم عدد سور القرآن الكريم؟"),
    Quistion(
        id: '4',
        options: {
          'بلال بن رباح': true,
          'عثمان بن عفان': false,
          'عمر بن الخطاب': false,
          'زيد بن حارثه': false
        },
        title: "من هو مؤذِّن رسول الله -صلّى الله عليه وسلّم ؟"),
    Quistion(
        id: '5',
        options: {
          'في السَّنة الثالثه للهجرة': false,
          'في السَّنة الثَّانية  للهجرة': true,
          'في السَّنة الرابعه للهجرة': false,
          'في السَّنة الخامسه للهجرة': false
        },
        title: "متى فرض الصِّيام على المسلمين ؟"),
  ];
  bool isalreadyselected = false;
  int index = 0; //to loop throw quistions
  bool ispressed = false;
  int score = 0;
  void checkanswer(bool value) {
    if (isalreadyselected == true) {
      return;
    }
    //increase the score
    if (value == true) score++;
    setState(() {
      ispressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                margin: EdgeInsets.all(60),
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  "Quiz App",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(198, 43, 89, 197)),
                )),
            ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                leading: Icon(Icons.question_answer),
                iconColor: Color.fromARGB(255, 0, 0, 0),
                title: const Text(
                  'Questions Page',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                )),
            ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => resultScreen()));
                },
                leading: Icon(Icons.score_sharp),
                iconColor: Color.fromARGB(255, 0, 0, 0),
                title: const Text(
                  'Score Page',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ))
          ],
        ),
      ),
      backgroundColor: bgcolor,
      appBar: AppBar(
        title: Text(
          "Quiz App",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
        toolbarHeight: 80,
        backgroundColor: bgcolor,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "question ${_quistionslist[index].id} / ${_quistionslist.length}",
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 2, 5, 159),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "score=$score",
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 2, 5, 159),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                questions_wedget(
                    quistion: _quistionslist[index].title,
                    indexaction: index,
                    total_quistions: _quistionslist.length),

                Divider(
                  color: natural,
                ),
                SizedBox(
                  height: 20,
                ),

                ///add options
                for (int i = 0; i < _quistionslist[index].options.length; i++)
                  GestureDetector(
                    onTap: () => checkanswer(
                        _quistionslist[index].options.values.toList()[i]),
                    child: optins_wedget(
                      options: _quistionslist[index].options.keys.toList()[i],
                      color: ispressed
                          ? _quistionslist[index].options.values.toList()[i] ==
                                  true
                              ? correct
                              : incorrect
                          : natural,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: button(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget MYSCORE() {
    return Container(
      height: 40,
      width: 115,
      child: FloatingActionButton(
        shape: BeveledRectangleBorder(
            side: BorderSide(
          color: Colors.black12,
          width: 2,
        )),
        onPressed: () {
          setState(() {});
        },
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(
                Icons.score,
                size: 30,
              ),
              Text(
                "My Score",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget MyQuestions() {
    return Container(
      height: 40,
      width: 115,
      child: FloatingActionButton(
        shape: BeveledRectangleBorder(
            side: BorderSide(
          color: Colors.black12,
          width: 2,
        )),
        onPressed: () {
          setState(() {});
        },
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(
                Icons.question_answer,
                size: 30,
              ),
              Text(
                "My Questions",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget button() {
    return GestureDetector(
      onTap: () {
        if (index == _quistionslist.length - 1) {
          //SHOW THE RESULT AT FINAL
          showDialog(
              context: context,
              builder: (ctx) => resultScreen(
                    result: 0 + score,
                    total: _quistionslist.length,
                  ));
          return;
        } else {
          if (ispressed == true) {
            setState(() {
              index++;

              ispressed = false;
            });
          }
          //to prevent skip the question with out answer it\\
          else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                "        Please Solve the Question",
                style: TextStyle(fontSize: 20),
              )),
            );
          }
        }
      },
      child: Container(
        width: 400,
        decoration: BoxDecoration(
            color: natural, borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Text(
          "                         Next Question",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
