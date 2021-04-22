import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/models/models.dart';

class EasyStageTen {
  final List<Character> stageData = [
    Character("飞", false, false, 0),
    Character("流", false, false, 1),
    Character("直", false, false, 2),
    Character("下", false, false, 3),
    Character("三", false, false, 4),
    Character("千", false, false, 5),
    Character("尺", false, false, 6),
    Character("疑", false, false, 7),
    Character("是", false, false, 8),
    Character("银", false, false, 9),
    Character("河", false, false, 10),
    Character("落", false, false, 11),
    Character("九", false, false, 12),
    Character("天", false, false, 13),
  ];

  final int numOfRows = 2;
  final int maximumSteps = 6;
  final String stageCount = '简单第十关';
  final String title = '望庐山瀑布';
  final String dynastyWithAuthor = '唐·李白';

  final String translation =
      "太阳照耀香炉峰生出袅袅紫烟，远远望去瀑布像长河悬挂山前。仿佛三干尺水流飞奔直冲而下，莫非是银河从九天垂落山崖间。";

  final String youtubeLink = 'ZfI_VoXGark';
  final String originalText = "日照香炉生紫烟，\n遥看瀑布挂前川。\n飞流直下三千尺，\n疑是银河落九天。";

  EasyStageTen();
}
