import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_mini/bloc/play_game_bloc.dart';
import 'package:game_mini/models/play_game_model.dart';
import 'package:game_mini/models/question_list_model.dart';
import 'package:swipe_cards/swipe_cards.dart';

class GamePlay extends StatefulWidget {
  const GamePlay({Key? key, int? id}) : super(key: key);

  @override
  _GamePlayState createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> {
  PlayGameBloc bloc = PlayGameBloc();

  List<SwipeItem> _swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<String> _names = ["Red", "Blue", "Green", "Yellow", "Orange"];

  @override
  void initState() {
    bloc.getPlayGame();

    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem());
      likeAction:
      () {
        _scaffoldKey.currentState!.showSnackBar(SnackBar(
          content: Text("Liked ${_names[i]}"),
          // t đọc chưa hieur ^^ xem qua cái
          duration: Duration(milliseconds: 500),
        ));
      };
      _matchEngine = MatchEngine(swipeItems: _swipeItems);
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: StreamBuilder<List<PlayGameModel>>(
            stream: bloc.listQuestion.stream,
            initialData: bloc.list,
            builder: (context, snapshot) {
              return Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: SwipeCards(
                      matchEngine: _matchEngine,
                      onStackFinished: () {
                        _scaffoldKey.currentState!.showSnackBar(SnackBar(
                          content: Text("Stack Finished"),
                          duration: Duration(milliseconds: 500),
                        ));
                      },
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          color: Colors.red,
                          alignment: Alignment.center,
                          child: Text(snapshot.data![index].answerOne ?? ""),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            _matchEngine.currentItem?.nope();
                          },
                          child: Text("Nope")),
                      ElevatedButton(
                          onPressed: () {
                            _matchEngine.currentItem?.like();
                          },
                          child: Text("Like")),
                    ],
                  )
                ],
              );
            })
        // Container(
        //     child: Column(
        //       children: [
        //         Container(
        //           height: 550,
        //           child: SwipeCards(
        //             matchEngine: _matchEngine,
        //             onStackFinished: () {
        //               _scaffoldKey.currentState!.showSnackBar(SnackBar(
        //                 content: Text("Stack Finished"),
        //                 duration: Duration(milliseconds: 500),
        //               ));
        //             },
        //             itemBuilder: (BuildContext context, int index) {
        //               return Container(
        //                 alignment: Alignment.center,
        //                 color: Colors.red,
        //                 child: Text("hello"),
        //               );
        //             },
        //           ),
        //         ),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             ElevatedButton(onPressed: (){
        //               _matchEngine.currentItem?.nope();
        //             }, child: Text("Nope")),
        //             ElevatedButton(onPressed: (){
        //               _matchEngine.currentItem?.like();
        //             }, child: Text("Like")),
        //           ],
        //         )
        //       ],
        //     )),
        );
  }

  Widget _buildQuestion(PlayGameModel? playGameModel) {
    return Container(
      height: 550,
      child: Container(
        child: SwipeCards(
          matchEngine: _matchEngine,
          onStackFinished: () {
            _scaffoldKey.currentState!.showSnackBar(SnackBar(
              content: Text("Stack Finished"),
              duration: Duration(milliseconds: 500),
            ));
          },
          itemBuilder: (BuildContext context, snapshot) {
            return Container(
              alignment: Alignment.center,
              color: Colors.red,
              child: Text(playGameModel?.answerOne ?? ''),
            );
          },
        ),
      ),
    );
  }
}
