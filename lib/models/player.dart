import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Player {
  Future<SharedPreferences> localStorage;

  Player() {
    localStorage = SharedPreferences.getInstance();
  }

  void setEasyStageProgress(int level, int rating) {
    PlayerStageRecord stageRecord = new PlayerStageRecord(rating: 1);

    final Map<int, PlayerStageRecord> newRecord = {};
    newRecord[rating] = stageRecord;
    EasyStageRecords easyStageRecords =
        new EasyStageRecords(stageRecords: newRecord);
    print(easyStageRecords.stageRecords);
  }

  /// Increment player coin based on type of steps completed.
  Future<int> getCoinBalance() async {
    final SharedPreferences _localStorage = await localStorage;
    int coinBalance = _localStorage.getInt('coinBalance');
    return coinBalance ?? 2;
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

class PlayerStageRecord {
  final int rating;

  PlayerStageRecord({this.rating = 0});
}

class EasyStageRecords {
  Map<num, PlayerStageRecord> stageRecords;

  EasyStageRecords({@required this.stageRecords});

  void setRecords(num stageNumber, PlayerStageRecord records) {
    this.stageRecords[stageNumber] = records;
  }
}
