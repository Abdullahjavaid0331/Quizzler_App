import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quizz/model/question_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizUi extends StatefulWidget {
  const QuizUi({Key? key}) : super(key: key);

  @override
  State<QuizUi> createState() => _QuizUiState();
}

class _QuizUiState extends State<QuizUi> {
  QuestionBrain questionBrain = QuestionBrain();
  int score = 0;

  List<Icon> scores = [];

  // void checkAnswer(bool answerTrue, context) {
  //   // if (questionBrain.getquestionlist() <=
  //   //     questionBrain.getQuestionBank() - 1) {
  //   //   final String gameEnd = questionBrain.questionEnd();
  //   //   Alert(
  //   //     context: context,
  //   //     type: AlertType.error,
  //   //     title: "RFLUTTER ALERT",
  //   //     desc: "Flutter is more awesome with RFlutter Alert.",
  //   //     buttons: [
  //   //       DialogButton(
  //   //         child: Text(
  //   //           "$gameEnd",
  //   //           style: const TextStyle(color: Colors.white, fontSize: 20),
  //   //         ),
  //   //         onPressed: () => Navigator.pop(context),
  //   //         width: 120,
  //   //       )
  //   //     ],
  //   //   ).show();
  //   //   scores.clear();
  //   // } else {
  //   bool correctAnswer = questionBrain.getQuestionAnswer();
  //   setState(() {
  //     if (score == questionBrain.getLength()) {
  //       Alert(context: context, title: "Quizzler", desc: "Game is Finished.")
  //           .show();
  //
  //       score = 0;
  //       questionBrain.reset();
  //       scores = [];
  //     }
  //
  //     if (correctAnswer == answerTrue) {
  //       scores.add(const Icon(Icons.check, color: Colors.green));
  //     } else {
  //       scores.add(const Icon(Icons.close, color: Colors.red));
  //     }
  //     questionBrain.nextQuestion();
  //   });
  // }
  // // }
  //
  // // final List<String> questions = [
  // //   'you cn lead a cow down stairs but not up stairs.',
  // //   'Approximately one quarter of human bones are in the feet.',
  // //   'A slug\'s blood is green'
  // // ];
  // // final List<bool> answer=[
  // //   true,false,true
  // // ];
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = questionBrain.getQuestionAnswer();

    setState(() {
      if (questionBrain.checkFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        questionBrain.reset();

        scores = [];
      }

      //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
      else {
        if (userPickedAnswer == correctAnswer) {
          scores.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scores.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        questionBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Center(
            child: Text(
              questionBrain.getQuestionText(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 1.5,
                  decorationStyle: TextDecorationStyle.solid),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          height: 80,
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              score++;
              checkAnswer(true);
            },
            child: const Text(
              "True",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: double.infinity,
          height: 80,
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              score++;
              checkAnswer(false);
            },
            child: const Text(
              "False",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
        Row(
          children: scores,
        )
      ],
    );
  }
}
