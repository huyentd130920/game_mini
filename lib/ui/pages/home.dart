import 'package:flutter/material.dart';
import 'package:game_mini/models/category.dart';
import 'package:percent_indicator/percent_indicator.dart';

;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool processing;
  late int _noOfQuestions;
  late String _difficulty;
  late Category _category;

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
          itemCount: _category.length,
          itemBuilder: (context, index) {
            _category = categories[index];
            return _buildItemQuestion(categories[index], _startQuiz);
          }),
    );
  }

  Widget _buildItemQuestion(Category category, Function onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 12, right: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue),
                borderRadius: BorderRadius.circular(50),
              ),
              child: category.url == null
                  ? SizedBox()
                  : IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Colors.lightBlue,
                  )),
            ),
            Text(
              category.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Container(
                margin: EdgeInsets.only(left: 20),
                width: 120,
                child: LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 20,
                  restartAnimation: false,
                  percent: category.answers / category.question,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  clipLinearGradient: true,
                  // linearGradient: AppColors.gray7)
                ))
          ],
        ),
      ),
    );
  }

  void _startQuiz(y) async {
    setState(() {
      processing = true;
    });
    try {
      List<Question> questions =
      await getQuestions(_category, _noOfQuestions, _difficulty);
      Navigator.pop(context);
      if (questions.length < 1) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) =>
                ErrorPage(
                  message:
                  "There are not enough questions in the category, with the options you selected.",
                )));
        return;
      }
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  QuizPage(
                    questions: questions,
                    category: _category,
                  )));
    } on SocketException catch (_) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  ErrorPage(
                    message:
                    "Can't reach the servers, \n Please check your internet connection.",
                  )));
    } catch (e) {
      print(e.message);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  ErrorPage(
                    message: "Unexpected error trying to connect to the API",
                  )));
    }
    setState(() {
      processing = false;
    });
  }
}
