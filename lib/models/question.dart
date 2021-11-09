// enum Type {
//   multiple,
//   boolean
// }
//
// enum Difficulty {
//   easy,
//   medium,
//   hard
// }
//
// class Question {
//   //  int questionId;
//    String category;
//    Type type;
//    Difficulty difficulty;
//    String question;
//    String correctAnswer;
//    List<dynamic> answers;
//   //  int categoryId;
//   //  String name;
//   Question({required this.difficulty, required this.category, required this.type, required this.question, required this.correctAnswer, required this.answers});
//
//   Question.fromMap(Map<String, dynamic> data):
//       // questionId = data["id"],
//     category = data["category"],
//     type = data["type"] == "multiple" ? Type.multiple : Type.boolean,
//     difficulty = data["difficulty"] == "easy" ? Difficulty.easy : data["difficulty"] == "medium" ? Difficulty.medium : Difficulty.hard,
//     question = data["question"],
//     correctAnswer = data["correct_answer"],
//     // question = data["question"],
//     answers = data["answers"];
//
//   static List<Question> fromData(List<Map<String,dynamic>> data){
//     return data.map((question) => Question.fromMap(question)).toList();
//   }
//
// }