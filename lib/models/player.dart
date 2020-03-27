import 'dart:convert';

import 'package:poem_and_strings/data/StageLevel.dart';
import 'package:poem_and_strings/models/difficult_stage/difficult_stage_record.dart';
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

  /// When the game has won, update the difficult stage progress of player.
  /// 1. verify whether previous progress is found
  ///    1.1 previous progress not found, set new progress
  ///    1.2 previous progress found, update stage progress
  void setDifficultStageProgress(String stage, int rating) async {
    DifficultStageRecord difficultStageRecord;
    final SharedPreferences _localStorage = await localStorage;
    Map<String, int> playerStageRecord = await getEasyStageProgress();

    difficultStageRecord =
        DifficultStageRecord(difficultStage: playerStageRecord);
    difficultStageRecord.setDifficultStageRecord(stage, rating);
    _localStorage.setString('easyStage', difficultStageRecord.toString());
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

  /// Obtain current player difficult stage progress
  /// 1. User are new to the game, provides empty map.
  /// 2. User has previous record, fetch records from shared_preferences.
  Future<Map<String, int>> getDifficultStageProgress() async {
    final SharedPreferences _localStorage = await localStorage;
    String difficultStageRecord = _localStorage.getString('difficultStage');

    if (difficultStageRecord == null) {
      Map<String, int> newMap = Map();
      return newMap;
    }

    return new Map<String, int>.from(jsonDecode(difficultStageRecord));
  }

  void removeEasyStageProgress() async {
    final SharedPreferences _localStorage = await localStorage;
    _localStorage.remove('easyStage');
    _localStorage.remove('difficultStage');
  }

  /// Obtain current player easy stage completed count
  Future<int> getEasyStageCompletedCount() async {
    Map<String, int> playerStageRecord = await getEasyStageProgress();
    return playerStageRecord.length;
  }

  /// Obtain current player difficult stage completed count
  Future<int> getDifficultStageCompletedCount() async {
    Map<String, int> playerStageRecord = await getDifficultStageProgress();
    return playerStageRecord.length;
  }

  /// Obtain player total completed stage count.
  Future<int> getTotalCompletedStageCount() async {
    int easyStageCompletedCount = await getEasyStageCompletedCount();
    int difficultCompletedCount = await getDifficultStageCompletedCount();

    int completedCount = easyStageCompletedCount + difficultCompletedCount;
    return completedCount;
  }

  /// Increment player coin based on type of steps completed.
  Future<int> getCoinBalance() async {
    final SharedPreferences _localStorage = await localStorage;
    int coinBalance = _localStorage.getInt('coinBalance');
    return coinBalance < 0 ? 2 : coinBalance;
  }

  /// Increment player coin based on type of steps completed.
  void incrementCoin(int coin) async {
    final SharedPreferences _localStorage = await localStorage;

    int coinBalance = await getCoinBalance();
    int addedBalance = coinBalance + coin;
    _localStorage.setInt('coinBalance', addedBalance);
  }

  /// Increment player coin based on type of steps completed.
  void decrementCoin(int coin) async {
    final SharedPreferences _localStorage = await localStorage;

    int coinBalance = await getCoinBalance();
    int addedBalance = coinBalance - coin;
    _localStorage.setInt('coinBalance', addedBalance);
  }
}
