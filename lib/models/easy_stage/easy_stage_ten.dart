import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/models/models.dart';

class EasyStageTen {
  final List<Character> stageData = [
    Character("小", false, false, 0),
    Character("荷", false, false, 1),
    Character("才", false, false, 2),
    Character("露", false, false, 3),
    Character("尖1", false, false, 4),
    Character("尖2", false, false, 5),
    Character("角", false, false, 6),
    Character("早", false, false, 7),
    Character("有", false, false, 8),
    Character("蜻", false, false, 9),
    Character("蜓", false, false, 10),
    Character("立", false, false, 11),
    Character("上", false, false, 12),
    Character("头", false, false, 13),
  ];

  final int numOfRows = 2;
  final int maximumSteps = 8;
  final String stageCount = '简单第十关';
  final String title = '望庐山瀑布';
  final String dynastyWithAuthor = '唐·李白';

  final String translation =
      "太阳照耀香炉峰生出袅袅紫烟，远远望去瀑布像长河悬挂山前。仿佛三干尺水流飞奔直冲而下，莫非是银河从九天垂落山崖间。";

  final String youtubeLink = 'ZfI_VoXGark';
  final String originalText = "日照香炉生紫烟，\n遥看瀑布挂前川。\n飞流直下三千尺，\n疑是银河落九天。";

  EasyStageTen();
}
