import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/models/models.dart';

class EasyStageOne {
  final List<Character> stageData = [
    Character("爆", false, false, 0),
    Character("竹", false, false, 1),
    Character("声", false, false, 2),
    Character("中", false, false, 3),
    Character("一", false, false, 4),
    Character("岁", false, false, 5),
    Character("除", false, false, 6),
    Character("春", false, false, 7),
    Character("风", false, false, 8),
    Character("送", false, false, 9),
    Character("暖", false, false, 10),
    Character("入", false, false, 11),
    Character("屠", false, false, 12),
    Character("苏", false, false, 13)
  ];

  final int numOfRows = 2;
  final int maximumSteps = 10;
  final String stageCount = '第一关';
  final String title = '元日';
  final String dynastyWithAuthor = '宋·王安石';
  final String translation =
      "爆竹声中旧的一年已经过去，迎着和暖的春风开怀畅饮屠苏酒。初升的太阳照耀着千家万户，都把旧的桃符取下换上新的桃符。";
  final String background =
      "王安石此时身为宰相,正在大刀阔斧地进行改革.所以这首诗的字里行间都洋溢着他对革除时弊、推行新法的坚定信念及乐观情绪.抒发了他春风得意踌躇满志的心情. 还能体现出他的执政态度.";
  final String youtubeLink = 'assets/video/easy_stage_one.mp4';
  final String originalText = '爆竹声中一岁除，春风送暖入屠苏。千门万户曈曈日，总把新桃换旧符。';

  EasyStageOne();
}
