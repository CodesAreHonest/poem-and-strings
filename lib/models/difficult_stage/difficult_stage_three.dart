import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/models/models.dart';

class DifficultStageThree {
  final List<Character> stageData = [
    Character("洛", false, false, 0),
    Character("雨", false, false, 1),
    Character("亲", false, false, 2),
    Character("友", false, false, 3),
    Character("如", false, false, 4),
    Character("相", false, false, 5),
    Character("问", false, false, 6),
    Character("一", false, false, 7),
    Character("片", false, false, 8),
    Character("冰", false, false, 9),
    Character("心", false, false, 10),
    Character("在", false, false, 11),
    Character("玉", false, false, 12),
    Character("壶", false, false, 13)
  ];

  final int numOfRows = 2;
  final int maximumSteps = 10;
  final String stageCount = '第三关';
  final String title = '芙蓉楼送辛渐';
  final String dynastyWithAuthor = '唐·王昌龄';
  final String translation =
      "冷雨连夜洒遍吴地江天，清晨送走你后，独自面对着楚山离愁无限！到了洛阳，如果洛阳亲友问起我来，就请转告他们，我的心依然像玉壶里的冰那样晶莹纯洁！";
  final String background =
      "此诗当作于天宝元年（公元742年），王昌龄当时为江宁丞。辛渐是王昌龄的朋友，这次拟由润州渡江，取道扬州，北上洛阳。王昌龄可能陪他从江宁到润州，然后在此分手。这首诗为在江边离别时所写。";

  DifficultStageThree();
}
