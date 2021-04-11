import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/models/models.dart';

class DifficultStageOne {
  final List<Character> stageData = [
    Character("牧", false, false, 0),
    Character("童", false, false, 1),
    Character("骑", false, false, 2),
    Character("黄", false, false, 3),
    Character("牛", false, false, 4),
    Character("歌", false, false, 5),
    Character("声", false, false, 6),
    Character("振", false, false, 7),
    Character("林", false, false, 8),
    Character("樾", false, false, 9),
  ];

  final int numOfRows = 2;
  final int maximumSteps = 12;
  final String stageCount = '困难第一关';
  final String title = '所见';
  final String dynastyWithAuthor = '清·袁枚';
  final String translation =
      "牧童骑在黄牛背上，嘹亮的歌声在林中回荡。忽然想要捕捉树上鸣叫的知了，就马上停止唱歌，一声不响地站立在树旁。";

  final String youtubeLink = 'R1Fsn-OQzUA';
  final String originalText = '牧童骑黄牛，\n歌声振林樾。\n意欲捕鸣蝉，\n忽然闭口立。';

  DifficultStageOne();
}
