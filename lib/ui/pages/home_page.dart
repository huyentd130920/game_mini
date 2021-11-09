import 'dart:io';
import 'package:flutter/material.dart';
import 'package:game_mini/models/category.dart';
import 'package:game_mini/models/question.dart';
import 'package:game_mini/resources/api_provider.dart';
import 'package:game_mini/ui/pages/quiz_page.dart';
import 'package:game_mini/ui/pages/screen_question/question_page.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'error.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool? processing;
  int? _noOfQuestions;
  String? _difficulty;

  @override
  void initState() {
    _noOfQuestions = 10;
    _difficulty = "easy";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return _buildItemQuestion(
              categories[index],
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuestionPage(
                              list: categories[index].question ?? [],
                            )));
              },
            );
          }),
    );
  }

  Widget _buildItemQuestion(Category? category, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 12, right: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue),
                borderRadius: BorderRadius.circular(50),
              ),
              child: category?.url == null
                  ? const SizedBox()
                  : IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_arrow,
                        color: Colors.lightBlue,
                      )),
            ),
            Text(
              category!.name ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Container(
                margin: EdgeInsets.all(15),
                width: 120,
                child: LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 20,
                  restartAnimation: false,
                  percent: category.totalAnswers! / category.totalQuestion!,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  clipLinearGradient: true,
                  // linearGradient: Colors.black26)
                ))
          ],
        ),
      ),
    );
  }

// void  _startQuiz(y) async {
//    setState(() {
//      processing = true;
//    });
//    try {
//      List<Question> questions =
//          await getQuestions(category!, _noOfQuestions!, _difficulty!);
//      Navigator.pop(context);
//      if (questions.isEmpty) {
//        Navigator.of(context).push(MaterialPageRoute(
//            builder: (_) => const ErrorPage(
//                  message:
//                      "There are not enough questions in the category, with the options you selected.",
//                )));
//        return;
//      }
//      Navigator.push(
//          context,
//          MaterialPageRoute(
//              builder: (_) => QuizPage(
//                    questions: questions,
//                    category: category!,
//                  )));
//    } on SocketException catch (_) {
//      Navigator.pushReplacement(
//          context,
//          MaterialPageRoute(
//              builder: (_) => const ErrorPage(
//                    message:
//                        "Can't reach the servers, \n Please check your internet connection.",
//                  )));
//    } catch (e) {
//      var message = 0;
//      // print(e.message);
//      Navigator.pushReplacement(
//          context,
//          MaterialPageRoute(
//              builder: (_) => const ErrorPage(
//                    message: "Unexpected error trying to connect to the API",
//                  )));
//    }
//    setState(() {
//      processing = false;
//    });
//  }
}
