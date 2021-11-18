import 'package:flutter/material.dart';
import 'package:game_mini/bloc/play_game_bloc.dart';
import 'package:game_mini/models/play_game_model.dart';
import 'package:game_mini/models/question_list_model.dart';

class PlayGameScreen extends StatefulWidget {
  const PlayGameScreen({Key? key, int? id}) : super(key: key);

  @override
  _PlayGameScreenState createState() => _PlayGameScreenState();
}

class _PlayGameScreenState extends State<PlayGameScreen> {
  PlayGameBloc bloc = PlayGameBloc();

  @override
  void initState() {
    bloc.getPlayGame();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<List<PlayGameModel>>(
          stream: bloc.listQuestion.stream,
          initialData: bloc.list,
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Text(
                    "${snapshot.data![index].answerOne}",
                  );
                }
              // return _buildQuestion(
              //   snapshot.data![index],
              // );
              //           },
            );
          }),
    );
  }
}
