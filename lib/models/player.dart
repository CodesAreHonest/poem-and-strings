import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Player {
  Future<SharedPreferences> localStorage;

  Player() {
    localStorage = SharedPreferences.getInstance();
  }

  void setEasyStageProgress(int level, int rating) {}

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
  Map<String, int> playerRecord;

  void setRating(int rating) {
    this.playerRecord = {"rating": rating};
  }

  Map<String, int> get collection {
    return playerRecord;
  }

  @override
  String toString() {
    return jsonEncode(this.playerRecord);
  }
}
