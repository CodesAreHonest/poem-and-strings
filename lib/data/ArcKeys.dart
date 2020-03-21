import "package:flutter/widgets.dart";

class ArcKeys {
  // Easy Stage
  static Key easyStageBody(String stageType) =>
      Key('__EasyStageBody_${stageType}__');

  static Key easyStageList(String stageType) =>
      Key('__EasyStageList_${stageType}__');

  // Game
  static Key gameEnvironment(String game) =>
      Key('__gameEnvironment_${gameEnvironment(game)}__');

  // Difficult Stage
  static Key difficultStageBody(String stageType) =>
      Key('__DifficultStageBody_${stageType}__');

  static Key difficultStageList(String stageType) =>
      Key('__DifficultStageList_${stageType}__');

  // Page Indicator
  static Key pageIndicator(int currentPage) =>
      Key('__PageIndicator_${currentPage}__');
}
