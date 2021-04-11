import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/models/models.dart';

class EasyStageTwo {
  final List<Character> stageData = [
    Character("桃", false, false, 0),
    Character("花", false, false, 1),
    Character("潭", false, false, 2),
    Character("水", false, false, 3),
    Character("深", false, false, 4),
    Character("千", false, false, 5),
    Character("尺", false, false, 6),
    Character("不", false, false, 7),
    Character("及", false, false, 8),
    Character("汪", false, false, 9),
    Character("伦", false, false, 10),
    Character("送", false, false, 11),
    Character("我", false, false, 12),
    Character("情", false, false, 13)
  ];

  final int numOfRows = 2;
  final int maximumSteps = 8;
  final String stageCount = '简单第二关';
  final String title = '赠汪伦';
  final String dynastyWithAuthor = '唐·李白';
  final String translation =
      "我乘船将要远行，忽然听见岸上踏地为节拍，有人边走边唱前来送行。即使桃花潭水深至千尺，也比不上汪伦送我之情。";

  final String youtubeLink = 'BTafOBs7y4c';
  final String originalText = '李白乘舟将欲行，\n忽闻岸上踏歌声。\n桃花潭水深千尺，\n不及汪伦送我情。';

  EasyStageTwo();
}
