import 'package:game_mini/models/question.dart';

class Answers {
  int? id;
  String? nameAnswers;
  int? type;

  Answers(this.id, this.nameAnswers, {this.type});
}

class Question {
  int? id;
  String? nameQuestion;
  List<Answers>? answers;
  String correctAnswer;
  int? type;

  Question(this.id, this.nameQuestion, this.answers, this.correctAnswer,
      {this.type});
}

class Category {
  int? id;
  String? url;
  String? name;
  int? totalQuestion;
  int? totalAnswers;
  List<Question>? question;

  Category(this.id, this.name, this.totalAnswers, this.totalQuestion, this.url,
      {this.question});
}

final List<Category> categories = [
  Category(1, "Decrebing People", 12, 20, "",
      question:[
        Question(
            1,
            "câu hỏi?",
            [
              Answers(1, "đúng", type: 1),
              Answers(2, "sai", type: 2),
              Answers(3, "sai", type: 2)
            ],
            'đúng', type: 1),
        Question(
            2,
            "câu trả lời?",
            [
              Answers(4, "đúng", type: 1),
              Answers(5, "sai", type: 2),
              Answers(6, "sai", type: 2)
            ],
            'đúng', type: 2)
      ]),

];
