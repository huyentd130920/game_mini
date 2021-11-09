// import 'dart:ui';
// import 'package:flutter/material.dart';
// import '/data/app_color.dart';
// import '/data/image.dart';
// import '/models/category.dart';
// import '/models/question.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
// import '/ui/pages/quiz_finished.dart';
// import 'package:html_unescape/html_unescape.dart';
//
//
// class QuizPage extends StatefulWidget {
//   final List<Question> questions;
//   final Category category;
//
//   const QuizPage({Key?key, required this.questions, required this.category})
//       : super(key: key);
//
//   @override
//   _QuizPageState createState() => _QuizPageState();
// }
//
// class _QuizPageState extends State<QuizPage> {
//   final TextStyle _questionStyle = const TextStyle(
//       fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white,);
//
//   int _currentIndex = 0;
//   final Map<int, dynamic> _answers = {};
//   final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
//
//   final _controller  = TextEditingController();
//
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Question question = widget.questions[_currentIndex];
//     var controller;
//     var width;
//     bool _hasBeenPressed = false;
//     return Container(
//       // onWillPop: _onWillPop,
//       child: Scaffold(
//         key: _key,
//         body: Stack(
//           children: <Widget>[
//             ClipPath(
//               clipper: WaveClipperTwo(),
//               child: Container(
//                 decoration:
//                 const BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage("assets/image_background2.png"),
//                       fit: BoxFit.fill),
//                 ),
//               ),
//             ),
//             IconButton(onPressed: _backButton, icon: const Icon(Icons.arrow_back_ios), color: Colors.white,),
//             Padding(
//               padding: const EdgeInsets.all(30.0),
//               // controller: _controller
//               child: Column(
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Image.asset(
//                         Images.image_star_gray,
//                         width: 30,
//                         height: 30,
//                       ),
//                       Image.asset(
//                         Images.image_star_gray,
//                         width: 30,
//                         height: 30,
//                       ),
//                       Image.asset(
//                         Images.image_star_gray,
//                         width: 30,
//                         height: 30,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 30.0),
//                   Container(
//                     margin: const EdgeInsets.all(10.0),
//                     height: 30.0,
//                     child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: List.generate(10, (int index) {
//                       return Card(
//                         // color: Colors.blue[index * 100],
//                         color: Colors.grey[index * 100],
//                         child: const SizedBox(
//                           width: 25.0,
//                           height: 25.0,
//                           // child: new Text("$index"),
//                         ),
//                       );
//                     }),
//                   ),
//                   ),
//
//                   // SizedBox(height: 150),
//                   const SizedBox(height: 40.0),
//                   Center(
//                     child: Image.asset(
//                       Images.image_turtle,
//                       width: 80,
//                       height: 80,
//                     ),
//                   ),
//                   const SizedBox(height: 60.0),
//                   Row(
//                     children: <Widget>[
//                       const SizedBox(width: 16.0),
//                       Expanded(
//                         child: Text(
//                           HtmlUnescape().convert(
//                               widget.questions[_currentIndex].question,
//                           ),
//                           textAlign: TextAlign.center,
//                           softWrap: true,
//                           style: MediaQuery.of(context).size.width > 800
//                               ? _questionStyle.copyWith(fontSize: 20.0)
//                               : _questionStyle,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 120.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         InkWell(
//                           onTap: _nextSubmit,
//                           child: Container(
//                             height: 130,
//                             width: 130,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(100),
//                               border: Border.all(color: AppColors.black),
//                               color: AppColors.white,
//                             ),
//                             child: Center(
//                               child: InkWell(
//                                 child: Text(
//                                   _currentIndex == (widget.questions.length - 1)
//                                       ? "Submit"
//                                       :"${widget.questions[_currentIndex].answers[0]}" ,
//
//                                         /// nhớ đọch cái trang t vừa bật lên :)) để hiểu
//                                         style: const TextStyle(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.w400,
//                                           color: AppColors.black,
//                                         ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                                 onTap: () {
//                                   Navigator.pushNamed(context, "write your route");
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: _nextSubmit,
//                           child: Container(
//                             height: 130,
//                             width: 130,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(100),
//                               border: Border.all(color: AppColors.black),
//                               color: AppColors.white,
//                             ),
//                             child: Center(
//                               child: Text(
//                                 _currentIndex == (widget.questions.length - 1)
//                                     ? "Submit"
//                                     : "${widget.questions[_currentIndex].answers[1]}",
//                                       style: const TextStyle(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.w400,
//                                           color: AppColors.black),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _nextSubmit() {
//     // if (_answers[_currentIndex] == null) {
//     //   _key.currentState.showSnackBar(SnackBar(
//     //     content: Text("You must select an answer to continue."),
//     //   ));
//     //   return;
//     // }
//     if (_currentIndex < (widget.questions.length - 1)) {
//       setState(() {
//         _currentIndex++;
//       });
//     }
//     else {
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//           builder: (_) => QuizFinishedPage(
//               questions: widget.questions, answers: _answers)));
//     }
//   }
//   //
//   // bool _isCorrectAnswer(){
//   //   for(int i=0; i<2; i++){
//   //     if("widget.questions[_currentIndex].answers[i]" == "widget.questions[_currentIndex].correctAnswer"){
//   //       return true;
//   //     }
//   //     else{
//   //       return false;
//   //     }
//   //   }
//   //
//   // }
//
//   void _backButton(){
//     // );
//   }
//
//   //
//   // Color checkColors(String status) {
//   //   if (status == "true") {
//   //     return AppColors.green;
//   //   }
//   //
//   //   if (status == "false") {
//   //     return AppColors.red1;
//   //   }
//   //
//   //   return AppColors.green1;
//   // }
//
//   // void _nextQuestion(){
//   //   Widget build(BuildContext context){
//   //     return Container(
//   //
//   //     );
//   //   }
//   // }
//
//   // Future<bool> _onWillPop() async {
//   //   return showDialog<bool>(
//   //       context: context,
//   //       builder: (_) {
//   //         return AlertDialog(
//   //           content: Text(
//   //               "Bạn có muốn kết thúc bài test? Tất cả các câu trả lời sẽ không được ghi nhận"),
//   //           title: Text("Cảnh báo!"),
//   //           actions: <Widget>[
//   //             FlatButton(
//   //               child: Text("Yes"),
//   //               onPressed: () {
//   //                 Navigator.pop(context, true);
//   //               },
//   //             ),
//   //             FlatButton(
//   //               child: Text("No"),
//   //               onPressed: () {
//   //                 Navigator.pop(context, false);
//   //               },
//   //             ),
//   //           ],
//   //         );
//   //       });
//   // }
// }
