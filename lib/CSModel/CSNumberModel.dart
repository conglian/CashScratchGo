import 'package:json_annotation/json_annotation.dart';

part 'CSNumberModel.g.dart';

@JsonSerializable()
class GameConfig {
  late List<int> card_range = [];
  late int new_prize = 0;
  late QueueNumber queue_number_all = QueueNumber();
  late QueueNumber queue_number_current = QueueNumber();

  late List<IntAdPoint> intad_point = [];
  late List<BigWin> big_win = [];
  late List<FloatPrize> float_prize = [];
  late List<FloatPrize> box_prize = [];

  late WheelPoint wheel_point = WheelPoint();

  late SBcard_fruitModel card_fruit = SBcard_fruitModel();

  late SBcard_fruitModel card_number = SBcard_fruitModel();

  late SBcard_tigerModel card_tiger = SBcard_tigerModel();

  late SBcard_77hotModel card_77hot = SBcard_77hotModel();

  late SBcard_emojiModel card_emoji = SBcard_emojiModel();

  late SBcard_8richModel card_8rich = SBcard_8richModel();

  late List<wtd_taskModel> wtd_task = [];

  late List<IntAdPoint> key_out = [];

  late List<int> check_reward = [];

  GameConfig();

  // 工厂构造函数，用于反序列化
  factory GameConfig.fromJson(Map<String, dynamic> json) => _$GameConfigFromJson(json);

  // 序列化方法
  Map<String, dynamic> toJson() => _$GameConfigToJson(this);
}

@JsonSerializable()
class SBcard_8richModel {
  //
  late int winup_number = 0;
  //
  late int point_3match = 0;
  //
  late int point_8bet = 0;
  //
  late List<FloatPrize> prize = [];

  SBcard_8richModel();

  // 工厂构造函数，用于反序列化
  factory SBcard_8richModel.fromJson(Map<String, dynamic> json) => _$SBcard_8richModelFromJson(json);

  // 序列化方法
  Map<String, dynamic> toJson() => _$SBcard_8richModelToJson(this);
}

@JsonSerializable()
class SBcard_77hotModel {
  //
  late int winup_number = 0;
  //
  late int point_nowin = 0;
  //
  late int point_7 = 0;
  //
  late int point_77 = 0;
  //
  late List<FloatPrize> prize = [];

  SBcard_77hotModel();

  // 工厂构造函数，用于反序列化
  factory SBcard_77hotModel.fromJson(Map<String, dynamic> json) => _$SBcard_77hotModelFromJson(json);

  // 序列化方法
  Map<String, dynamic> toJson() => _$SBcard_77hotModelToJson(this);
}

@JsonSerializable()
class SBcard_tigerModel {
  //
  late int winup_number = 0;
  //
  late int tiger0 = 0;
  //
  late int tiger3 = 0;
  //
  late int tiger4 = 0;
  //
  late int tiger5 = 0;
  //
  late int tiger6 = 0;
  //
  late int tiger7 = 0;
  //
  late int tiger8 = 0;
  //
  late int tiger9 = 0;
  //
  late int tiger10 = 0;

  //
  late List<FloatPrize> prize = [];

  SBcard_tigerModel();

  // 工厂构造函数，用于反序列化
  factory SBcard_tigerModel.fromJson(Map<String, dynamic> json) => _$SBcard_tigerModelFromJson(json);

  // 序列化方法
  Map<String, dynamic> toJson() => _$SBcard_tigerModelToJson(this);
}

@JsonSerializable()
class SBcard_emojiModel {
  //
  late int winup_number = 0;
  //
  late int point_face = 0;
  //
  late List<FloatPrize> prize = [];

  SBcard_emojiModel();

  // 工厂构造函数，用于反序列化
  factory SBcard_emojiModel.fromJson(Map<String, dynamic> json) => _$SBcard_emojiModelFromJson(json);

  // 序列化方法
  Map<String, dynamic> toJson() => _$SBcard_emojiModelToJson(this);
}
@JsonSerializable()
class SBcard_fruitModel {
  //
  late int winup_number = 0;
  //
  late int point = 0;
  //
  late List<FloatPrize> prize = [];

  SBcard_fruitModel();

  // 工厂构造函数，用于反序列化
  factory SBcard_fruitModel.fromJson(Map<String, dynamic> json) => _$SBcard_fruitModelFromJson(json);

  // 序列化方法
  Map<String, dynamic> toJson() => _$SBcard_fruitModelToJson(this);
}

@JsonSerializable()
class wtd_taskModel {
  late String type = '';
  late int num = 0;

  wtd_taskModel();

  factory wtd_taskModel.fromJson(Map<String, dynamic> json) =>
      _$wtd_taskModelFromJson(json);

  Map<String, dynamic> toJson() => _$wtd_taskModelToJson(this);
}

@JsonSerializable()
class QueueNumber {
  late int? int_all = 0;
  late List<int>? int_all_delete = [];

  late int? int_current = 0;
  late List<int>? int_current_delete = [];

  QueueNumber();

  factory QueueNumber.fromJson(Map<String, dynamic> json) =>
      _$QueueNumberFromJson(json);

  Map<String, dynamic> toJson() => _$QueueNumberToJson(this);
}

@JsonSerializable()
class IntAdPoint {
  late int first_number = 0;
  late int point = 0;
  late int end_number = 0;

  IntAdPoint();

  factory IntAdPoint.fromJson(Map<String, dynamic> json) =>
      _$IntAdPointFromJson(json);

  Map<String, dynamic> toJson() => _$IntAdPointToJson(this);
}

@JsonSerializable()
class BigWin {
  late int first_number = 0;
  late int win_number = 0;
  late int end_number = 0;

  BigWin();

  factory BigWin.fromJson(Map<String, dynamic> json) =>
      _$BigWinFromJson(json);

  Map<String, dynamic> toJson() => _$BigWinToJson(this);
}

@JsonSerializable()
class FloatPrize {
  late int first_number = 0;
  late List<double> prize = [];
  late int end_number = 0;

  FloatPrize();

  factory FloatPrize.fromJson(Map<String, dynamic> json) =>
      _$FloatPrizeFromJson(json);

  Map<String, dynamic> toJson() => _$FloatPrizeToJson(this);
}

@JsonSerializable()
class WheelPoint {
  late int point_20 = 0;
  late int point_50 = 0;
  late int point_80 = 0;
  late int point_100 = 0;

  WheelPoint();

  factory WheelPoint.fromJson(Map<String, dynamic> json) =>
      _$WheelPointFromJson(json);

  Map<String, dynamic> toJson() => _$WheelPointToJson(this);
}