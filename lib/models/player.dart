import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

class Player {
  Future<SharedPreferences> localStorage = SharedPreferences.getInstance();

  void setEasyStageProgress(int level, int rating) {
    PlayerStageRecord stageRecord = new PlayerStageRecord(rating: 1);

    final Map<int, PlayerStageRecord> newRecord = {};
    newRecord[rating] = stageRecord;
    StageRecords easyStageRecords = new StageRecords(collection: newRecord);

    PlayerStage playerStage = new PlayerStage();
    playerStage.setEasyStageRecord(easyStageRecords.collection);
  }

  void getEasyStageProgress() {
    PlayerStage playerStage = new PlayerStage();
    playerStage.getEasyStage();
  }

  /// Increment player coin based on type of steps completed.
  Future<int> getCoinBalance() async {
    final SharedPreferences _localStorage = await localStorage;
    int? coinBalance = _localStorage.getInt('coinBalance');
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

@JsonSerializable()
class PlayerStageRecord {
  final int rating;

  PlayerStageRecord({this.rating = 0});

  factory PlayerStageRecord.fromJson(Map<String, dynamic> json) =>
      _$PlayerStageRecordFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerStageRecordToJson(this);
}

class StageRecords {
  Map<num, PlayerStageRecord> collection;

  StageRecords({required this.collection});

  void setRecords(num stageNumber, PlayerStageRecord records) {
    this.collection[stageNumber] = records;
  }
}

class PlayerStage {
  Future<SharedPreferences> localStorage = SharedPreferences.getInstance();

  Future<String> getEasyStage() async {
    final SharedPreferences _localStorage = await localStorage;
    String? stageContent = _localStorage.getString('stage');

    if (stageContent == null) {
      return '';
    }

    return stageContent;
  }

  void setEasyStageRecord(Map<num, PlayerStageRecord> stageRecords) async {
    final SharedPreferences _localStorage = await localStorage;
    final Map<String, Map<num, PlayerStageRecord>> easyStageRecords = {
      "easy": stageRecords
    };

    String encodedStageRecord = json.encode(easyStageRecords);
    _localStorage.setString("stage", encodedStageRecord);
  }

  void setHardStageRecord(StageRecords stageRecords) async {
    final SharedPreferences _localStorage = await localStorage;
    final Map<String, StageRecords> difficultStageRecord = {
      "hard": stageRecords
    };

    String encodedStageRecord = json.encode(difficultStageRecord);
    _localStorage.setString("stage", encodedStageRecord);
  }
}
