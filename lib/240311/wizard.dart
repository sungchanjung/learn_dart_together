import 'package:learn_dart_together/240311/wand.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand wand;


  Wizard({
    required String name,
    required int hp,
    required int mp,
    required Wand wand,
  })
      : _name = name,
        _hp = hp,
        _mp = mp,
        wand = wand;

  String get name => _name;

  int get mp => _mp;

  int get hp => _hp;

  set name(String value) {
    if (value.length < 3 || value == false) {
      throw Exception('이름은 3자리 이상이어야 합니다.');
    }
    _name = value;
  }

  set mp(int value) {
    if (value < 0 || value == false) {
      throw Exception('마나가 없습니다.');
    }
    _mp = value;
  }

  set hp(int value) {
    _hp = value < 0 ? 0 : value;
  }
}
