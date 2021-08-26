import 'package:flutter/material.dart';
import 'package:quizz/quiz_ui_screen.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: QuizUi()),
    );
  }
}
