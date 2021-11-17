
import 'package:game_mini/bloc/core_stream.dart';
import 'package:game_mini/data/service/play_game_service/play_game_service.dart';
import 'package:game_mini/models/play_game_model.dart';

class PlayGameBloc {
  List<PlayGameModel> list = [];
  late CoreStream<List<PlayGameModel>> listQuestion = CoreStream();

  void getPlayGame() async {
    GetPlayGameImpl service = GetPlayGameImpl();
    service.getPlayGame(onResultData: (resultData) async {
      List<PlayGameModel>? listUSer = [];
      Iterable i = resultData;
      print(i);
      if (i.isNotEmpty) {
        listUSer = i.map((model) => PlayGameModel.fromJson(model))
            .toList();
        list.addAll(listUSer);
        listQuestion.notify(list);
      }
    });
  }
}