import 'package:flutter/material.dart';
import 'package:game_mini/data/app_color.dart';
import 'package:game_mini/models/category.dart';

class QuestionPage extends StatefulWidget {
  final List<Question> list;

  const QuestionPage({Key? key, required this.list}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Answers> listAS = [];
  int selectedIndex = 0;
  int selectEployess = 0;

  @override
  void initState() {
    // categories.forEach((element) {
    //  widget.list == element.question;
    //  print(widget.list);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.list.length);
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: ListView.builder(
              itemCount: widget.list.length,
              itemBuilder: (context, index) {
                return _buildQuestion(
                  widget.list,
                  index,
                  callback: () {
                    listAS.forEach((element) {
                      _checkAns(element.type!);
                    });
                  },
                );
              }),
        ));
  }

  _checkAns(int type) {
    switch (type) {
      case 1:
        print("đúng");
        break;
      case 2:
        print("sai");
        break;
    }
  }

  Widget _buildQuestion(List<Question> question, int index,
      {required VoidCallback callback}) {
    int? typeQ = 0;
    int? id = 0;
    question.forEach((element) {
      // id = element.answers;
      listAS = element.answers!;
      typeQ = element.type;
    });
    int? typeA = 0;
    // listAS.forEach((element) {
    //   typeA = element.type;
    // });
    return Container(
      child: Column(
        children: [
          Text(question[index].nameQuestion!),
          Container(
            height: 60,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listAS.length,
                itemBuilder: (context, indexa) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = indexa;
                      });
                    },
                    child: Container(
                        width: 100,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color:( id == listAS[index].id
                                ? selectedIndex != index
                                : selectedIndex == indexa)
                                    ? AppColors.red1
                                    : AppColors.white,
                            border: Border.all(color: AppColors.gray4)),
                        child: Center(
                          child: Text(
                            listAS[indexa].nameAnswers!,
                          ),
                        )),
                  );
                }),
          )
        ],
      ),
    );
  }
}
