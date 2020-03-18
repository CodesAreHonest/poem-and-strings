import 'dart:convert';

import 'package:poem_and_strings/data/StageLevel.dart';
import 'package:poem_and_strings/models/easy_stage/easy_stage_record.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Player {
  Future<SharedPreferences> localStorage;

  Player() {
    localStorage = SharedPreferences.getInstance();
  }

  /// When the game has won, update the easy stage progress of player.
  /// 1. verify whether previous progress is found
  ///    1.1 previous progress not found, set new progress
  ///    1.2 previous progress found, update stage progress
  void setEasyStageProgress(String stage, int rating) async {
    EasyStageRecord easyStageRecord;
    final SharedPreferences _localStorage = await localStorage;
    Map<String, int> playerStageRecord = await getEasyStageProgress();

    easyStageRecord = EasyStageRecord(easyStage: playerStageRecord);
    easyStageRecord.setEasyStageRecord(stage, rating);
    _localStorage.setString('easyStage', easyStageRecord.toString());
  }

  /// Obtain current player easy stage progress
  /// 1. User are new to the game, provides empty map.
  /// 2. User has previous record, fetch records from shared_preferences.
  Future<Map<String, int>> getEasyStageProgress() async {
    final SharedPreferences _localStorage = await localStorage;
    String easyStageRecord = _localStorage.getString('easyStage');

    if (easyStageRecord == null) {
      Map<String, int> newMap = Map();
      return newMap;
    }

    return new Map<String, int>.from(jsonDecode(easyStageRecord));
  }

  void removeEasyStageProgress() async {
    final SharedPreferences _localStorage = await localStorage;
    _localStorage.remove('easyStage');
  }

  /// Increment player coin based on type of steps completed.
  incrementCoin(int coin) {
//    this.coin = this.coin + coin;
  }

  /// Decrement player coin with the following conditions.
  /// 1. Use tips.
  decrementCoin(int coin) {
//    this.coin = this.coin - coin;
  }
}
