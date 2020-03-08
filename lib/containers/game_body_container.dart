import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:poem_and_strings/actions/stage_actions.dart';
import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/models/models.dart';
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
    StoreProvider.of<AppState>(context).dispatch(GetStageDataAction(Stage()));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (BuildContext context, _ViewModel vm) {
        return GameBody(
            stageData: vm.stageData,
            numOfRow: vm.numOfRow,
            itemPerRow: vm.itemPerRow,
            onUpdateCharacter: vm.onUpdateCharacter,
            onSwapCharacter: vm.onSwapCharacter);
      },
      converter: (store) => _ViewModel.from(store),
    );
  }
}

class _ViewModel {
  final List<Character> stageData;
  final int numOfRow;
  final double itemPerRow;
  final Function(Character) onUpdateCharacter;
  final Function(List<Character>, Character, Character) onSwapCharacter;

  _ViewModel(
      {@required this.stageData,
      @required this.numOfRow,
      @required this.itemPerRow,
      @required this.onUpdateCharacter,
      @required this.onSwapCharacter});

  factory _ViewModel.from(Store<AppState> store) {
    return _ViewModel(
        stageData: store.state.stageState.data,
        numOfRow: store.state.stageState.numOfRow,
        itemPerRow: store.state.stageState.itemPerRow,
        onUpdateCharacter: (character) {
          store.dispatch(UpdateCharacterAction(character));
        },
        onSwapCharacter: (data, previousCharacter, currentCharacter) {
          store.dispatch(
              SwapCharacterAction(data, previousCharacter, currentCharacter));
        });
  }
}
