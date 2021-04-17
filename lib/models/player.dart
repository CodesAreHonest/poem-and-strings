import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'player.g.dart';

class Player {
  Future<SharedPreferences> localStorage = SharedPreferences.getInstance();

  void setEasyStageProgress(int level, int rating) async {
    StageRecords? easyStageRecords = await getEasyStageProgress();
    PlayerStageRecord stageRecord = new PlayerStageRecord(rating: rating);
    PlayerStage playerStage = new PlayerStage();

    if (easyStageRecords == null) {
      final Map<int, Object> newRecord = {};
      newRecord[level] = stageRecord.toJson();
      StageRecords stageRecords = new StageRecords(collection: newRecord);

      playerStage.setEasyStageRecord(stageRecords.toJson());
      return;
    }

    StageRecords stageRecords =
        new StageRecords(collection: easyStageRecords.collection);
    stageRecords.setRecords(level, stageRecord);
    playerStage.setEasyStageRecord(stageRecords.toJson());
    return;
  }

  void setHardStageProgress(int level, int rating) async {
    StageRecords? hardStageRecords = await getHardStageProgress();
    PlayerStageRecord stageRecord = new PlayerStageRecord(rating: rating);
    PlayerStage playerStage = new PlayerStage();

    if (hardStageRecords == null) {
      final Map<int, Object> newRecord = {};
      newRecord[level] = stageRecord.toJson();
      StageRecords stageRecords = new StageRecords(collection: newRecord);

      playerStage.setHardStageRecord(stageRecords.toJson());
      return;
    }

    StageRecords stageRecords =
        new StageRecords(collection: hardStageRecords.collection);
    stageRecords.setRecords(level, stageRecord);
    playerStage.setHardStageRecord(stageRecords.toJson());
    return;
  }

  Future<StageRecords?> getEasyStageProgress() async {
    PlayerStage playerStage = new PlayerStage();
    StageRecords? _easyStageRecords = await playerStage.getEasyStage();

    return _easyStageRecords;
  }

  Future<StageRecords?> getHardStageProgress() async {
    PlayerStage playerStage = new PlayerStage();
    StageRecords? _easyStageRecords = await playerStage.getHardStage();

    return _easyStageRecords;
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

  Future<void> clearStorage() async {
    final SharedPreferences _localStorage = await localStorage;
    _localStorage.clear();
  }
}

@JsonSerializable()
class PlayerStageRecord {
  @JsonKey(name: 'rating')
  final int rating;

  PlayerStageRecord({this.rating = 0});

  factory PlayerStageRecord.fromJson(Map<String, dynamic> json) =>
      _$PlayerStageRecordFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerStageRecordToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StageRecords {
  @JsonKey(name: 'collection')
  Map<int, Object> collection;

  StageRecords({required this.collection});

  void setRecords(int stageNumber, PlayerStageRecord records) {
    this.collection[stageNumber] = records;
  }

  factory StageRecords.fromJson(Map<String, dynamic> json) =>
      _$StageRecordsFromJson(json);

  Map<String, dynamic> toJson() => _$StageRecordsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EasyStageRecords {
  @JsonKey(name: 'easy')
  Map<String, dynamic> easy;

  EasyStageRecords({required this.easy});

  factory EasyStageRecords.fromJson(Map<String, dynamic> json) =>
      _$EasyStageRecordsFromJson(json);

  Map<String, dynamic> toJson() => _$EasyStageRecordsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HardStageRecords {
  @JsonKey(name: 'hard')
  Map<String, dynamic> hard;

  HardStageRecords({required this.hard});

  factory HardStageRecords.fromJson(Map<String, dynamic> json) =>
      _$HardStageRecordsFromJson(json);

  Map<String, dynamic> toJson() => _$HardStageRecordsToJson(this);
}

class PlayerStage {
  Future<SharedPreferences> localStorage = SharedPreferences.getInstance();

  Future<StageRecords?> getEasyStage() async {
    final SharedPreferences _localStorage = await localStorage;
    String? stageContent = _localStorage.getString('easy');

    if (stageContent == null) {
      return null;
    }

    Map<String, dynamic> encodedStageRecord = json.decode(stageContent);
    EasyStageRecords stageRecord =
        EasyStageRecords.fromJson(encodedStageRecord);

    StageRecords easyStageRecords = StageRecords.fromJson(stageRecord.easy);
    return easyStageRecords;
  }

  Future<StageRecords?> getHardStage() async {
    final SharedPreferences _localStorage = await localStorage;
    String? stageContent = _localStorage.getString('hard');

    if (stageContent == null) {
      return null;
    }

    Map<String, dynamic> encodedStageRecord = json.decode(stageContent);
    HardStageRecords stageRecord =
        HardStageRecords.fromJson(encodedStageRecord);

    StageRecords hardStageRecords = StageRecords.fromJson(stageRecord.hard);
    return hardStageRecords;
  }

  void setEasyStageRecord(Map<String, dynamic> stageRecords) async {
    final SharedPreferences _localStorage = await localStorage;
    final EasyStageRecords easyStageRecords =
        EasyStageRecords(easy: stageRecords);

    String encodedStageRecord = json.encode(easyStageRecords.toJson());
    _localStorage.setString("easy", encodedStageRecord);
  }

  void setHardStageRecord(Map<String, dynamic> stageRecords) async {
    final SharedPreferences _localStorage = await localStorage;
    final HardStageRecords hardStageRecords =
        HardStageRecords(hard: stageRecords);

    String encodedStageRecord = json.encode(hardStageRecords.toJson());
    _localStorage.setString("hard", encodedStageRecord);
  }
}
