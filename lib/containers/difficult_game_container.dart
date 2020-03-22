import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:poem_and_strings/actions/stage_actions.dart';
import 'package:poem_and_strings/data/ArcKeys.dart';
import 'package:poem_and_strings/models/app_state.dart';
import 'package:poem_and_strings/models/models.dart';
import 'package:poem_and_strings/presentations/game/game_body.dart';
import 'package:poem_and_strings/presentations/game/game_footer.dart';
import 'package:poem_and_strings/presentations/game/game_header.dart';
import 'package:poem_and_strings/presentations/game/game_translation.dart';
import 'package:poem_and_strings/selectors/stage_selectors.dart';
import 'package:redux/redux.dart';

class DifficultGameContainer extends StatefulWidget {
  final dynamic stage;

  DifficultGameContainer({this.stage});

  @override
  _DifficultGameContainerState createState() => _DifficultGameContainerState();
}

class _DifficultGameContainerState extends State<DifficultGameContainer> {
  @override
  void initState() {
    super.initState();
  }

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
          return WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
                body: SafeArea(
                    child: Container(
                        child: Column(
              children: <Widget>[
                GameHeader(
                    step: vm.step,
                    stageCount: widget.stage.stageCount,
                    enableDescription: vm.enableDescription),
                SizedBox(height: 18.0),
                GameTranslation(
                    translation: widget.stage.translation,
                    enableDescription: vm.enableDescription),
                SizedBox(height: 18.0),
                GameBody(
                    key: ArcKeys.difficultStageBody(widget.stage.stageCount),
                    originalText: widget.stage.originalText,
                    translation: widget.stage.translation,
                    stageData: vm.stageData,
                    numOfRow: vm.numOfRow,
                    itemPerRow: vm.itemPerRow,
                    onUpdateCharacter: vm.onUpdateCharacter,
                    isStageCompleted: vm.isStageCompleted,
                    onSwapCharacter: vm.onSwapCharacter,
                    onRefreshStage: vm.onRefreshStage,
                    onResetStage: vm.onResetStage,
                    step: vm.step,
                    youtubeLink: widget.stage.youtubeLink,
                    background: widget.stage.background,
                    maximumSteps: widget.stage.maximumSteps,
                    stageCount: widget.stage.stageCount,
                    isStageIncompleted: isStageIncompletedSelector(
                        vm.step, widget.stage.maximumSteps)),
                SizedBox(height: 32.0),
                GameFooter(
                    onRefreshStage: vm.onRefreshStage,
                    onEnableDescription: vm.onEnableDescription,
                    enableDescription: vm.enableDescription)
              ],
            )))),
          );
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
  final Function onResetStage;
  final Function onEnableDescription;
  final bool enableDescription;

  _ViewModel(
      {@required this.stageData,
      @required this.numOfRow,
      @required this.step,
      @required this.itemPerRow,
      @required this.isStageCompleted,
      @required this.onUpdateCharacter,
      @required this.onSwapCharacter,
      @required this.onRefreshStage,
      @required this.onResetStage,
      @required this.onEnableDescription,
      @required this.enableDescription});

  factory _ViewModel.from(Store<AppState> store, dynamic currentStage) {
    return _ViewModel(
        stageData: store.state.stageState.data,
        step: store.state.stageState.step,
        numOfRow: store.state.stageState.numOfRow,
        itemPerRow: store.state.stageState.itemPerRow,
        isStageCompleted: isStageCompletedSelector(store.state.stageState.data),
        enableDescription: store.state.stageState.enableDescription,
        onUpdateCharacter: (character) {
          store.dispatch(UpdateCharacterAction(character));
        },
        onSwapCharacter: (data, previousCharacter, currentCharacter) {
          store.dispatch(
              SwapCharacterAction(data, previousCharacter, currentCharacter));
        },
        onRefreshStage: () {
          store.dispatch(ResetStageDataAction(currentStage));
        },
        onResetStage: () {
          store.dispatch(ResetStageAction(currentStage));
        },
        onEnableDescription: () {
          store.dispatch(EnableDescriptionAction());
        });
  }
}
