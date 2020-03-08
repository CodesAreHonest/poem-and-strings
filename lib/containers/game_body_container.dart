import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:poem_and_strings/actions/actions.dart';
import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/presentations/game_body.dart';
import 'package:redux/redux.dart';
import 'package:poem_and_strings/models/app_state.dart';
import "package:flutter/foundation.dart";

class GameBodyContainer extends StatefulWidget {
  @override
  GameBodyState createState() => GameBodyState();
}

class GameBodyState extends State<GameBodyContainer> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    StoreProvider.of<AppState>(context)
        .dispatch(GetStageDataAction('easyFirstStage'));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (BuildContext context, _ViewModel vm) {
        return GameBody(stageData: vm.stageData);
      },
      converter: (store) => _ViewModel.from(store),
    );
  }
}

class _ViewModel {
  final List<Character> stageData;

  _ViewModel({@required this.stageData});

  factory _ViewModel.from(Store<AppState> store) {
    return _ViewModel(stageData: store.state.stageData);
  }
}
