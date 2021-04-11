import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/models/models.dart';

class EasyStageFive {
  final List<Character> stageData = [
    Character("空", false, false, 0),
    Character("山", false, false, 1),
    Character("不", false, false, 2),
    Character("见", false, false, 3),
    Character("人", false, false, 4),
    Character("但", false, false, 5),
    Character("闻", false, false, 6),
    Character("人", false, false, 7),
    Character("语", false, false, 8),
    Character("响", false, false, 9),
  ];

  final int numOfRows = 2;
  final int maximumSteps = 8;
  final String stageCount = '简单第五关';
  final String title = '鹿柴';
  final String dynastyWithAuthor = '唐·王维';

  final String translation = "山中空旷寂静看不见人，只听得说话的人语声响。夕阳的金光直射入深林，又照在幽暗处的青苔上。";
  final String youtubeLink = 'XZXhfFC5TmE';
  final String originalText = '空山不见人，\n但闻人语响。\n返景入深林，\n复照青苔上。';

  EasyStageFive();
}
