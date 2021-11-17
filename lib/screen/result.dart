import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_mini/data/app_color.dart';
import 'package:game_mini/screen/home_screen.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blueAccent,
              padding: EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Bạn đã làm tốt lắm!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(
                    height: 2,
                    color: Colors.white,
                  ),
                  // SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 40,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star_rounded,
                        size: 40,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star_rounded,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      'Bạn trả lời đúng x/10 câu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Báo cáo nội dung',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12, bottom: 16),
                    height: 1,
                    color: Colors.grey,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Take a foto',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '(Take a photo)',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen(title: '')),
                            );
                          },
                          child: Container(
                              margin: EdgeInsets.only(right: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.secondary3),
                                shape: BoxShape.circle,
                              ),
                              child: InkWell(
                                child: Icon(
                                  Icons.play_arrow,
                                  color: AppColors.secondary3,
                                  size: 50,
                                ),
                              ))),
                      GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => PlayGame(data: []),
                            //   ),
                            // );
                          },
                          child: Container(
                              margin: EdgeInsets.only(right: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.secondary3),
                                shape: BoxShape.circle,
                              ),
                              child: InkWell(
                                child: Icon(
                                  Icons.cached,
                                  color: AppColors.secondary3,
                                  size: 50,
                                ),
                              ))),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
