import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../CSModel/CSFkModel.dart';
import 'CSTBAEventTool.dart';
import 'cs_LocalProvider.dart';
import 'cs_extension_help.dart';


class CSFKManger {
  static final CSFKManger _instance = CSFKManger._internal();

  factory CSFKManger() {
    return _instance;
  }

  CSFKManger._internal();

  CSFkModel fkModel = CSFkModel();

  Future<void> initFKJson() async {
    'fkModel=$fkModel'.log();
    if (fkModel.behavior.ad_daily_show == 0) {
      String jsonString = await rootBundle.loadString("cs_control168".jsons());
      'risk_control=$jsonString'.log();
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      fkModel = CSFkModel.fromJson(jsonMap);
    }
    "pigwalletspine fk json = ${fkModel.behavior.ad_daily_show}".log();
  }


  Future<void> initFK() async {
    cs_checkRoot();
    cs_checkVpn();
    cs_checkSim();
    cs_checkSimulator();
    cs_checkDeveloper();
    cs_checkStore();
    cs_checkIP();
    cs_checkNum();
  }

  // 是否需要打开风控
  Future<bool> cs_checkAllStatus() async {
    final prefs = await SharedPreferences.getInstance();
    String types = 'number';
    // behavior
    bool behavior = await cs_checkUser();
    'behavior=$behavior'.log();
    if (behavior){
      types = 'behavior';
    }
    // number
    bool number = prefs.getBool('cs_fk_number_status') ?? false;
    'number=$number'.log();
    if (number){
      types = 'number';
    }
    // device
    bool device = prefs.getBool('cs_fk_decvice_status') ?? false;
    'device=$device'.log();
    if (device){
      types = 'device';
    }
    if (behavior || number || device){
      cs_event_fire(
        "nskdh_fk_head_off",
        {
          "type": types,
        },
      );
      return true;
    }
    return false;
  }

  // 获取用户异常行为状态
  Future<bool> cs_checkUser() async {
    // 开关未打开
    if(fkModel.ui.behavior == 0){
      return false;
    }
    final prefs = await SharedPreferences.getInstance();
    'CSLocalProvider.instance.cs_fk_ad_short_show2 = ${CSLocalProvider.instance.cs_fk_ad_short_show}'.log();
    // 两次rv间隔时间小于30s，3次以上
    if(prefs.getBool('cs_fk_ad_short_show') == true){
      return true;
    }
    // RV 从播放到收到关闭回调时间小于20s，3次以上
    if(prefs.getBool('cs_fk_ad_short_close') == true){
      return true;
    }
    // //现金金额达到提现门槛,视频数少于3次
    if((prefs.getInt('cs_ad_all_number') ?? 0) < fkModel.behavior.wrong_deem_ad_less && (prefs.getInt('cs_dolas_old_number') ?? 0) >= 1000){
      cs_event_fire('risk_chance', {'risk_from' : 'wrong_deem_ad_less'});
      return true;
    }
    // 用户观看90次RV(不包含插屏)，未到提现门槛
    if((prefs.getInt('cs_ad_reawrd_all_number') ?? 0) >= fkModel.behavior.wrong_deem_ad_more && (prefs.getInt('cs_dolas_old_number') ?? 0) < 1000){
      cs_event_fire('risk_chance', {'risk_from' : 'wrong_deem_ad_more'});
      return true;
    }
    return false;
  }

  // 数字联盟
  cs_checkNum()async{
    // var numberUnitID = await PigwalletspineFK.instance.cs_getNumberUnitID();
    var url = Uri.parse('https://sg-ddi.shuzilm.cn/q');
    try {
      var response = await http.post(
        url,
        headers: eventHeader,
        // body: jsonEncode({"protocol":2,"pkg":await FlutterTbaInfo.instance.getBundleId(),"did":numberUnitID}),
      );
      print("upload event [Number] success ${response.body}");

      try{
        //{"protocol":2,"ver":"1.0.1","err":0,"device_type":0,"normal_times":0,
        // "duplicate_times":0,"update_times":1,"recall_times":0}
        var json = jsonDecode(response.body);
        if(json["err"] == 0 && json["device_type"] != 0 && fkModel.ui.number == 1){
          cs_event_fire('risk_chance', {'risk_from' : 'number'});
          await CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_fk_number_statusName,true);
        }else{
          await CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_fk_number_statusName,false);
        }
      }catch(e){
        await CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_fk_number_statusName,false);
      }

    } catch (e) {
      await CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_fk_number_statusName,false);
      "upload event [Number] faild".log();
    }

  }

  Map<String, String> eventHeader = {
    'Content-Type': 'application/json',
  };

  // 设备 Ip
  cs_checkIP()async{

    var url = Uri.parse('https://ip-prod.piggywalletspinfunpro.com/api/clion');
    try {
      var response = await http.post(
        url,
        headers: eventHeader,
        body: jsonEncode({
          "aduck" : await FlutterTbaInfo.instance.getAndroidId(),
        }),
      );
      print("upload event [IP] success ${response.body}");
      //{"code":200,"msg":"Success","data":{"blion":false}}
      var result = BoomUniqueStringUtil.decrypt(response.body, 45);
      print("upload event [IP] success ${result}");
      try{
        var bfrog = jsonDecode(result)["data"]["bfrog"];
        if(bfrog && fkModel.device.contains('ip') && fkModel.ui.device == 1){
          cs_event_fire('risk_chance', {'risk_from' : 'ip'});
          await CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_fk_ip_statusName,true);
        }
      }catch(e){
        await CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_fk_ip_statusName,false);
      }

    } catch (e) {
      await CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_fk_ip_statusName,false);
      "upload event [IP] faild".log();
    }
  }

  cs_add_tabsession_custom() async {

    bool root = await cs_checkRoot();
    bool vpn = await cs_checkVpn();
    bool sim = await cs_checkSim();
    bool simulator = await cs_checkSimulator();
    bool developer = await cs_checkDeveloper();
    bool googleplay = await cs_checkStore();
    Map<String, dynamic> customer = {
      'root' : root ? 1 : 0,
      'vpn' : vpn ? 1 : 0,
      'sim' : sim ? 1 : 0,
      'simulator' : simulator ? 1 : 0,
      'developer' : developer ? 1 : 0,
      'googleplay' : googleplay ? 1 : 0,
    };
    cs_event_fire('session_custom', customer);

  }

  Future<bool> cs_checkRoot() async {
    // var result = await PigwalletspineFK.instance.cs_root();
    // if(fkModel.ui.device == 0){
    //   return false;
    // }
    // if(result && fkModel.device.contains('root')){
    //   cs_event_fire('risk_chance', {'risk_from' : 'root'});
    //   CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_fk_decvice_statusName,true);
    //   return true;
    // }
    return false;
  }

  Future<bool> cs_checkVpn() async {
    // var result = await PigwalletspineFK.instance.cs_vpn();
    // if(fkModel.ui.device == 0){
    //   return false;
    // }
    // if(result && fkModel.device.contains('vpn')){
    //   cs_event_fire('risk_chance', {'risk_from' : 'vpn'});
    //   CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_fk_decvice_statusName,true);
    //   return true;
    // }
    return false;
  }

  Future<bool> cs_checkSim() async {
    // var result = await PigwalletspineFK.instance.cs_sim();
    // if(fkModel.ui.device == 0){
    //   return false;
    // }
    // if(!result && fkModel.device.contains('sim')){
    //   cs_event_fire('risk_chance', {'risk_from' : 'sim'});
    //   CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_fk_decvice_statusName,true);
    //   return true;
    // }
    return false;
  }

  Future<bool> cs_checkSimulator() async {
    // var result = await PigwalletspineFK.instance.cs_simulator();
    // if(fkModel.ui.device == 0){
    //   return false;
    // }
    // if(result && fkModel.device.contains('simulator')){
    //   cs_event_fire('risk_chance', {'risk_from' : 'simulator'});
    //   CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_fk_decvice_statusName,true);
    //   return true;
    // }
    return false;
  }

  Future<bool> cs_checkDeveloper() async {
    // var result = await PigwalletspineFK.instance.cs_developer();
    // if(fkModel.ui.device == 0){
    //   return false;
    // }
    // if(result && fkModel.device.contains('developer')){
    //   cs_event_fire('risk_chance', {'risk_from' : 'developer'});
    //   CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_fk_decvice_statusName,true);
    //   return true;
    // }
    return false;
  }

  Future<bool> cs_checkStore() async {
    // var result = await PigwalletspineFK.instance.cs_store();
    // if(fkModel.ui.device == 0){
    //   return false;
    // }
    // if(!result && fkModel.device.contains('googleplay')){
    //   cs_event_fire('risk_chance', {'risk_from' : 'googleplay'});
    //   CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_fk_decvice_statusName,true);
    //   return true;
    // }
    return false;
  }
}