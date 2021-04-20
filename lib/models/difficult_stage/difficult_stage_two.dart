import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/models/models.dart';

class DifficultStageTwo {
  final List<Character> stageData = [
    Character("李", false, false, 0),
    Character("白", false, false, 1),
    Character("乘", false, false, 2),
    Character("舟", false, false, 3),
    Character("将", false, false, 4),
    Character("欲", false, false, 5),
    Character("行", false, false, 6),
    Character("忽", false, false, 7),
    Character("闻", false, false, 8),
    Character("岸", false, false, 9),
    Character("上", false, false, 10),
    Character("踏", false, false, 11),
    Character("歌", false, false, 12),
    Character("声", false, false, 13)
  ];

  final int numOfRows = 2;
  final int maximumSteps = 9;
  final String stageCount = '困难第二关';
  final String title = '赠汪伦';
  final String dynastyWithAuthor = '唐·李白';
  final String translation =
      "我乘船将要远行，忽然听见岸上踏地为节拍，有人边走边唱前来送行。即使桃花潭水深至千尺，也比不上汪伦送我之情。";

  final String youtubeLink = 'BTafOBs7y4c';
  final String originalText = '李白乘舟将欲行，\n忽闻岸上踏歌声。\n桃花潭水深千尺，\n不及汪伦送我情。';
  DifficultStageTwo();
}
