import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/models/models.dart';

class DifficultStageTen {
  final List<Character> stageData = [
    Character("日", false, false, 0),
    Character("照", false, false, 1),
    Character("香", false, false, 2),
    Character("炉", false, false, 3),
    Character("生", false, false, 4),
    Character("紫", false, false, 5),
    Character("烟", false, false, 6),
    Character("遥", false, false, 7),
    Character("看", false, false, 8),
    Character("瀑", false, false, 9),
    Character("布", false, false, 10),
    Character("挂", false, false, 11),
    Character("前", false, false, 12),
    Character("川", false, false, 13),
  ];

  final int numOfRows = 2;
  final int maximumSteps = 12;
  final String stageCount = '困难第十关';
  final String title = '望庐山瀑布';
  final String dynastyWithAuthor = '唐·李白';

  final String translation =
      "太阳照耀香炉峰生出袅袅紫烟，远远望去瀑布像长河悬挂山前。仿佛三干尺水流飞奔直冲而下，莫非是银河从九天垂落山崖间。";

  final String youtubeLink = 'ZfI_VoXGark';
  final String originalText = "日照香炉生紫烟，遥看瀑布挂前川。\n飞流直下三千尺，疑是银河落九天。";

  DifficultStageTen();
}
