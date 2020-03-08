import 'package:poem_and_strings/models/models.dart';
import 'package:flutter/foundation.dart';

@immutable
class StageState {
  final List<Character> data;
  final double itemPerRow;
  final int numOfRow;

  const StageState(
      {this.data = const [], this.itemPerRow = 0, this.numOfRow = 0});

  StageState copyWith({List<Character> data, double itemPerRow, int numOfRow}) {
    return StageState(
      data: data ?? this.data,
      itemPerRow: itemPerRow ?? this.itemPerRow,
      numOfRow: numOfRow ?? this.numOfRow,
    );
  }
}
