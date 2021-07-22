import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_list.dart';

QuizList quizList = QuizList();

void main() =>  runApp(QuizApp());

class QuizApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text("Quiz"),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          elevation: 0.0,

        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizArea(),
          ),
        ),
      )
    );
  }
}
class QuizArea extends StatefulWidget {
  const QuizArea({Key? key}) : super(key: key);

  @override
  _QuizAreaState createState() => _QuizAreaState();
}

class _QuizAreaState extends State<QuizArea> {
  int correctAnswers = 0;
  void checkAnswer(bool answer){
    bool correctAnswer = quizList.getAnswer();
      setState(() {
        if(quizList.isFinished() == true){
          quizList.reset();
          correctAnswers = 0;
        }
        else{
          if(answer == correctAnswer){
            correctAnswers += 1;
          }
          quizList.nextQuestion();
        }
      });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizList.getText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: [
            Text(
            "${correctAnswers}/${quizList.questions.length}",
              style: TextStyle(
                color: Colors.white, fontSize: 15.0
              ),
          )
          ],
        )
      ],
    );
  }
}



