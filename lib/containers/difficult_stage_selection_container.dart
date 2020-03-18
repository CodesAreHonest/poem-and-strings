import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:poem_and_strings/actions/music_actions.dart';
import 'package:poem_and_strings/models/models.dart';
import 'package:poem_and_strings/presentations/difficult_stage_selection/index.dart';
import 'package:redux/redux.dart';

class DifficultStageSelectionContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel.from(store),
        builder: (BuildContext context, _ViewModel vm) {
          return DifficultStageSelection(
              resumeMusic: vm.resumeMusic, pauseMusic: vm.pauseMusic);
        });
  }
}

class _ViewModel {
  final Function resumeMusic;
  final Function pauseMusic;

  _ViewModel({@required this.resumeMusic, @required this.pauseMusic});

  factory _ViewModel.from(Store<AppState> store) {
    return _ViewModel(
      resumeMusic: () => store.dispatch(ResumeMusicAction()),
      pauseMusic: () => store.dispatch(PauseMusicActions()),
    );
  }
}
