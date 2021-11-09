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
  Category(2, "Test", 10, 30, ""),
  Category(3, "Test", 10, 30, ""),
  Category(4, "Decrebing People", 12, 20, ""),
  Category(13, "Test", 10, 30, ""),
  Category(13, "Test", 10, 30, ""),
  Category(12, "Decrebing People", 12, 20, ""),
  Category(13, "Test", 10, 30, ""),
  Category(13, "Test", 10, 30, ""),
  Category(12, "Decrebing People", 12, 20, ""),
  Category(13, "Test", 10, 30, ""),
  Category(13, "Test", 10, 30, ""),

  // Category(14,"Television", icon: FontAwesomeIcons.tv),
  // Category(15,"Video Games", icon: FontAwesomeIcons.gamepad),
  // Category(16,"Board Games", icon: FontAwesomeIcons.chessBoard),
  // Category(17,"Science & Nature", icon: FontAwesomeIcons.microscope),
  // Category(18,"Computer", icon: FontAwesomeIcons.laptopCode),
  // Category(19,"Maths", icon: FontAwesomeIcons.sortNumericDown),
  // Category(20,"Mythology"),
  // Category(21,"Sports", icon: FontAwesomeIcons.footballBall),
  // Category(22,"Geography", icon: FontAwesomeIcons.mountain),
  // Category(23,"History", icon: FontAwesomeIcons.monument),
  // Category(24,"Politics"),
  // Category(25,"Art", icon: FontAwesomeIcons.paintBrush),
  // Category(26,"Celebrities"),
  // Category(27,"Animals", icon: FontAwesomeIcons.dog),
  // Category(28,"Vehicles", icon: FontAwesomeIcons.carAlt),
  // Category(29,"Comics"),
  // Category(30,"Gadgets", icon: FontAwesomeIcons.mobileAlt),
  // Category(31,"Japanese Anime & Manga"),
  // Category(32,"Cartoon & Animation"),
];
