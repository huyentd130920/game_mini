import 'package:flutter/material.dart';
import 'package:game_mini/bloc/play_game_bloc.dart';
import 'package:game_mini/models/play_game_model.dart';
import 'package:swipe_cards/swipe_cards.dart';

class PlayGameScreen extends StatefulWidget {
  final int id;

  const PlayGameScreen({Key? key, required this.id}) : super(key: key);

  @override
  _PlayGameScreenState createState() => _PlayGameScreenState();
}

class _PlayGameScreenState extends State<PlayGameScreen> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  PlayGameBloc bloc = PlayGameBloc();

  @override
  void initState() {
    bloc.getPlayGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            StreamBuilder<List<PlayGameModel>>(
                stream: bloc.listQuestion.stream,
                initialData: bloc.list,
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Text(
                        "${snapshot.data![index].answerOne}",
                      );
                    },
                  );
                }),
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
                    // child: Text("hello"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
