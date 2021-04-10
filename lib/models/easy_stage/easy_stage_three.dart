import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/models/models.dart';

// 江南可采莲，莲叶何田田，鱼戏莲叶间。
class EasyStageThree {
  final List<Character> stageData = [
    Character("江", false, false, 0),
    Character("南", false, false, 1),
    Character("可", false, false, 2),
    Character("采", false, false, 3),
    Character("莲", false, false, 4),
    Character("莲", false, false, 5),
    Character("叶", false, false, 6),
    Character("何", false, false, 7),
    Character("田", false, false, 8),
    Character("田", false, false, 9),
    Character("鱼", false, false, 10),
    Character("戏", false, false, 11),
    Character("莲", false, false, 12),
    Character("叶", false, false, 13),
    Character("间", false, false, 14)
  ];

  final int numOfRows = 3;
  final int maximumSteps = 8;
  final String stageCount = '简单第三关';
  final String title = '江南';
  final String dynastyWithAuthor = '汉·乐府';
  final String translation =
      "江南水上可以采莲，莲叶多么茂盛，鱼儿在莲叶间嬉戏。鱼在莲叶的东边游戏，鱼在莲叶的西边游戏，鱼在莲叶的的南边游戏，鱼在莲叶的北边游戏。";
  final String background = '';
  final String youtubeLink = 'P7pXyLT8DY4';
  final String originalText = '江南可采莲，\n莲叶何田田，\n鱼戏莲叶间。';

  EasyStageThree();
}
