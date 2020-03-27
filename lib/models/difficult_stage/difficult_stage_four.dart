import 'package:poem_and_strings/models/character.dart';
import 'package:poem_and_strings/models/models.dart';

class DifficultStageFour {
  final List<Character> stageData = [
    Character("劝", false, false, 0),
    Character("君", false, false, 1),
    Character("莫", false, false, 2),
    Character("打", false, false, 3),
    Character("枝", false, false, 4),
    Character("头", false, false, 5),
    Character("鸟", false, false, 6),
    Character("子", false, false, 7),
    Character("在", false, false, 8),
    Character("巢", false, false, 9),
    Character("中", false, false, 10),
    Character("望", false, false, 11),
    Character("母", false, false, 12),
    Character("归", false, false, 13)
  ];

  final int numOfRows = 2;
  final int maximumSteps = 12;
  final String stageCount = '困难第四关';
  final String title = '鸟';
  final String dynastyWithAuthor = '唐·白居易';
  final String translation =
      "谁说这群小鸟儿的生命微不足道？宇宙万物都有血有肉的皮，是一样的生命，没有孰轻孰重的道理。我劝你们不要打枝头上的鸟儿，幼鸟还在巢中等待母亲的归来，弄不好一石数命啊！";
  final String background =
      "这是一首劝诫诗。每年春天转成夏天的时候，鸟儿们正处于繁育时期，不少乡下孩子喜欢掏鸟窝、抓小鸟，甚至不少大人也在田间地头边干活边捕鸟，究其动机，仅仅是出于好玩。一幅幅鸟儿或死去或挣扎的画面让诗人惊讶恐惧，很上心。于是，诗人创作此诗，深情地呼喊与号召人们爱惜小鸟，与它们和谐共处，同时以鸟喻人，劝诫权贵尊重平民。";
  final String youtubeLink = 'assets/video/easy_stage_four.mp4';
  final String originalText = '谁道群生性命微？\n一般骨肉一般皮。\n劝君莫打枝头鸟，\n子在巢中望母归。';

  DifficultStageFour();
}
