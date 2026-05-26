import 'package:json_annotation/json_annotation.dart';

part 'CSFkModel.g.dart';

@JsonSerializable()
class CSFkModel {
  late CSUIModel ui = CSUIModel();
  late CSbehaviorModel behavior = CSbehaviorModel();
  late List<String> device = [];
  CSFkModel();

  // 工厂构造函数，用于反序列化
  factory CSFkModel.fromJson(Map<String, dynamic> json) => _$CSFkModelFromJson(json);

  // 序列化方法
  Map<String, dynamic> toJson() => _$CSFkModelToJson(this);
}

@JsonSerializable()
class CSUIModel {
  late int number = 0;
  late int behavior = 0;
  late int device = 0;
  CSUIModel();

  // 工厂构造函数，用于反序列化
  factory CSUIModel.fromJson(Map<String, dynamic> json) => _$CSUIModelFromJson(json);

  // 序列化方法
  Map<String, dynamic> toJson() => _$CSUIModelToJson(this);
}

@JsonSerializable()
class CSbehaviorModel {
  late CSad_shortModel ad_short_show = CSad_shortModel();
  late CSad_shortModel ad_short_close = CSad_shortModel();
  late int wrong_deem_ad_less = 0;
  late int wrong_deem_ad_more = 0;
  late int no_install = 0;
  late int ad_daily_show = 0;
  CSbehaviorModel();

  // 工厂构造函数，用于反序列化
  factory CSbehaviorModel.fromJson(Map<String, dynamic> json) => _$CSbehaviorModelFromJson(json);

  // 序列化方法
  Map<String, dynamic> toJson() => _$CSbehaviorModelToJson(this);
}

@JsonSerializable()
class CSad_shortModel {
  late int duration = 0;
  late int value = 0;

  CSad_shortModel();

  // 工厂构造函数，用于反序列化
  factory CSad_shortModel.fromJson(Map<String, dynamic> json) => _$CSad_shortModelFromJson(json);

  // 序列化方法
  Map<String, dynamic> toJson() => _$CSad_shortModelToJson(this);
}