import 'dart:ui';

import "package:flutter/material.dart";
import 'package:flutter/painting.dart';
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

class EasyGameContainer extends StatefulWidget {
  final dynamic stage;

  EasyGameContainer({this.stage});

  @override
  _EasyGameState createState() => _EasyGameState();
}

class _EasyGameState extends State<EasyGameContainer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    StoreProvider.of<AppState>(context)
        .dispatch(GetEasyStageDataAction(widget.stage));

    super.didChangeDependencies();
  }

  @override
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
                    child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/background/success_bg.jpg'),
                          fit: BoxFit.fill)),
                  child: Column(
                    children: <Widget>[
                      GameHeader(
                          step: vm.step,
                          stageCount: widget.stage.stageCount,
                          maximumSteps: widget.stage.maximumSteps,
                          enableDescription: vm.enableDescription),
                      GameTranslation(
                          translation: widget.stage.translation,
                          enableDescription: vm.enableDescription),
                      SizedBox(height: 16.0),
                      GameBody(
                          key: ArcKeys.easyStageBody(widget.stage.stageCount),
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
                          maximumSteps: widget.stage.maximumSteps,
                          stageCount: widget.stage.stageCount,
                          isStageIncompleted: isStageIncompletedSelector(
                              vm.step, widget.stage.maximumSteps)),
                      SizedBox(height: 16.0),
                      GameFooter(
                          onRefreshStage: vm.onRefreshStage,
                          onEnableDescription: vm.onEnableDescription,
                          enableDescription: vm.enableDescription)
                    ],
                  )),
            ))),
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
          store.dispatch(SwapEasyCharacterAction(
              data, previousCharacter, currentCharacter));
        },
        onRefreshStage: () {
          store.dispatch(ResetEasyStageDataAction(currentStage));
        },
        onResetStage: () {
          store.dispatch(ResetStageAction(currentStage));
        },
        onEnableDescription: () {
          store.dispatch(EnableDescriptionAction());
        });
  }
}
