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
    "cashscratchgo int model = ${gameModel?.speedcard_prize.last.prize!.last}".log();
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
      if (CSLocalProvider.instance.cs_dollar_number >= item.first_number * dolasbeishu() && CSLocalProvider.instance.cs_dollar_number <= item.end_number * dolasbeishu()) {
        range = item.point;
        break;
      }
    }
    'range=$range'.log();
    if (range <= 0.0) {
      return false;
    }

    double point = range.toDouble() ?? 0.0;
    // 随机概率判断
    double rand = Random().nextDouble() * 100; // 0.0 ~ 1.0
    'rand=$rand'.log();
    return rand <= point;
  }

  /// 获取宝箱奖励值
  double getPrizeWithBoxNum() {
    List<FloatPrize> model = gameModel!.box_prize;
    for (var item in model) {
      int start = item.first_number;
      int end = item.end_number;

      if (CSLocalProvider.instance.cs_dollar_number >= start && CSLocalProvider.instance.cs_dollar_number < end) {
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

      if (CSLocalProvider.instance.cs_dollar_number >= start && CSLocalProvider.instance.cs_dollar_number < end) {
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

      if (CSLocalProvider.instance.cs_dollar_number >= start && CSLocalProvider.instance.cs_dollar_number < end) {
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
      if (CSLocalProvider.instance.cs_dollar_number >= start && CSLocalProvider.instance.cs_dollar_number < end) {
        return item.win_number;
      }
    }
    return gameModel!.big_win.last.win_number;
  }

  /// 获取是否显示加速卡
  bool getPointWithQuicken() {
    if (CSLocalProvider.instance.cs_card_quicken_num >= 20 || CSLocalProvider.instance.cs_dollar_number < CSNumberHelpers().gameModel!.card_range.first){
      return false;
    } else {
      return true;
      for (var item in gameModel!.speedcard_out) {
        int start = item.first_number;
        int end = item.end_number;

        if (CSLocalProvider.instance.cs_qunm_ad_index >= start && CSLocalProvider.instance.cs_qunm_ad_index < end) {

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
      bool isPass = point >= gameModel!.speedcard_out.last.point;
      return isPass;
    }
  }
  // 获取加速卡数量
  double getPointWithQuickenDouble() {
    for (var item in gameModel!.speedcard_prize) {
      int start = item.first_number;
      int end = item.end_number;

      if (CSLocalProvider.instance.cs_card_quicken_num >= start && CSLocalProvider.instance.cs_card_quicken_num < end) {
        double min = item.prize!.first;
        double max = item.prize!.last;
        return 0.to2Double(_randomBetween(min, max));
      }
    }

    /// 如果超出所有区间，返回最后一段
    var last = gameModel!.speedcard_prize.last;
    return 0.to2Double(_randomBetween(
      last.prize!.first,
      last.prize!.last,
    ));
  }
  /// 获取是否显示钥匙
  bool getPointWithKey() {
    for (var item in gameModel!.key_out) {
      int start = item.first_number;
      int end = item.end_number;

      if (CSLocalProvider.instance.cs_dollar_number >= start && CSLocalProvider.instance.cs_dollar_number < end) {

        final Random _random = Random();

        // 生成 0~100 随机数
        int point = _random.nextInt(101);

        // 判断是否大于等于 75
        bool isPass = point <= item.point;

        return isPass;
      }
    }

    /// 如果超出所有区间，返回最后一段
    final Random _random = Random();
    // 生成 0~100 随机数
    int point = _random.nextInt(101);
    // 判断是否大于等于 75
    bool isPass = point <= gameModel!.key_out.last.point;
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
    bool quicken = getPointWithQuicken();
    end.add(isShowKey ? 1 : 0);

    end.add(award_index != -1 ? 1 : 0);

    // =========================
    // grid (3x3)
    // =========================
    List<List<int>> grid = List.generate(
      3,
          (_) => List.generate(3, (_) => _random.nextInt(6)),
    );

    Point<int>? keyPoint;

    // =========================
    // 中奖行
    // =========================
    if (award_index >= 0) {
      int winValue = _random.nextInt(6);
      for (int j = 0; j < 3; j++) {
        grid[award_index][j] = winValue;
      }
    }

    // =========================
    // key (-1)
    // =========================
    if (isShowKey) {
      List<Point<int>> candidates = [];

      for (int i = 0; i < 3; i++) {
        if (i == award_index) continue;

        for (int j = 0; j < 3; j++) {
          candidates.add(Point(i, j));
        }
      }

      keyPoint = candidates[_random.nextInt(candidates.length)];
      grid[keyPoint.x][keyPoint.y] = -1;
    }

    // =========================
    // quicken (-2)
    // =========================
    if (quicken) {
      List<Point<int>> candidates = [];

      for (int i = 0; i < 3; i++) {
        if (i == award_index) continue;

        for (int j = 0; j < 3; j++) {
          if (keyPoint != null &&
              keyPoint.x == i &&
              keyPoint.y == j) {
            continue;
          }

          candidates.add(Point(i, j));
        }
      }

      if (candidates.isNotEmpty) {
        final p = candidates[_random.nextInt(candidates.length)];
        grid[p.x][p.y] = -2;
      }
    }

    // =========================
    // ⭐ 关键修改：只改 end[3]
    // =========================
    List<int> layout9 = grid.expand((e) => e).toList();

    end.add(layout9);

    end.add(award_index == -1
        ? (gameModel!.card_fruit.prize)
        : getPrizeWithCardNum(gameModel!.card_fruit.prize));

    end.add([
      getPrizeWithCardNum(gameModel!.card_fruit.prize),
      getPrizeWithCardNum(gameModel!.card_fruit.prize),
      getPrizeWithCardNum(gameModel!.card_fruit.prize),
    ]);

    end.add(quicken);

    end.add(0.to2Double(CSNumberHelpers().getPointWithQuickenDouble()));

    await Future.delayed(const Duration(milliseconds: 10));
    '0 中奖下标 1 是否包含钥匙 2 是否中奖 3 其他布局内容 4 返回中奖数值 5 返回12个奖励值 6 返回12个数值 end=${end}'.log();

    return end;
  }

  // fruit match
  // 0 中奖下标 1 是否包含钥匙 2 是否中奖 3 其他布局内容 4 返回中奖数值 5 返回12个奖励值
  Future<List<dynamic>> getBigGame() async {

    List<dynamic> end = [];

    final Random _random = Random();

    int point = _random.nextInt(101);

    bool isPass = point <= gameModel!.card_number.point;

    int award_index = isPass ? Random().nextInt(12) : -1;

    bool quicken = getPointWithQuicken();
    if (CSLocalProvider.instance.cs_dollar_number <= 0 ||
        CSLocalProvider.instance.cs_dollar_number == 0) {
      award_index = 1;
    }

    end.add(award_index);

    bool isShowKey = getPointWithKey();

    end.add(isShowKey ? 1 : 0);

    end.add(award_index != -1 ? 1 : 0);

    // =========================
    // 3 grid
    // =========================
    List<int> grid = List.generate(3, (_) => _random.nextInt(90) + 10);

    end.add(grid);

    // =========================
    // 4 awards base
    // =========================
    List<double> awards = List.generate(
      12,
          (_) => getPrizeWithCardNum(gameModel!.card_number.prize),
    );

    end.add(awards[award_index == -1 ? 0 : award_index]);
    end.add(awards);

    // =========================
    // 6 finalAwards
    // =========================
    List<int> pool = List.generate(100, (i) => i)
        .where((e) => !grid.contains(e))
        .toList();

    List<int> finalAwards = List.generate(12, (_) {
      return pool[_random.nextInt(pool.length)];
    });

    // =========================
    // 6.1 中奖覆盖
    // =========================
    if (award_index != -1) {
      int winValue = grid[_random.nextInt(grid.length)];
      finalAwards[award_index] = winValue;
    }

    // =========================
    // 6.2 key（-1）
    // =========================
    int? keyIndex;

    if (isShowKey) {
      List<int> safeIndexes = List.generate(12, (i) => i);

      if (award_index != -1) {
        safeIndexes.remove(award_index);
      }

      keyIndex = safeIndexes[_random.nextInt(safeIndexes.length)];
      finalAwards[keyIndex] = -1;
    }

    // =========================
    // 6.3 quicken（-2）⭐新增
    // =========================
    if (quicken) {
      List<int> safeIndexes = List.generate(12, (i) => i);

      // 不覆盖中奖
      if (award_index != -1) {
        safeIndexes.remove(award_index);
      }

      // 不覆盖钥匙
      if (keyIndex != null) {
        safeIndexes.remove(keyIndex);
      }

      if (safeIndexes.isNotEmpty) {
        int quickIndex = safeIndexes[_random.nextInt(safeIndexes.length)];
        finalAwards[quickIndex] = -2;
      }
    }

    end.add(finalAwards);

    end.add(quicken);

    end.add(0.to2Double(CSNumberHelpers().getPointWithQuickenDouble()));

    await Future.delayed(const Duration(milliseconds: 10));

    '0 中奖下标 1 是否包含钥匙 2 是否中奖 3 其他布局内容 4 返回中奖数值 5 返回12个奖励值 6 end=$end'
        .log();

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

    if (point > gameModel!.card_tiger.tiger0) {
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

    if (CSLocalProvider.instance.cs_dollar_number <= 0) {
      isPass = true;
      award_num = 3;
      award_bei = 1;
    }

    bool isShowKey = getPointWithKey();
    bool quicken = getPointWithQuicken();

    // =========================
    // 0 key
    // =========================
    end.add(isShowKey ? 1 : 0);

    // =========================
    // 1 pass
    // =========================
    end.add(isPass ? 1 : 0);

    // =========================
    // 2 data2
    // =========================
    List<int> data2 = List.generate(12, (_) => _random.nextInt(5) + 1);

    // -------------------------
    // 先放 0（中奖）
    // -------------------------
    List<int> zeroIndexList = List.generate(12, (i) => i)..shuffle();

    for (int i = 0; i < award_num && i < 12; i++) {
      data2[zeroIndexList[i]] = 0;
    }

    // -------------------------
    // 再放 -1（key）
    // -------------------------
    List<int> keySafe = [];

    for (int i = 0; i < 12; i++) {
      if (data2[i] != 0) {
        keySafe.add(i);
      }
    }

    int? keyIndex;

    if (isShowKey && keySafe.isNotEmpty) {
      keyIndex = keySafe[_random.nextInt(keySafe.length)];
      data2[keyIndex] = -1;
    }

    // -------------------------
    // ⭐ 新增：放 -2（quicken）
    // -------------------------
    if (quicken) {
      List<int> quickSafe = [];

      for (int i = 0; i < 12; i++) {
        if (data2[i] != 0 && data2[i] != -1) {
          quickSafe.add(i);
        }
      }

      if (quickSafe.isNotEmpty) {
        int qIndex = quickSafe[_random.nextInt(quickSafe.length)];
        data2[qIndex] = -2;
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
    // 4 total
    // =========================
    double total = 0;

    for (int i = 0; i < data2.length; i++) {
      if (data2[i] == 0) {
        total += awards[i];
      }
    }

    total = total * award_bei;

    end.add(total);

    // =========================
    // 5 award_num
    // =========================
    end.add(award_num);

    end.add(quicken);

    end.add(0.to2Double(CSNumberHelpers().getPointWithQuickenDouble()));

    await Future.delayed(const Duration(milliseconds: 10));

    '0钥匙 1中奖 2数据 3奖励 4总值 5中奖个数 end=$end'.log();

    return end;
  }

  // 77hot
  Future<List<dynamic>> get77hot() async {

    final Random _random = Random();

    List<dynamic> end = [];

    int point = _random.nextInt(101) + 1;

    int award_bei = -3;
    bool isPass = false;
    'point=#$point'.log();
    'point_nowin=##${gameModel!.card_77hot.point_nowin}'.log();
    if (point > gameModel!.card_77hot.point_nowin) {
      isPass = false;
    } else if (point <= gameModel!.card_77hot.point_77) {
      isPass = true;
      award_bei = 2;
    } else  {
      isPass = true;
      award_bei = 1;
    }

    if (CSLocalProvider.instance.cs_dollar_number <= 0) {
      isPass = true;
      award_bei = 1;
    }

    bool isShowKey = getPointWithKey();
    bool quicken = getPointWithQuicken();

    // =========================
    // 0
    // =========================
    end.add(isShowKey ? 1 : 0);

    // =========================
    // 1
    // =========================
    end.add(isPass ? 1 : 0);

    // =========================
    // 2 data2
    // =========================
    List<int> data2 = List.generate(
      12,
          (_) => 10 + _random.nextInt(90),
    );

    int winIndex = -1;
    int? keyIndex;

    // =========================
    // 中奖位
    // =========================
    if (award_bei >= 1) {
      winIndex = _random.nextInt(12);
      data2[winIndex] = award_bei;
    }

    // =========================
    // key (-1)
    // =========================
    if (isShowKey) {
      List<int> safeIndex = [];

      for (int i = 0; i < data2.length; i++) {
        if (i != winIndex) {
          safeIndex.add(i);
        }
      }

      if (safeIndex.isNotEmpty) {
        keyIndex = safeIndex[_random.nextInt(safeIndex.length)];
        data2[keyIndex] = -1;
      }
    }

    // =========================
    // ⭐ quicken (-2) 新增
    // =========================
    if (quicken) {
      List<int> quickSafe = [];

      for (int i = 0; i < data2.length; i++) {
        if (i != winIndex && data2[i] != -1) {
          quickSafe.add(i);
        }
      }

      if (quickSafe.isNotEmpty) {
        int qIndex = quickSafe[_random.nextInt(quickSafe.length)];
        data2[qIndex] = -2;
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

    if (award_bei >= 1 && winIndex != -1) {
      total = awards[winIndex] * award_bei;
    }

    end.add(total);

    end.add(quicken);

    end.add(0.to2Double(CSNumberHelpers().getPointWithQuickenDouble()));

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

    int point = _random.nextInt(101);

    bool isPass = point > gameModel!.card_emoji.point_face;

    bool isShowKey = getPointWithKey();
    bool quicken = getPointWithQuicken();

    end.add(isShowKey ? 1 : 0);
    end.add(isPass ? 1 : 0);

    // =========================
    // grid (9)
    // =========================
    List<int> grid = List.generate(9, (_) => _random.nextInt(4) + 1);

    int winIndex = -1;
    int? keyIndex;

    // =========================
    // 中奖位置 = 0
    // =========================
    if (isPass) {
      winIndex = _random.nextInt(9);
      grid[winIndex] = 0;
    }

    // =========================
    // key = -1
    // =========================
    if (isShowKey) {
      List<int> safeIndex = [];

      for (int i = 0; i < grid.length; i++) {
        if (i != winIndex) {
          safeIndex.add(i);
        }
      }

      if (safeIndex.isNotEmpty) {
        keyIndex = safeIndex[_random.nextInt(safeIndex.length)];
        grid[keyIndex] = -1;
      }
    }

    // =========================
    // ⭐ quicken = -2
    // =========================
    if (quicken) {
      List<int> quickSafe = [];

      for (int i = 0; i < grid.length; i++) {
        if (i != winIndex && grid[i] != -1) {
          quickSafe.add(i);
        }
      }

      if (quickSafe.isNotEmpty) {
        int qIndex = quickSafe[_random.nextInt(quickSafe.length)];
        grid[qIndex] = -2;
      }
    }

    end.add(grid);

    // =========================
    // awards
    // =========================
    List<double> awards = List.generate(
      9,
          (_) => getPrizeWithCardNum(gameModel!.card_emoji.prize),
    );

    end.add(awards);

    end.add(awards[winIndex == -1 ? 0 : winIndex]);

    end.add(quicken);

    end.add(0.to2Double(CSNumberHelpers().getPointWithQuickenDouble()));

    await Future.delayed(const Duration(milliseconds: 10));

    '0钥匙 1中奖 2grid 3奖励 4quicken 5奖励值 end=$end'.log();

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
    bool quicken = getPointWithQuicken();

    end.add(isShowKey ? 1 : 0);
    end.add(isPass ? 1 : 0);

    // =========================
    // lose template
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

    List<int> data2;
    List<int> winIndexes = [];
    int? winValue;

    // =========================
    // win logic
    // =========================
    if (isPass) {
      winValue = 1 + r.nextInt(5);

      List<int> idx = List.generate(15, (i) => i)..shuffle();
      winIndexes = idx.take(3).toList()..sort();

      List<int> temp = List.filled(15, 0);

      for (int i in winIndexes) {
        temp[i] = winValue;
      }

      List<int> pool = List.from(loseTemplate)..shuffle();
      int p = 0;

      for (int i = 0; i < 15; i++) {
        if (temp[i] != 0) continue;
        temp[i] = pool[p % pool.length];
        p++;
      }

      data2 = temp;
    } else {
      data2 = List.from(loseTemplate)..shuffle();
      winIndexes = [];
    }

    // =========================
    // key (-1)
    // =========================
    if (isShowKey) {
      List<int> safe = [];

      for (int i = 0; i < 15; i++) {
        if (!winIndexes.contains(i)) {
          safe.add(i);
        }
      }

      if (safe.isNotEmpty) {
        int k = safe[r.nextInt(safe.length)];
        data2[k] = -1;
      }
    }

    int? keyIndex;
    for (int i = 0; i < 15; i++) {
      if (data2[i] == -1) {
        keyIndex = i;
        break;
      }
    }

    // =========================
    // ⭐ quicken (-2) 新增
    // =========================
    if (quicken) {
      List<int> quickSafe = [];

      for (int i = 0; i < 15; i++) {
        if (!winIndexes.contains(i) && data2[i] != -1) {
          quickSafe.add(i);
        }
      }

      if (quickSafe.isNotEmpty) {
        int q = quickSafe[r.nextInt(quickSafe.length)];
        data2[q] = -2;
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
      total *= 1;
    }

    end.add(data2);
    end.add(awards);
    end.add(total);
    end.add(winIndexes);
    end.add(quicken);

    end.add(0.to2Double(CSNumberHelpers().getPointWithQuickenDouble()));

    await Future.delayed(const Duration(milliseconds: 10));

    '0 key 1 win 2 data 3 awards 4 total 5 winIndexes end=$end'.log();

    return end;
  }
}