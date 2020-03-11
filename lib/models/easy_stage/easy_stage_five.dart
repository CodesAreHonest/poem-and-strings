import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/models/models.dart';

class EasyStageFive {
  final List<Character> stageData = [
    Character("月", false, false, 0),
    Character("落", false, false, 1),
    Character("乌", false, false, 2),
    Character("啼", false, false, 3),
    Character("霜", false, false, 4),
    Character("满", false, false, 5),
    Character("天", false, false, 6),
    Character("江", false, false, 7),
    Character("枫", false, false, 8),
    Character("渔", false, false, 9),
    Character("火", false, false, 10),
    Character("对", false, false, 11),
    Character("愁", false, false, 12),
    Character("眠", false, false, 13)
  ];

  final int numOfRows = 2;
  final int maximumSteps = 10;
  final String stageCount = '第五关';
  final String title = '枫桥夜泊';
  final String dynastyWithAuthor = '唐·张继';
  final String translation =
      "月亮已落下乌鸦啼叫寒气满天，江边枫树与船上渔火，难抵我独自傍愁而眠。姑苏城外那寒山古寺，半夜里敲响的钟声传到了我乘坐的客船。";
  final String background =
      "这是一首劝诫诗。每年春天转成夏天的时候，鸟儿们正处于繁育时期，不少乡下孩子喜欢掏鸟窝、抓小鸟，甚至不少大人也在田间地头边干活边捕鸟，究其动机，仅仅是出于好玩。一幅幅鸟儿或死去或挣扎的画面让诗人惊讶恐惧，很上心。于是，诗人创作此诗，深情地呼喊与号召人们爱惜小鸟，与它们和谐共处，同时以鸟喻人，劝诫权贵尊重平民。";
  final String youtubeLink = 'https://www.youtube.com/watch?v=XZXhfFC5TmE';

  EasyStageFive();
}
