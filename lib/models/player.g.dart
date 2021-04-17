// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerStageRecord _$PlayerStageRecordFromJson(Map<String, dynamic> json) {
  return PlayerStageRecord(
    rating: json['rating'] as int,
  );
}

Map<String, dynamic> _$PlayerStageRecordToJson(PlayerStageRecord instance) =>
    <String, dynamic>{
      'rating': instance.rating,
    };

StageRecords _$StageRecordsFromJson(Map<String, dynamic> json) {
  return StageRecords(
    collection: (json['collection'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(int.parse(k), e as Object),
    ),
  );
}

Map<String, dynamic> _$StageRecordsToJson(StageRecords instance) =>
    <String, dynamic>{
      'collection':
          instance.collection.map((k, e) => MapEntry(k.toString(), e)),
    };

EasyStageRecords _$EasyStageRecordsFromJson(Map<String, dynamic> json) {
  return EasyStageRecords(
    easy: json['easy'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$EasyStageRecordsToJson(EasyStageRecords instance) =>
    <String, dynamic>{
      'easy': instance.easy,
    };

HardStageRecords _$HardStageRecordsFromJson(Map<String, dynamic> json) {
  return HardStageRecords(
    hard: json['hard'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$HardStageRecordsToJson(HardStageRecords instance) =>
    <String, dynamic>{
      'hard': instance.hard,
    };
