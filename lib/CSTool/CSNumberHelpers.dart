import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../CSModel/CSNumberModel.dart';
import 'package:cashscratchgo/CSTool/cs_LocalProvider.dart';
import 'CS_extension_help.dart';

class CSNumberHelpers {
  static final CSNumberHelpers _instance = CSNumberHelpers._internal();

  factory CSNumberHelpers() {
    return _instance;
  }

  CSNumberHelpers._internal();

  GameConfig? gameModel;

  Future<void> initNumberModel() async {
    await _psloadintDataFromLocate();
    await _psloadtaskDataFromLocate();
    await _psloadprobabilityDataFromLocate();
    await _psloadwinup_numberDataFromLocate();
    await _psloadlsattaskDataFromLocate();
  }

  Future<void> _psloadintDataFromLocate() async {
    String jsonString = await rootBundle.loadString("cs_num".jsons());
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    gameModel = GameConfig.fromJson(jsonMap);
    "cashscratchgo int jsonMap = ${jsonMap}".log();
    "cashscratchgo int model = ${gameModel?.card_range}".log();
  }

  Future<void> updateBrazilianPortuguese(BuildContext context) async {
    if (isBrazilianPortuguese(context)){
      String jsonString = await rootBundle.loadString("cs_num".jsons());
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      jsonMap['eq_range'] = [(gameModel!.card_range.first * 5).toInt(), (gameModel!.card_range[1] * 5).toInt(),(gameModel!.card_range[2] * 5).toInt(),(gameModel!.card_range.last * 5).toInt()];
      gameModel = GameConfig.fromJson(jsonMap);
      "cashscratchgo int jsonMap = ${jsonMap}".log();
      "cashscratchgo int model = ${gameModel?.card_range}".log();
    }
  }

  bool isBrazilianPortuguese(BuildContext context) {
    // 获取当前语言环境
    Locale currentLocale = Localizations.localeOf(context);

    // 判断是否是巴西葡萄牙语
    return currentLocale.languageCode == 'pt' || currentLocale.countryCode == 'BR';
  }

  Future<void> _psloadtaskDataFromLocate() async {
    // String jsonString = await rootBundle.loadString("c130_withdraw_task".jsons());
    // Map<String, dynamic> jsonMap = json.decode(jsonString);
    // taskModel = TaskRootModel.fromJson(jsonMap);
    // "cashscratchgo task json = ${taskModel}".log();
  }

  Future<void> _psloadlsattaskDataFromLocate() async {
    // String jsonString = await rootBundle.loadString("c130_withdraw_last_task".jsons());
    // Map<String, dynamic> jsonMap = json.decode(jsonString);
    // last_taskModel = TaskRootModel.fromJson(jsonMap);
    // "cashscratchgo task json = ${last_taskModel}".log();
  }

  Future<void> _psloadprobabilityDataFromLocate() async {
    // String jsonString = await rootBundle.loadString("probability_reset".jsons());
    // Map<String, dynamic> jsonMap = json.decode(jsonString);
    // probabilityConfigModel = ProbabilityConfig.fromJson(jsonMap);
    // "cashscratchgo probabilityConfig json = ${probabilityConfigModel}".log();
  }

  Future<void> _psloadwinup_numberDataFromLocate() async {
    // String jsonString = await rootBundle.loadString("winup_number".jsons());
    // Map<String, dynamic> jsonMap = json.decode(jsonString);
    // bonusConfigModel = BonusConfig.fromJson(jsonMap);
    // "cashscratchgo winup_number json = ${bonusConfigModel}".log();
  }

  // 插屏概率获取
  bool checkProbability() {
    // 找到 value 所在的区间
    int range = 0;
    for (var item in gameModel!.intad_point) {
      if (CSLocalProvider.instance.cs_dolas_old_number >= item.first_number * dolasbeishu() && CSLocalProvider.instance.cs_dolas_old_number <= item.end_number * dolasbeishu()) {
        range = item.point;
        break;
      }
    }

    if (range <= 0.0) {
      return false;
    }

    double point = range.toDouble() ?? 0.0;
     'range=$range'.log();
    // 随机概率判断
    double rand = Random().nextDouble() * 100; // 0.0 ~ 1.0
    'rand=$rand'.log();
    return rand <= point;
  }

  /// 获取气泡奖励值
  // double getPrizeWithDolasNum() {
    // for (var item in gameModel!.bigWin) {
    //   int start = item.firstNumber * dolasbeishu();
    //   int end = item.endNumber * dolasbeishu();
    //
    //   if (CSLocalProvider.instance.cs_dolas_old_number >= start && CSLocalProvider.instance.cs_dolas_old_number < end) {
    //     double min = item.prize.first * dolasbeishu();
    //     double max = item.prize.last * dolasbeishu();
    //     'XXXXXXX${0.to2Double(_randomBetween(min, max))}'.log();
    //     return 0.to2Double(_randomBetween(min, max));
    //   }
    // }
    //
    // /// 如果超出所有区间，返回最后一段
    // var last = gameModel!.moneyPrize.last;
    // 'YYYYYYY${0.to2Double(_randomBetween(last.prize.first * dolasbeishu(), last.prize.last * dolasbeishu()))}'.log();
    // return 0.to2Double(_randomBetween(
    //   last.prize.first * dolasbeishu(),
    //   last.prize.last * dolasbeishu(),
    // ));
  // }

  /// 获取金额范围奖励值
  // List<double> getPrizeWithDolasNSize(double ps_dolas) {
    // for (var item in gameModel!.moneyPrize) {
    //   int start = item.firstNumber;
    //   int end = item.endNumber;
    //
    //   if (ps_dolas >= start && ps_dolas < end) {
    //     return item.prize;
    //   }
    // }
    //
    // /// 如果超出所有区间，返回最后一段
    // var last = gameModel!.moneyPrize.last;
    // return last.prize;
  // }

  /// 获取钻石或者金砖奖励值
  double getPrizeWithBoxNum() {
    List<FloatPrize> model = gameModel!.box_prize;
    for (var item in model) {
      int start = item.first_number;
      int end = item.end_number;

      if (CSLocalProvider.instance.cs_dolas_old_number >= start && CSLocalProvider.instance.cs_dolas_old_number < end) {
        double min = item.prize.first;
        double max = item.prize.last;
        return 0.to2Double(_randomBetween(min, max));
      }
    }

    /// 如果超出所有区间，返回最后一段
    var last = model.last;
    return 0.to2Double(_randomBetween(
      last.prize.first,
      last.prize.last,
    ));
  }


  /// 获取气泡金额
  double getPrizeWithBubbledollarsNum() {
    List<FloatPrize> model = gameModel!.float_prize;
    for (var item in model) {
      int start = item.first_number;
      int end = item.end_number;

      if (CSLocalProvider.instance.cs_dolas_old_number >= start && CSLocalProvider.instance.cs_dolas_old_number < end) {
        double min = item.prize.first;
        double max = item.prize.last;
        return 0.to2Double(_randomBetween(min, max));
      }
    }

    /// 如果超出所有区间，返回最后一段
    var last = model.last;
    return 0.to2Double(_randomBetween(
      last.prize.first,
      last.prize.last,
    ));
  }


  /// 生成[min, max]之间随机整数（兼容 double）
  double _randomBetween(double min, double max) {
    if (min > max) {
      throw ArgumentError('min should be less than or equal to max');
    }

    final r = Random();
    // Generate a double between 0.0 and 1.0, then scale to range
    double value = min + r.nextDouble() * (max - min);
    // Round to 2 decimal places
    return double.parse(value.toStringAsFixed(2));
  }


  int dolasbeishu(){
    // if (isBrazilianPortuguese(homeKey.currentContext!)){
    //   return 5;
    // } else {
      return 1;
    // }
  }

  // 签到奖励值
  double getPrizeWithSiginNum() {
    return 0.to2Double(_randomBetween(
      gameModel!.check_reward.first.toDouble(),
      gameModel!.check_reward.last.toDouble(),
    ));
  }


  /// 获取刮卡奖励值
  double getPrizeWithCardNum(List<FloatPrize> models) {
    for (var item in models) {
      int start = item.first_number;
      int end = item.end_number;

      if (CSLocalProvider.instance.cs_dolas_old_number >= start && CSLocalProvider.instance.cs_dolas_old_number < end) {
        double min = item.prize.first;
        double max = item.prize.last;
        return 0.to2Double(_randomBetween(min, max));
      }
    }

    /// 如果超出所有区间，返回最后一段
    var last = models.last;
    return 0.to2Double(_randomBetween(
      last.prize.first,
      last.prize.last,
    ));
  }




  /// 获取bigwinNum
  int getbigwinNum() {
    for (var item in gameModel!.big_win) {
      int start = item.first_number;
      int end = item.end_number;
      if (CSLocalProvider.instance.cs_dolas_old_number >= start && CSLocalProvider.instance.cs_dolas_old_number < end) {
        return item.win_number;
      }
    }
    return gameModel!.big_win.last.win_number;
  }


  /// 获取是否显示钥匙
  bool getPointWithKey() {
    for (var item in gameModel!.key_out) {
      int start = item.first_number;
      int end = item.end_number;

      if (CSLocalProvider.instance.cs_dolas_old_number >= start && CSLocalProvider.instance.cs_dolas_old_number < end) {

        final Random _random = Random();

        // 生成 0~100 随机数
        int point = _random.nextInt(101);

        // 判断是否大于等于 75
        bool isPass = point >= item.point;

        return isPass;
      }
    }

    /// 如果超出所有区间，返回最后一段
    final Random _random = Random();
    // 生成 0~100 随机数
    int point = _random.nextInt(101);
    // 判断是否大于等于 75
    bool isPass = point >= gameModel!.key_out.last.point;
    return isPass;
  }

  int getWheelLuckyIndex(){

    final Random _random = Random();

    int point = _random.nextInt(101);

    if (point <= gameModel!.wheel_point.point_100) {
      return 100;
    } else if (point <= gameModel!.wheel_point.point_80){
      return 80;
    } else if (point <= gameModel!.wheel_point.point_50){
      return 50;
    } else if (point <= gameModel!.wheel_point.point_20){
      return 20;
    } else {
      return 0;
    }

  }

  // fruit match
  // 0 中奖下标 1 是否包含钥匙 2 是否中奖 3 其他布局内容 4 返回中奖数值 5 返回三个奖励值
  Future<List<dynamic>> getFruitMatch() async {

    List<dynamic> end = [];

    final Random _random = Random();

    int point = _random.nextInt(101);

    bool isPass = point <= gameModel!.card_fruit.point;

    int award_index = isPass ? Random().nextInt(3) : -1;

    if (CSLocalProvider.instance.cs_dollar_number <= 0) {
      award_index = 1;
    }

    end.add(award_index);

    bool isShowKey = getPointWithKey();

    end.add(isShowKey ? 1 : 0);

    end.add(award_index != -1 ? 1 : 0);

    // ===== grid逻辑（原样保留）=====
    List<List<int>> grid = List.generate(
      3,
          (_) => List.generate(3, (_) => _random.nextInt(6)),
    );

    if (award_index >= 0) {
      int winValue = _random.nextInt(6);
      for (int j = 0; j < 3; j++) {
        grid[award_index][j] = winValue;
      }
    }

    if (isShowKey) {
      List<Point<int>> candidates = [];

      for (int i = 0; i < 3; i++) {
        if (i == award_index) continue;

        for (int j = 0; j < 3; j++) {
          candidates.add(Point(i, j));
        }
      }

      final p = candidates[_random.nextInt(candidates.length)];
      grid[p.x][p.y] = -1;
    }

    end.add(grid.expand((e) => e).toList());

    List<double> awards = [];
    for (int i = 0; i < 3; i++) {
      awards.add(getPrizeWithCardNum(gameModel!.card_fruit.prize),
      );
    }

    end.add(awards[award_index == -1 ? 0 : award_index]);
    end.add(awards);

    // =========================
    // ⭐ 等待逻辑（关键）
    // =========================
    await Future.delayed(const Duration(milliseconds: 10));

    return end;
  }

  // fruit match
  // 0 中奖下标 1 是否包含钥匙 2 是否中奖 3 其他布局内容 4 返回中奖数值 5 返回12个奖励值
  Future<List<dynamic>> getBigGame() async {

    List<dynamic> end = [];

    final Random _random = Random();

    // 生成 0~100 随机数
    int point = _random.nextInt(101);

    // 判断是否大于等于 75
    bool isPass = point <= gameModel!.card_number.point;

    // 中奖类型
    int award_index = isPass ? Random().nextInt(12) : -1; // nextInt(3)返回0、1、2

    // 强制首次刮卡中奖
    if (CSLocalProvider.instance.cs_dolas_old_number <= 0 || CSLocalProvider.instance.cs_dolas_old_number == 0) {
      award_index = 1;
    }

    end.add(award_index);

    bool isShowKey = getPointWithKey();

    end.add(isShowKey ? 1 : 0);

    end.add(award_index != -1 ? 1 : 0);

    // 3
    List<int> grid = List.generate(3, (_) => _random.nextInt(90) + 10);

    end.add(grid);

    // 4
    List<double> awards = List.generate(12, (_) => getPrizeWithCardNum(gameModel!.card_number.prize));

    end.add(awards[award_index == -1 ? 0 : award_index]);
    // 5
    end.add(awards);

    // 6. 生成12个奖励数组（核心修复）
    // =========================

    List<int> gridInt = grid;

    // 允许的非 grid 数字池（避免重复 grid）
    List<int> pool = List.generate(100, (i) => i)
        .where((e) => !gridInt.contains(e))
        .toList();

    List<int> finalAwards = List.generate(12, (_) {
      return pool[_random.nextInt(pool.length)];
    });

    // =========================
    // 6.1 中奖逻辑覆盖
    // =========================
    if (award_index != -1) {
      int winValue = gridInt[_random.nextInt(gridInt.length)];
      finalAwards[award_index] = winValue;
    }

    // =========================
    // 6.2 key逻辑（插入 -1）
    // =========================
    if (isShowKey) {
      List<int> safeIndexes = List.generate(12, (i) => i);

      // ❌ 不能覆盖中奖位
      if (award_index != -1) {
        safeIndexes.remove(award_index);
      }

      int keyIndex = safeIndexes[_random.nextInt(safeIndexes.length)];
      finalAwards[keyIndex] = -1;
    }

    end.add(finalAwards);
    await Future.delayed(const Duration(milliseconds: 10));
    '0 中奖下标 1 是否包含钥匙 2 是否中奖 3 其他布局内容 4 返回中奖数值 5 返回12个奖励值 6 返回12个数值 end=${end}'.log();
    return end;

  }

  // tiger
  Future<List<dynamic>> getTigerWinner() async {

    List<dynamic> end = [];

    final Random _random = Random();

    int point = _random.nextInt(101) + 1;

    int award_num = 0;
    int award_bei = 1;

    bool isPass = false;

    if (point <= gameModel!.card_tiger.tiger0) {
      isPass = false;
      award_num = 0;
    } else if (point <= gameModel!.card_tiger.tiger7) {
      isPass = true;
      award_num = 7;
      award_bei = 5;
    } else if (point <= gameModel!.card_tiger.tiger6) {
      isPass = true;
      award_num = 6;
      award_bei = 4;
    } else if (point <= gameModel!.card_tiger.tiger5) {
      isPass = true;
      award_num = 5;
      award_bei = 3;
    } else if (point <= gameModel!.card_tiger.tiger4) {
      isPass = true;
      award_num = 4;
      award_bei = 2;
    } else if (point <= gameModel!.card_tiger.tiger3) {
      isPass = true;
      award_num = 3;
      award_bei = 1;
    }

    if (CSLocalProvider.instance.cs_dolas_old_number <= 0) {
      isPass = true;
      award_num = 3;
      award_bei = 1;
    }

    bool isShowKey = getPointWithKey();

    // =========================
    // 0
    // =========================
    end.add(isShowKey ? 1 : 0);

    // =========================
    // 1
    // =========================
    end.add(isPass ? 1 : 0);

    // =========================
    // 2（核心12数组）
    // =========================
    List<int> data2 = [];

    // 先生成 12 个随机 1~5
    data2 = List.generate(12, (_) => _random.nextInt(5) + 1);

    // 插入 0（数量 = award_num）
    List<int> zeroIndexList = List.generate(12, (i) => i)..shuffle();

    for (int i = 0; i < award_num && i < 12; i++) {
      data2[zeroIndexList[i]] = 0;
    }

    // 插入 -1（不能覆盖 0）
    if (isShowKey) {
      List<int> safeIndex = [];

      for (int i = 0; i < 12; i++) {
        if (data2[i] != 0) {
          safeIndex.add(i);
        }
      }

      if (safeIndex.isNotEmpty) {
        int idx = safeIndex[_random.nextInt(safeIndex.length)];
        data2[idx] = -1;
      }
    }

    end.add(data2);

    // =========================
    // 3 awards
    // =========================
    List<double> awards =
    List.generate(12, (_) => getPrizeWithCardNum(gameModel!.card_tiger.prize));

    end.add(awards);

    // =========================
    // 4 total reward
    // =========================
    double total = 0;

    for (int i = 0; i < data2.length; i++) {
      if (data2[i] == 0) {
        total += awards[i];
      }
    }

    total = total * award_bei;

    end.add(total);

    // 5
    end.add(award_num);

    // =========================
    // log
    // =========================
    '0钥匙 1中奖 2数据 3奖励 4总值 5中奖个数 end=$end'.log();

    await Future.delayed(const Duration(milliseconds: 10));

    return end;
  }

  // 77hot
  Future<List<dynamic>> get77hot() async {

    final Random _random = Random();

    List<dynamic> end = [];

    int point = _random.nextInt(101) + 1;

    int award_bei = -3;
    bool isPass = false;

    if (point <= gameModel!.card_77hot.point_nowin) {
      isPass = false;
    } else if (point <= gameModel!.card_77hot.point_77) {
      isPass = true;
      award_bei = 2;
    } else if (point <= gameModel!.card_77hot.point_7) {
      isPass = true;
      award_bei = 1;
    }

    if (CSLocalProvider.instance.cs_dolas_old_number <= 0) {
      isPass = true;
      award_bei = 1;
    }

    bool isShowKey = getPointWithKey();

    // =========================
    // 0
    // =========================
    end.add(isShowKey ? 1 : 0);

    // =========================
    // 1
    // =========================
    end.add(isPass ? 1 : 0);

    // =========================
    // 2 数据
    // =========================

    List<int> data2 = List.generate(
      12,
          (_) => 10 + _random.nextInt(90),
    );

    int winIndex = -1;

    // =========================
    // 插入 award_bei（>=1 才允许）
    // =========================
    if (award_bei >= 1) {
      winIndex = _random.nextInt(12);
      data2[winIndex] = award_bei;
    }

    // =========================
    // 插入 -1（不能覆盖 award_bei）
    // =========================
    if (isShowKey) {

      List<int> safeIndex = [];

      for (int i = 0; i < data2.length; i++) {
        if (i != winIndex) {
          safeIndex.add(i);
        }
      }

      if (safeIndex.isNotEmpty) {
        int idx = safeIndex[_random.nextInt(safeIndex.length)];
        data2[idx] = -1;
      }
    }

    end.add(List<int>.from(data2)); // 防引用污染

    // =========================
    // 3 awards
    // =========================
    List<double> awards = List.generate(
      12,
          (_) => getPrizeWithCardNum(gameModel!.card_77hot.prize),
    );

    end.add(awards);

    // =========================
    // 4 total
    // =========================
    double total = 0;

    if (award_bei >= 1) {
      total = awards[winIndex] * award_bei;
    }

    end.add(total);

    // =========================
    // log
    // =========================
    '0钥匙 1中奖 2数据 3奖励 4总值 end=$end'.log();

    await Future.delayed(const Duration(milliseconds: 10));

    return end;
  }



  // fruit match
  // 0 是否包含钥匙 1 是否中奖 2 其他布局内容 3 返回中奖数值 4 返回12个奖励值
  Future<List<dynamic>> getcard_emoji() async {

    List<dynamic> end = [];

    final Random _random = Random();

    // 生成 0~100 随机数
    int point = _random.nextInt(101);

    // 判断是否大于等于 75
    bool isPass = point <= gameModel!.card_emoji.point_face;

    bool isShowKey = getPointWithKey();

    end.add(isShowKey ? 1 : 0);

    end.add(isPass ? 1 : 0);

    // 2
    List<int> grid = List.generate(9, (_) => _random.nextInt(4) + 1);


    int winIndex = -1;
    // =========================
    // 插入 isPass（>=1 才允许）
    // =========================
    if (isPass) {
      winIndex = _random.nextInt(9);
      grid[winIndex] = 0;
    }

    // =========================
    // 插入 -1（不能覆盖 0）
    // =========================
    if (isShowKey) {

      List<int> safeIndex = [];

      for (int i = 0; i < grid.length; i++) {
        if (i != winIndex) {
          safeIndex.add(i);
        }
      }

      if (safeIndex.isNotEmpty) {
        int idx = safeIndex[_random.nextInt(safeIndex.length)];
        grid[idx] = -1;
      }
    }
    end.add(grid);

    // =========================
    // 3 awards
    // =========================
    List<double> awards = List.generate(
      9,
          (_) => getPrizeWithCardNum(gameModel!.card_emoji.prize),
    );

    end.add(awards);


    end.add(awards[winIndex == -1 ? 0 : winIndex]);
    await Future.delayed(const Duration(milliseconds: 10));
    '0 是否包含钥匙 1 是否中奖 2 其他布局内容 3 返回12个奖励值 4 返回奖励数值 end=${end}'.log();
    return end;

  }



  // getcard_8rich
  Future<List<dynamic>> getcard_8rich() async {
    final Random r = Random();

    List<dynamic> end = [];

    int point = r.nextInt(101);
    int point2 = r.nextInt(101);

    bool isPass = point <= gameModel!.card_8rich.point_3match;
    bool isPass2 = point2 <= gameModel!.card_8rich.point_8bet;
    bool isShowKey = getPointWithKey();

    end.add(isShowKey ? 1 : 0);
    end.add(isPass ? 1 : 0);

    // =========================
    // 未中奖固定安全模板（核心）
    // =========================
    List<int> loseTemplate = [
      1, 1,
      2, 2,
      3, 3,
      4, 4,
      5, 5,
      6, 6,
      7,
      8,
      9
    ];

    // =========================
    // 中奖逻辑
    // =========================
    List<int> data2;
    List<int> winIndexes = [];
    int? winValue;

    if (isPass) {
      winValue = 1 + r.nextInt(5);

      // 1️⃣ 先确定中奖位置
      List<int> idx = List.generate(15, (i) => i)..shuffle();
      winIndexes = idx.take(3).toList()..sort();

      // 2️⃣ 先放中奖三连
      List<int> temp = List.filled(15, 0);
      for (int i in winIndexes) {
        temp[i] = winValue;
      }

      // 3️⃣ 填剩余12个（从安全池取）
      List<int> pool = List.from(loseTemplate)..shuffle();
      int p = 0;

      for (int i = 0; i < 15; i++) {
        if (temp[i] != 0) continue;

        temp[i] = pool[p % pool.length];
        p++;
      }

      data2 = temp;
    }

    // =========================
    // 未中奖逻辑（完全按你说的）
    // =========================
    else {
      data2 = List.from(loseTemplate)..shuffle();
      winIndexes = [];
    }

    // =========================
    // key逻辑
    // =========================
    if (isShowKey) {
      List<int> safe = [];

      for (int i = 0; i < 15; i++) {
        if (winIndexes.contains(i)) continue;
        safe.add(i);
      }

      if (safe.isNotEmpty) {
        data2[safe[r.nextInt(safe.length)]] = -1;
      }
    }

    // =========================
    // awards
    // =========================
    List<double> awards = List.generate(
      15,
          (_) => getPrizeWithCardNum(gameModel!.card_8rich.prize),
    );

    double total = 0;

    for (int i in winIndexes) {
      total += awards[i];
    }

    if (isPass2) {
      total *= 8;
    }

    end.add(data2);
    end.add(awards);
    end.add(total);
    end.add(winIndexes);
    '0 key 1 win 2 data 3 awards 4 total 5 winIndexes end=$end'.log();
    await Future.delayed(const Duration(milliseconds: 10));

    return end;
  }
}