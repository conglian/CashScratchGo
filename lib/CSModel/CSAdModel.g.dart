// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CSAdModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CSAdModel _$CSAdModelFromJson(Map<String, dynamic> json) => CSAdModel()
  ..bxkghizv = (json['bxkghizv'] as num).toInt()
  ..nwboczqr = (json['nwboczqr'] as num).toInt()
  ..nwkls_switch = json['nwkls_switch'] as bool
  ..nwkls_int = (json['nwkls_int'] as List<dynamic>)
      .map((e) => CSAdModellist.fromJson(e as Map<String, dynamic>))
      .toList()
  ..nwkls_rv = (json['nwkls_rv'] as List<dynamic>)
      .map((e) => CSAdModellist.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$CSAdModelToJson(CSAdModel instance) => <String, dynamic>{
      'bxkghizv': instance.bxkghizv,
      'nwboczqr': instance.nwboczqr,
      'nwkls_switch': instance.nwkls_switch,
      'nwkls_int': instance.nwkls_int,
      'nwkls_rv': instance.nwkls_rv,
    };

CSAdModellist _$CSAdModellistFromJson(Map<String, dynamic> json) =>
    CSAdModellist()
      ..prnospnz = json['prnospnz'] as String
      ..bamussgh = json['bamussgh'] as String
      ..cspsfdfm = json['cspsfdfm'] as String
      ..gbhayrnf = (json['gbhayrnf'] as num).toInt()
      ..esljgmwn = (json['esljgmwn'] as num).toInt()
      ..ecpm = (json['ecpm'] as num?)?.toDouble();

Map<String, dynamic> _$CSAdModellistToJson(CSAdModellist instance) =>
    <String, dynamic>{
      'prnospnz': instance.prnospnz,
      'bamussgh': instance.bamussgh,
      'cspsfdfm': instance.cspsfdfm,
      'gbhayrnf': instance.gbhayrnf,
      'esljgmwn': instance.esljgmwn,
      'ecpm': instance.ecpm,
    };
