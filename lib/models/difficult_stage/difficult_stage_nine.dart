import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/models/models.dart';

class DifficultStageNine {
  final List<Character> stageData = [
    Character("小", false, false, 0),
    Character("荷", false, false, 1),
    Character("才", false, false, 2),
    Character("露", false, false, 3),
    Character("尖", false, false, 4),
    Character("尖", false, false, 5),
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
  final int maximumSteps = 12;
  final String stageCount = '困难第九关';
  final String title = '小池';
  final String dynastyWithAuthor = '宋·杨万里';

  final String translation =
      "泉眼悄然无声是因舍不得细细的水流，树阴倒映水面是喜爱晴天和风的轻柔。娇嫩的小荷叶刚从水面露出尖尖的角，早有一只调皮的小蜻蜓立在它的上头。";

  //  https://v.qq.com/x/page/q0904v196cn.html
  final String youtubeLink = 'iWt-VtKdOLY';
  final String originalText = '小荷才露尖尖角，早有蜻蜓立上头。';

  DifficultStageNine();
}
