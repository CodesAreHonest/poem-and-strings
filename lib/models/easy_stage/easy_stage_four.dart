import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/models/models.dart';

// 两岸猿声啼不住，轻舟已过万重山。
class EasyStageFour {
  final List<Character> stageData = [
    Character("两", false, false, 0),
    Character("岸", false, false, 1),
    Character("猿", false, false, 2),
    Character("声", false, false, 3),
    Character("啼", false, false, 4),
    Character("不", false, false, 5),
    Character("住", false, false, 6),
    Character("轻", false, false, 7),
    Character("舟", false, false, 8),
    Character("已", false, false, 9),
    Character("过", false, false, 10),
    Character("万", false, false, 11),
    Character("重", false, false, 12),
    Character("山", false, false, 13)
  ];

  final int numOfRows = 2;
  final int maximumSteps = 8;
  final String stageCount = '简单第四关';
  final String title = '早发白帝城';
  final String dynastyWithAuthor = '唐·李白';
  final String translation =
      "早晨我告别高入云霄的白帝城，江陵远在千里船行只一日行两岸猿声还在耳边不停地啼叫，不知不觉轻舟已穿过万重山峰";
  final String youtubeLink = 'XY76Te7QVGI';
  final String originalText = '朝辞白帝彩云间，\n千里江陵一日还。\n两岸猿声啼不住，\n轻舟已过万重山。';

  EasyStageFour();
}
