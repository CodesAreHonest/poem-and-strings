import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:poem_and_strings/actions/stage_actions.dart';
import 'package:poem_and_strings/core/ArcKeys.dart';
import 'package:poem_and_strings/models/app_state.dart';
import 'package:poem_and_strings/models/models.dart';
import 'package:poem_and_strings/presentations/game/game_body.dart';
import 'package:poem_and_strings/presentations/game/game_footer.dart';
import 'package:poem_and_strings/presentations/game/game_header.dart';
import 'package:poem_and_strings/presentations/game/game_translation.dart';
import 'package:poem_and_strings/selectors/stage_selectors.dart';
import 'package:redux/redux.dart';

class GameContainer extends StatefulWidget {
  final dynamic stage;

  GameContainer({this.stage});

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<GameContainer> {
  void didChangeDependencies() {
    StoreProvider.of<AppState>(context)
        .dispatch(GetStageDataAction(widget.stage));

    super.didChangeDependencies();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel.from(store, widget.stage),
        builder: (BuildContext context, _ViewModel vm) {
          return Scaffold(
              body: SafeArea(
                  child: Container(
                      child: Column(
            children: <Widget>[
              GameHeader(step: vm.step, stageCount: widget.stage.stageCount),
              GameTranslation(translation: widget.stage.translation),
              GameBody(
                  key: ArcKeys.easyStageBody(widget.stage.stageCount),
                  stageData: vm.stageData,
                  numOfRow: vm.numOfRow,
                  itemPerRow: vm.itemPerRow,
                  onUpdateCharacter: vm.onUpdateCharacter,
                  isStageCompleted: vm.isStageCompleted,
                  onSwapCharacter: vm.onSwapCharacter),
              GameFooter(
                onRefreshStage: vm.onRefreshStage,
              )
            ],
          ))));
        });
  }
}

class _ViewModel {
  final List<Character> stageData;
  final int numOfRow;
  final int step;
  final double itemPerRow;
  final Function(Character) onUpdateCharacter;
  final bool isStageCompleted;
  final Function(List<Character>, Character, Character) onSwapCharacter;
  final Function onRefreshStage;

  _ViewModel(
      {@required this.stageData,
      @required this.numOfRow,
      @required this.step,
      @required this.itemPerRow,
      @required this.isStageCompleted,
      @required this.onUpdateCharacter,
      @required this.onSwapCharacter,
      @required this.onRefreshStage});

  factory _ViewModel.from(Store<AppState> store, dynamic currentStage) {
    return _ViewModel(
        stageData: store.state.stageState.data,
        step: store.state.stageState.step,
        numOfRow: store.state.stageState.numOfRow,
        itemPerRow: store.state.stageState.itemPerRow,
        isStageCompleted: isStageCompletedSelector(store.state.stageState.data),
        onUpdateCharacter: (character) {
          store.dispatch(UpdateCharacterAction(character));
        },
        onSwapCharacter: (data, previousCharacter, currentCharacter) {
          store.dispatch(
              SwapCharacterAction(data, previousCharacter, currentCharacter));
        },
        onRefreshStage: () {
          store.dispatch(ResetStageDataAction(currentStage));
        });
  }
}
