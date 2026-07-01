// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CSNumberModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameConfig _$GameConfigFromJson(Map<String, dynamic> json) => GameConfig()
  ..card_range = (json['card_range'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList()
  ..new_prize = (json['new_prize'] as num).toInt()
  ..queue_number_all =
      QueueNumber.fromJson(json['queue_number_all'] as Map<String, dynamic>)
  ..queue_number_current =
      QueueNumber.fromJson(json['queue_number_current'] as Map<String, dynamic>)
  ..intad_point = (json['intad_point'] as List<dynamic>)
      .map((e) => IntAdPoint.fromJson(e as Map<String, dynamic>))
      .toList()
  ..big_win = (json['big_win'] as List<dynamic>)
      .map((e) => BigWin.fromJson(e as Map<String, dynamic>))
      .toList()
  ..float_prize = (json['float_prize'] as List<dynamic>)
      .map((e) => FloatPrize.fromJson(e as Map<String, dynamic>))
      .toList()
  ..box_prize = (json['box_prize'] as List<dynamic>)
      .map((e) => FloatPrize.fromJson(e as Map<String, dynamic>))
      .toList()
  ..wheel_point =
      WheelPoint.fromJson(json['wheel_point'] as Map<String, dynamic>)
  ..card_fruit =
      SBcard_fruitModel.fromJson(json['card_fruit'] as Map<String, dynamic>)
  ..card_number =
      SBcard_fruitModel.fromJson(json['card_number'] as Map<String, dynamic>)
  ..card_tiger =
      SBcard_tigerModel.fromJson(json['card_tiger'] as Map<String, dynamic>)
  ..card_77hot =
      SBcard_77hotModel.fromJson(json['card_77hot'] as Map<String, dynamic>)
  ..card_emoji =
      SBcard_emojiModel.fromJson(json['card_emoji'] as Map<String, dynamic>)
  ..card_8rich =
      SBcard_8richModel.fromJson(json['card_8rich'] as Map<String, dynamic>)
  ..speedcard_out = (json['speedcard_out'] as List<dynamic>)
      .map((e) => IntAdPoint.fromJson(e as Map<String, dynamic>))
      .toList()
  ..speedcard_prize = (json['speedcard_prize'] as List<dynamic>)
      .map((e) => CSspeedcard_prizeModel.fromJson(e as Map<String, dynamic>))
      .toList()
  ..wtd_task = (json['wtd_task'] as List<dynamic>)
      .map((e) => wtd_taskModel.fromJson(e as Map<String, dynamic>))
      .toList()
  ..key_out = (json['key_out'] as List<dynamic>)
      .map((e) => IntAdPoint.fromJson(e as Map<String, dynamic>))
      .toList()
  ..check_reward = (json['check_reward'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList();

Map<String, dynamic> _$GameConfigToJson(GameConfig instance) =>
    <String, dynamic>{
      'card_range': instance.card_range,
      'new_prize': instance.new_prize,
      'queue_number_all': instance.queue_number_all,
      'queue_number_current': instance.queue_number_current,
      'intad_point': instance.intad_point,
      'big_win': instance.big_win,
      'float_prize': instance.float_prize,
      'box_prize': instance.box_prize,
      'wheel_point': instance.wheel_point,
      'card_fruit': instance.card_fruit,
      'card_number': instance.card_number,
      'card_tiger': instance.card_tiger,
      'card_77hot': instance.card_77hot,
      'card_emoji': instance.card_emoji,
      'card_8rich': instance.card_8rich,
      'speedcard_out': instance.speedcard_out,
      'speedcard_prize': instance.speedcard_prize,
      'wtd_task': instance.wtd_task,
      'key_out': instance.key_out,
      'check_reward': instance.check_reward,
    };

SBcard_8richModel _$SBcard_8richModelFromJson(Map<String, dynamic> json) =>
    SBcard_8richModel()
      ..winup_number = (json['winup_number'] as num).toInt()
      ..point_3match = (json['point_3match'] as num).toInt()
      ..point_8bet = (json['point_8bet'] as num).toInt()
      ..prize = (json['prize'] as List<dynamic>)
          .map((e) => FloatPrize.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SBcard_8richModelToJson(SBcard_8richModel instance) =>
    <String, dynamic>{
      'winup_number': instance.winup_number,
      'point_3match': instance.point_3match,
      'point_8bet': instance.point_8bet,
      'prize': instance.prize,
    };

SBcard_77hotModel _$SBcard_77hotModelFromJson(Map<String, dynamic> json) =>
    SBcard_77hotModel()
      ..winup_number = (json['winup_number'] as num).toInt()
      ..point_nowin = (json['point_nowin'] as num).toInt()
      ..point_7 = (json['point_7'] as num).toInt()
      ..point_77 = (json['point_77'] as num).toInt()
      ..prize = (json['prize'] as List<dynamic>)
          .map((e) => FloatPrize.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SBcard_77hotModelToJson(SBcard_77hotModel instance) =>
    <String, dynamic>{
      'winup_number': instance.winup_number,
      'point_nowin': instance.point_nowin,
      'point_7': instance.point_7,
      'point_77': instance.point_77,
      'prize': instance.prize,
    };

SBcard_tigerModel _$SBcard_tigerModelFromJson(Map<String, dynamic> json) =>
    SBcard_tigerModel()
      ..winup_number = (json['winup_number'] as num).toInt()
      ..tiger0 = (json['tiger0'] as num).toInt()
      ..tiger3 = (json['tiger3'] as num).toInt()
      ..tiger4 = (json['tiger4'] as num).toInt()
      ..tiger5 = (json['tiger5'] as num).toInt()
      ..tiger6 = (json['tiger6'] as num).toInt()
      ..tiger7 = (json['tiger7'] as num).toInt()
      ..tiger8 = (json['tiger8'] as num).toInt()
      ..tiger9 = (json['tiger9'] as num).toInt()
      ..tiger10 = (json['tiger10'] as num).toInt()
      ..prize = (json['prize'] as List<dynamic>)
          .map((e) => FloatPrize.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SBcard_tigerModelToJson(SBcard_tigerModel instance) =>
    <String, dynamic>{
      'winup_number': instance.winup_number,
      'tiger0': instance.tiger0,
      'tiger3': instance.tiger3,
      'tiger4': instance.tiger4,
      'tiger5': instance.tiger5,
      'tiger6': instance.tiger6,
      'tiger7': instance.tiger7,
      'tiger8': instance.tiger8,
      'tiger9': instance.tiger9,
      'tiger10': instance.tiger10,
      'prize': instance.prize,
    };

CSspeedcard_prizeModel _$CSspeedcard_prizeModelFromJson(
        Map<String, dynamic> json) =>
    CSspeedcard_prizeModel()
      ..first_number = (json['first_number'] as num).toInt()
      ..end_number = (json['end_number'] as num).toInt()
      ..type = (json['type'] as num).toInt()
      ..prize = (json['prize'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList();

Map<String, dynamic> _$CSspeedcard_prizeModelToJson(
        CSspeedcard_prizeModel instance) =>
    <String, dynamic>{
      'first_number': instance.first_number,
      'end_number': instance.end_number,
      'type': instance.type,
      'prize': instance.prize,
    };

SBcard_emojiModel _$SBcard_emojiModelFromJson(Map<String, dynamic> json) =>
    SBcard_emojiModel()
      ..winup_number = (json['winup_number'] as num).toInt()
      ..point_face = (json['point_face'] as num).toInt()
      ..prize = (json['prize'] as List<dynamic>)
          .map((e) => FloatPrize.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SBcard_emojiModelToJson(SBcard_emojiModel instance) =>
    <String, dynamic>{
      'winup_number': instance.winup_number,
      'point_face': instance.point_face,
      'prize': instance.prize,
    };

SBcard_fruitModel _$SBcard_fruitModelFromJson(Map<String, dynamic> json) =>
    SBcard_fruitModel()
      ..winup_number = (json['winup_number'] as num).toInt()
      ..point = (json['point'] as num).toInt()
      ..prize = (json['prize'] as List<dynamic>)
          .map((e) => FloatPrize.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SBcard_fruitModelToJson(SBcard_fruitModel instance) =>
    <String, dynamic>{
      'winup_number': instance.winup_number,
      'point': instance.point,
      'prize': instance.prize,
    };

wtd_taskModel _$wtd_taskModelFromJson(Map<String, dynamic> json) =>
    wtd_taskModel()
      ..type = json['type'] as String
      ..num = (json['num'] as num).toInt();

Map<String, dynamic> _$wtd_taskModelToJson(wtd_taskModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'num': instance.num,
    };

QueueNumber _$QueueNumberFromJson(Map<String, dynamic> json) => QueueNumber()
  ..int_all = (json['int_all'] as num?)?.toInt()
  ..int_all_delete = (json['int_all_delete'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList()
  ..int_current = (json['int_current'] as num?)?.toInt()
  ..int_current_delete = (json['int_current_delete'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList();

Map<String, dynamic> _$QueueNumberToJson(QueueNumber instance) =>
    <String, dynamic>{
      'int_all': instance.int_all,
      'int_all_delete': instance.int_all_delete,
      'int_current': instance.int_current,
      'int_current_delete': instance.int_current_delete,
    };

IntAdPoint _$IntAdPointFromJson(Map<String, dynamic> json) => IntAdPoint()
  ..first_number = (json['first_number'] as num).toInt()
  ..point = (json['point'] as num).toInt()
  ..end_number = (json['end_number'] as num).toInt();

Map<String, dynamic> _$IntAdPointToJson(IntAdPoint instance) =>
    <String, dynamic>{
      'first_number': instance.first_number,
      'point': instance.point,
      'end_number': instance.end_number,
    };

BigWin _$BigWinFromJson(Map<String, dynamic> json) => BigWin()
  ..first_number = (json['first_number'] as num).toInt()
  ..win_number = (json['win_number'] as num).toInt()
  ..end_number = (json['end_number'] as num).toInt();

Map<String, dynamic> _$BigWinToJson(BigWin instance) => <String, dynamic>{
      'first_number': instance.first_number,
      'win_number': instance.win_number,
      'end_number': instance.end_number,
    };

FloatPrize _$FloatPrizeFromJson(Map<String, dynamic> json) => FloatPrize()
  ..first_number = (json['first_number'] as num).toInt()
  ..prize = (json['prize'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList()
  ..end_number = (json['end_number'] as num).toInt();

Map<String, dynamic> _$FloatPrizeToJson(FloatPrize instance) =>
    <String, dynamic>{
      'first_number': instance.first_number,
      'prize': instance.prize,
      'end_number': instance.end_number,
    };

WheelPoint _$WheelPointFromJson(Map<String, dynamic> json) => WheelPoint()
  ..point_20 = (json['point_20'] as num).toInt()
  ..point_50 = (json['point_50'] as num).toInt()
  ..point_80 = (json['point_80'] as num).toInt()
  ..point_100 = (json['point_100'] as num).toInt();

Map<String, dynamic> _$WheelPointToJson(WheelPoint instance) =>
    <String, dynamic>{
      'point_20': instance.point_20,
      'point_50': instance.point_50,
      'point_80': instance.point_80,
      'point_100': instance.point_100,
    };
