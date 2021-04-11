import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/models/models.dart';

class EasyStageEight {
  final List<Character> stageData = [
    Character("千", false, false, 0),
    Character("山", false, false, 1),
    Character("鸟", false, false, 2),
    Character("飞", false, false, 3),
    Character("绝", false, false, 4),
    Character("万", false, false, 5),
    Character("径", false, false, 6),
    Character("人", false, false, 7),
    Character("踪", false, false, 8),
    Character("灭", false, false, 9),
  ];

  final int numOfRows = 2;
  final int maximumSteps = 8;
  final String stageCount = '简单第八关';
  final String title = '江雪';
  final String dynastyWithAuthor = '唐·柳宗元';

  final String translation = "所有的山，飞鸟全都断绝；所有的路，不见人影踪迹。江上孤舟，渔翁披蓑戴笠；独自垂钓，不怕冰雪侵袭。";

  final String youtubeLink = 'iWt-VtKdOLY';
  final String originalText = '千山鸟飞绝，\n万径人踪灭。\n孤舟蓑笠翁，\n独钓寒江雪。';

  EasyStageEight();
}
