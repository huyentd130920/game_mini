import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';

class GamePlay extends StatefulWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  _GamePlayState createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> {

  List<SwipeItem> _swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<String> _names = ["Red", "Blue", "Green", "Yellow", "Orange"];
  @override
  void initState() {
    for(int i = 0; i< _names.length ;i++){
      _swipeItems.add(SwipeItem());
      likeAction: () {
        _scaffoldKey.currentState!.showSnackBar(SnackBar(
          content: Text("Liked ${_names[i]}"),
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
      body: Container(
          child: Column(
        children: [
          Container(
            height: 550,
            child: SwipeCards(
              matchEngine: _matchEngine,
              onStackFinished: () {
                _scaffoldKey.currentState!.showSnackBar(SnackBar(
                  content: Text("Stack Finished"),
                  duration: Duration(milliseconds: 500),
                ));
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.red,
                  child: Text("hello"),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){
                _matchEngine.currentItem?.nope();
              }, child: Text("Nope")),
              ElevatedButton(onPressed: (){
                _matchEngine.currentItem?.like();
              }, child: Text("Like")),
            ],
          )
        ],
      )),
    );
  }
}
