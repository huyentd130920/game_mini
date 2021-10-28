import 'dart:io';
import 'package:flutter/material.dart';
import '/models/category.dart';
import '/models/question.dart';
import '/resources/api_provider.dart';
import '/ui/pages/error.dart';
import '/ui/pages/quiz_page.dart';

class QuizOptionsDialog extends StatefulWidget {
  final Category category;

  const QuizOptionsDialog({Key? key, required this.category}) : super(key: key);

  @override
  _QuizOptionsDialogState createState() => _QuizOptionsDialogState();
}

class _QuizOptionsDialogState extends State<QuizOptionsDialog> {
  late int _noOfQuestions;
  late String _difficulty;
  late bool processing;

  @override
  void initState() {
    super.initState();
    _noOfQuestions = 10;
    _difficulty = "easy";
    processing = false;
  }

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(  // xóa mẹ cái màn loading luôn // tích cái vào màn chơi luôn ko cần băt đầu
      child: Container(
        height: 100,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey.shade200,
              child: Text(widget.category.name, style: Theme.of(context).textTheme.headline6.copyWith(),),
            ),
            const SizedBox(height: 20.0),
            processing ? const CircularProgressIndicator() : RaisedButton(
              child: const Text("Bắt đầu"),
              onPressed: _startQuiz,
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
  _selectNumberOfQuestions(int i) {
    setState(() {
      _noOfQuestions = i;
    });
  }
  _selectDifficulty(String s) {
    setState(() {
      _difficulty=s;
    });
  }
  void _startQuiz() async {
    setState(() {
      processing=true;
    });
    try {
      List<Question> questions =  await getQuestions(widget.category, _noOfQuestions, _difficulty);
      Navigator.pop(context);
      if(questions.length < 1) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => const ErrorPage(message: "There are not enough questions in the category, with the options you selected.",)
        ));
        return;
      }
      Navigator.push(context, MaterialPageRoute(
          builder: (_) => QuizPage(questions: questions, category: widget.category,)
      ));
    }on SocketException catch (_) {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (_) => const ErrorPage(message: "Can't reach the servers, \n Please check your internet connection.",)
      ));
    } catch(e){
      print(e.message);
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (_) => const ErrorPage(message: "Unexpected error trying to connect to the API",)
      ));
    }
    setState(() {
      processing=false;
    });
  }
}