import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/models/models.dart';

class EasyStageTwo {
  final List<Character> stageData = [
    Character("遥", false, false, 0),
    Character("望", false, false, 1),
    Character("洞", false, false, 2),
    Character("庭", false, false, 3),
    Character("山", false, false, 4),
    Character("水", false, false, 5),
    Character("翠", false, false, 6),
    Character("白", false, false, 7),
    Character("银", false, false, 8),
    Character("盘", false, false, 9),
    Character("里", false, false, 10),
    Character("一", false, false, 11),
    Character("青", false, false, 12),
    Character("螺", false, false, 13)
  ];

  final int numOfRows = 2;
  final int maximumSteps = 8;
  final String stageCount = '简单第二关';
  final String title = '望洞庭';
  final String dynastyWithAuthor = '唐·刘禹锡';
  final String translation =
      "洞庭湖的水光与秋月交相融和，水面波平浪静就好像铜镜未磨。远远望去洞庭湖山水一片翠 绿，恰似白银盘子托着青青的田螺。";
  final String background =
      "《望洞庭》是在长庆四年（公元824年）秋天写的，刘禹锡被贬逐南荒，二十年里来去洞庭六次。其中一次，刘禹锡要到和州做官，经过洞庭湖，观望洞庭湖的景色而写下了这首诗。";
  final String youtubeLink = 'cN2WEAjBEuw';
  final String originalText = '爆湖光秋月两相和，\n潭面无风镜未磨。\n遥望洞庭山水翠，\n白银盘里一青螺。';

  EasyStageTwo();
}
