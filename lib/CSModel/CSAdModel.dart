import 'package:json_annotation/json_annotation.dart';

part 'CSAdModel.g.dart';

@JsonSerializable()
class CSAdModel {
  late int bxkghizv = 0;
  late int nwboczqr = 0;
  late bool nwkls_switch = false;
  late List<CSAdModellist> nwkls_int = [];
  late List<CSAdModellist> nwkls_rv = [];
  CSAdModel();

  // 工厂构造函数，用于反序列化
  factory CSAdModel.fromJson(Map<String, dynamic> json) => _$CSAdModelFromJson(json);

  // 序列化方法
  Map<String, dynamic> toJson() => _$CSAdModelToJson(this);
}

@JsonSerializable()
class CSAdModellist {
  // id
  late String prnospnz = "";
  // type
  late String bamussgh = "";
  // ad_type
  late String cspsfdfm = "";
  //
  late int gbhayrnf = 0;
  //
  late double? ecpm = 0;

  CSAdModellist();

  // 工厂构造函数，用于反序列化
  factory CSAdModellist.fromJson(Map<String, dynamic> json) => _$CSAdModellistFromJson(json);

  // 序列化方法
  Map<String, dynamic> toJson() => _$CSAdModellistToJson(this);
}