import 'package:poem_and_strings/models/models.dart';

class GetStageDataAction {
  final dynamic stage;

  GetStageDataAction(this.stage);

  List<Character> getStageData() {
    return stage.getRandomShuffledData();
  }

  double getItemsPerRow() {
    return stage.getTotalStageItems() / stage.numberOfRowRendered();
  }

  int getNumberOfRow() => stage.numberOfRowRendered();

  @override
  String toString() {
    return "GetStageDataAction{stage: $stage}";
  }
}
