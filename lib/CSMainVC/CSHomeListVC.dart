import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:cashscratchgo/CSBasic/CSTabBar.dart';
import 'package:cashscratchgo/CSDialog/CSGuideDialog.dart';
import 'package:cashscratchgo/CSTool/CSNumberHelpers.dart';
import 'package:cashscratchgo/CSTool/CSTBAEventTool.dart';
import 'package:cashscratchgo/CSTool/cs_GradientNumber.dart';
import 'package:cashscratchgo/CSTool/cs_GradientText.dart';
import 'package:cashscratchgo/CSTool/cs_extension_help.dart';
import 'package:cashscratchgo/CSTool/cs_img.dart';
import 'package:cashscratchgo/CSTool/cs_stroke_text.dart';
import 'package:cashscratchgo/CSTool/cs_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../CSDialog/CSDialog.dart';
import '../CSDialog/CSGuideManager.dart';
import '../CSTool/CSFKManger.dart';
import '../CSTool/CSNoticeHelp.dart';
import '../CSTool/cs_LocalProvider.dart';
import 'CSScratchCardVC.dart';

class CSHomeListVC extends StatefulWidget {
  const CSHomeListVC({super.key});

  @override
  State<CSHomeListVC> createState() => _CSHomeListVCState();
}

class _CSHomeListVCState extends State<CSHomeListVC> with SingleTickerProviderStateMixin {

  bool is_tap_wheel = false;

  Timer? _timer;

  Duration? _remainingDuration0;

  Duration? _remainingDuration1;

  Duration? _remainingDuration2;

  Duration? _remainingDuration3;

  Duration? _remainingDuration4;

  Duration? _remainingDuration5;

  DateTime? _startTime0;

  DateTime? _startTime1;

  DateTime? _startTime2;

  DateTime? _startTime3;

  DateTime? _startTime4;

  DateTime? _startTime5;

  final list = [
    "cs_scratch_list_0",
    "cs_scratch_list_1",
    "cs_scratch_list_2",
    "cs_scratch_list_3",
    "cs_scratch_list_4",
    "cs_scratch_list_5",
  ];

  @override
  void initState() {
    super.initState();
    cs_event_fire('home_page', {});
    WidgetsBinding.instance.addPostFrameCallback((_) {
      oldGuideWidget();
      CSGuideManager.showStep(context);
      CSNoticeHelp().initNotice(context);
    });
    CSFKManger().initFK();
    CSHomeListNotificationService.stream.listen((value) async {
      _setStarTime();
      setState(() {});
    });
    _setStarTime();
    startTimer();
    CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_first_show_homeName, true);
  }
  // 老用户流程
  void oldGuideWidget(){
    if (CSLocalProvider.instance.cs_old_guide == false){
      context.tipShow(CSOldGuideDialog());
    }
  }


  // 开始计时器
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (CSLocalProvider.instance.cs_scrach_end_number_0 >= 10){
        final now = DateTime.now();
        final elapsed = now.difference(_startTime0!);
        if (elapsed < const Duration(minutes: 3)) {
          _remainingDuration0 = const Duration(minutes: 3) - elapsed;
        } else {
          _remainingDuration0 = Duration.zero;
          CSLocalProvider.instance.updateString(CSLocalProvider.instance.cs_scrach_end_time_0Name, '');
          CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scrach_end_number_0Name, 0);
          Future.delayed(Duration(milliseconds: 50),(){
            setState(() {});
          });
        }
      }
      if (CSLocalProvider.instance.cs_scrach_end_number_1 >= 10){
        final now = DateTime.now();
        final elapsed = now.difference(_startTime1!);
        if (elapsed < const Duration(minutes: 3)) {
          _remainingDuration1 = const Duration(minutes: 3) - elapsed;
        } else {
          _remainingDuration1 = Duration.zero;
          CSLocalProvider.instance.updateString(CSLocalProvider.instance.cs_scrach_end_time_1Name, '');
          CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scrach_end_number_1Name, 0);
          Future.delayed(Duration(milliseconds: 50),(){
            setState(() {});
          });
        }
      }
      if (CSLocalProvider.instance.cs_scrach_end_number_2 >= 10){
        final now = DateTime.now();
        final elapsed = now.difference(_startTime2!);
        if (elapsed < const Duration(minutes: 3)) {
          _remainingDuration2 = const Duration(minutes: 3) - elapsed;
        } else {
          _remainingDuration2 = Duration.zero;
          CSLocalProvider.instance.updateString(CSLocalProvider.instance.cs_scrach_end_time_2Name, '');
          CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scrach_end_number_2Name, 0);
          Future.delayed(Duration(milliseconds: 50),(){
            setState(() {});
          });
        }
      }
      if (CSLocalProvider.instance.cs_scrach_end_number_3 >= 10){
        final now = DateTime.now();
        final elapsed = now.difference(_startTime3!);
        if (elapsed < const Duration(minutes: 3)) {
          _remainingDuration3 = const Duration(minutes: 3) - elapsed;
        } else {
          _remainingDuration3 = Duration.zero;
          CSLocalProvider.instance.updateString(CSLocalProvider.instance.cs_scrach_end_time_3Name, '');
          CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scrach_end_number_3Name, 0);
          Future.delayed(Duration(milliseconds: 50),(){
            setState(() {});
          });
        }
      }
      if (CSLocalProvider.instance.cs_scrach_end_number_4 >= 10){
        final now = DateTime.now();
        final elapsed = now.difference(_startTime4!);
        if (elapsed < const Duration(minutes: 3)) {
          _remainingDuration4 = const Duration(minutes: 3) - elapsed;
        } else {
          _remainingDuration4 = Duration.zero;
          CSLocalProvider.instance.updateString(CSLocalProvider.instance.cs_scrach_end_time_4Name, '');
          CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scrach_end_number_4Name, 0);
          Future.delayed(Duration(milliseconds: 50),(){
            setState(() {});
          });
        }
      }
      if (CSLocalProvider.instance.cs_scrach_end_number_5 >= 10){
        final now = DateTime.now();
        final elapsed = now.difference(_startTime5!);
        if (elapsed < const Duration(minutes: 3)) {
          _remainingDuration5 = const Duration(minutes: 3) - elapsed;
        } else {
          _remainingDuration5 = Duration.zero;
          CSLocalProvider.instance.updateString(CSLocalProvider.instance.cs_scrach_end_time_5Name, '');
          CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scrach_end_number_5Name, 0);
          Future.delayed(Duration(milliseconds: 50),(){
            setState(() {});
          });
        }
      }
      if (CSLocalProvider.instance.cs_scrach_end_time_0.isNotEmpty || CSLocalProvider.instance.cs_scrach_end_time_1.isNotEmpty || CSLocalProvider.instance.cs_scrach_end_time_2.isNotEmpty || CSLocalProvider.instance.cs_scrach_end_time_3.isNotEmpty || CSLocalProvider.instance.cs_scrach_end_time_4.isNotEmpty || CSLocalProvider.instance.cs_scrach_end_time_5.isNotEmpty){
        if (mounted){
          setState(() {});
        }
      }
    });
  }


  _setStarTime(){
    if (CSLocalProvider.instance.cs_scrach_end_time_0.isNotEmpty){
      _startTime0 = DateTime.parse(CSLocalProvider.instance.cs_scrach_end_time_0);
    }
    if (CSLocalProvider.instance.cs_scrach_end_time_1.isNotEmpty){
      _startTime1 = DateTime.parse(CSLocalProvider.instance.cs_scrach_end_time_1);
    }
    if (CSLocalProvider.instance.cs_scrach_end_time_2.isNotEmpty){
      _startTime2 = DateTime.parse(CSLocalProvider.instance.cs_scrach_end_time_2);
    }
    if (CSLocalProvider.instance.cs_scrach_end_time_3.isNotEmpty){
      _startTime3 = DateTime.parse(CSLocalProvider.instance.cs_scrach_end_time_3);
    }
    if (CSLocalProvider.instance.cs_scrach_end_time_4.isNotEmpty){
      _startTime4 = DateTime.parse(CSLocalProvider.instance.cs_scrach_end_time_4);
    }
    if (CSLocalProvider.instance.cs_scrach_end_time_5.isNotEmpty){
      _startTime5 = DateTime.parse(CSLocalProvider.instance.cs_scrach_end_time_5);
    }

  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 0.width(context),
            height: 0.height(context),
            decoration: BoxDecoration(
              image: CSDImg('cs_home_bg'),
            ),
            child: Column(
              children: [
                CSNavBarWidget(),
                SizedBox(
                  width: 0.width(context),
                  height: 610.h,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 24.h),
                        Row(
                          mainAxisAlignment: .center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                _card(list[0], 0),
                                SizedBox(height: 8.h),
                                _card(list[1], 1),
                              ],
                            ),
                            SizedBox(width: 36.w),
                            _card(list[2], 2),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: .center,
                          children: [
                            _card(list[3], 3),
                            SizedBox(width: 8.h),
                            _card(list[4], 4),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        _card(list[5], 5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _card(String image, int row, {double height = 132}) {
    return SizedBox(
      width: row == 5 ? 328.w : row == 2 ? 132.w : 160.w, // 加宽度
      height: row == 2 ? 272.h : 132.h,
      child: _item(image, row),
    );
  }
  int getScratchIndex(int row){
    if (row == 0){
      return CSLocalProvider.instance.cs_scrach_end_number_0 <= 0 ? 0 : CSLocalProvider.instance.cs_scrach_end_number_0;
    } else if (row == 1){
      return CSLocalProvider.instance.cs_scrach_end_number_1 <= 0 ? 0 :CSLocalProvider.instance.cs_scrach_end_number_1;
    } else if (row == 2){
      return CSLocalProvider.instance.cs_scrach_end_number_2 <= 0 ? 0 : CSLocalProvider.instance.cs_scrach_end_number_2;
    } else if (row == 3){
      return CSLocalProvider.instance.cs_scrach_end_number_3 <= 0 ? 0 : CSLocalProvider.instance.cs_scrach_end_number_3;
    } else if (row == 4){
      return CSLocalProvider.instance.cs_scrach_end_number_4 <= 0 ? 0 : CSLocalProvider.instance.cs_scrach_end_number_4;
    } else if (row == 5){
      return CSLocalProvider.instance.cs_scrach_end_number_5 <= 0 ? 0 : CSLocalProvider.instance.cs_scrach_end_number_5;
    }  else {
      return 0;
    }
  }
  double getTopH(int row){
    if (row == 2){
      return 8.h;
    } else {
      return 12.h;
    }
  }
  Widget _item(String image, int row) {
    return ParticleButton(
      onTap: (){
        if (getWithshowDown(row) == false){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CSScratchCardVC(type: row),
            ),
          );
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CSImg(name: '$image', height: row == 2 ? 272 : 132, width: row == 5 ? 328.w : row == 2 ? 132.w : 160.w),
            /// 角标
            Positioned(
              top: getTopH(row),
              left: -7,
              width: 40,
              height: 20,
              child: Transform.rotate(
                angle: -0.8053981633974483, // -π/4
                child: Container(
                  width: 40,
                  height: 20,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: CSStrokeText(
                    text: '${getScratchIndex(row)}/10',
                    size: 9,
                    color: '#FFFFFF'.color(),
                    weight: FontWeight.w500,
                    skWidth: 0.5,
                    skColor: '#7B1900'.color(),
                  ),
                ),
              ),
            ),
            /// pt标签
            Positioned(
              left: getWinNumLeft(row),
              bottom: getWinNumBottom(row),
              child: SizedBox(
                child: CSGradientStrokeText(text: '\$${getWinuptoNum(row)}', gradientColors: ['#FFC800'.color(), '#E20000'.color(), '#FFC400'.color()], width: 60, height: 28, fontSize: 18, strokeWidth: 1, strokeColor: '#FFFFFF'.color()),
              ),
            ),
            Visibility(visible: getWithshowDown(row),child: Container(
              decoration: BoxDecoration(
                image: CSDImg('cs_unlock_bg')
              ),
              child: Column(
                children: [
                  SizedBox(height: 32.h),
                  CSImg(name: 'cs_replece_icon', width: 28, height: 28),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: 148,
                    height: 40,
                    child: RichText(
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w900,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'The Next Card ',
                          ),
                          TextSpan(
                            text: ' ${setTimetext(row)} ',
                            style: TextStyle(color: '#FF6C4A'.color(), fontSize: 14),
                          ),
                          TextSpan(
                            text: 'Seconds',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }



  String setTimetext(int index){
    Duration dut = Duration();
    if (index == 0){
      dut = _remainingDuration0 ?? Duration();
    } else if (index == 1) {
      dut = _remainingDuration1 ?? Duration();
    } else if (index == 2) {
      dut = _remainingDuration2 ?? Duration();
    } else if (index == 3) {
      dut = _remainingDuration3 ?? Duration();
    } else if (index == 4) {
      dut = _remainingDuration4 ?? Duration();
    } else {
      dut = _remainingDuration5 ?? Duration();
    }
    return '${dut.inSeconds}';
  }

  bool getWithshowDown(int row){
    if (row == 0){
      if (CSLocalProvider.instance.cs_scrach_end_number_0 >= 10){
        return true;
      } else {
        return false;
      }
    } else if (row == 1){
      if (CSLocalProvider.instance.cs_scrach_end_number_1 >= 10){
        return true;
      } else {
        return false;
      }
    } else if (row == 2){
      if (CSLocalProvider.instance.cs_scrach_end_number_2 >= 10){
        return true;
      } else {
        return false;
      }
    } else if (row == 3){
      if (CSLocalProvider.instance.cs_scrach_end_number_3 >= 10){
        return true;
      } else {
        return false;
      }
    } else if (row == 4){
      if (CSLocalProvider.instance.cs_scrach_end_number_4 >= 10){
        return true;
      } else {
        return false;
      }
    } else if (row == 5){
      if (CSLocalProvider.instance.cs_scrach_end_number_5 >= 10){
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  double getWinNumBottom(int row){
    if (row == 0){
      return 12.h;
    } else if (row == 3){
      return 8.h;
    } else if (row == 4){
      return 6.h;
    } else {
      return 12.h;
    }
  }
  double getWinNumLeft(int row){
    if (row == 0){
      return 70.w;
    } else if (row == 2){
      return 38.w;
    } else if (row == 5){
      return 88.w;
    } else {
      return 70.w;
    }
  }

  int getWinuptoNum(int row){
    if (row == 0){
      return CSNumberHelpers().gameModel!.card_fruit.winup_number;
    } else if (row == 1){
      return CSNumberHelpers().gameModel!.card_number.winup_number;
    } else if (row == 2){
      return CSNumberHelpers().gameModel!.card_tiger.winup_number;
    } else if (row == 3){
      return CSNumberHelpers().gameModel!.card_77hot.winup_number;
    } else if (row == 4){
      return CSNumberHelpers().gameModel!.card_emoji.winup_number;
    } else if (row == 5){
      return CSNumberHelpers().gameModel!.card_8rich.winup_number;
    } else {
      return CSNumberHelpers().gameModel!.card_fruit.winup_number;
    }
  }
}


class CSNavBarWidget extends StatefulWidget {
  const CSNavBarWidget({super.key});

  @override
  State<CSNavBarWidget> createState() => _CSNavBarWidgetState();
}

class _CSNavBarWidgetState extends State<CSNavBarWidget> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {

    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

   return Consumer<CSLocalProvider>(
        builder: (context, provider, child) {
          return Container(
            width: 0.width(context),
            height: 88,
            decoration: BoxDecoration(
                image: CSDImg('cs_navbar_bg')
            ),
            child: Column(
              children: [
                SizedBox(height: 40),
                Row(
                  children: [
                    SizedBox(width: 16.w),
                    ParticleButton(child: CSImg(name: 'cs_h5_icon', width: 36, height: 36), onTap: (){

                    }),
                    SizedBox(width: 8.w),
                    ParticleButton(
                      onTap: (){
                        cs_event_fire('cash_page', {'page_from' : 'home'});
                        CashTabController.switchTo(2);
                      },
                      child: Container(
                        width: 112,
                        height: 32,
                        decoration: BoxDecoration(
                            color: '#360B09'.color(),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                width: 1,
                                color: '#5E1309'.color()
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CSImg(name: 'cs_dollar_icon', width: 28, height: 28),
                            SizedBox(width: 4),
                            CSGradientNumberRoller(
                              value: provider.cs_dollar_number,
                              duration: 1800,
                              fontSize: 16.0,
                              gradientColors: ['#FFFFFF'.color(), '#FFFFFF'.color()],
                              borderColor: Colors.transparent,
                              borderWidth: 0.0,
                              decimalPlaces: 2,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    ParticleButton(
                      onTap: (){

                      }, child: Container(
                      width: 92,
                      height: 32,
                      decoration: BoxDecoration(
                          color: '#360B09'.color(),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              width: 1,
                              color: '#5E1309'.color()
                          )
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 2, top: 2,
                            child: Container(
                              width: 86 * (provider.cs_Level_inedx > 6 ? 6 : provider.cs_Level_inedx / 6.0),
                              height: 26,
                              decoration: BoxDecoration(
                                color: '#E07000'.color(),
                                borderRadius: BorderRadius.circular(12)
                              ),
                            ),
                          ),
                          Container(
                            width: 28, height: 28,
                            decoration: BoxDecoration(
                                image: CSDImg('cs_lev_bg')
                            ),
                            child: Center(
                              child: CSText(text: '${provider.cs_Level_number}', size: 12, color: '#FFFCFA'.color(), weight: FontWeight.w700),
                            ),
                          ),
                          Positioned(
                            left: 2, top: 2,
                            child: SizedBox(
                              width: 86,
                              height: 26,
                              child: Center(
                                child: CSStrokeText(text: 'LV${provider.cs_Level_number}', size: 16, color: '#FFFFFF'.color(), weight: FontWeight.w700, skWidth: 2, skColor: '#8B4600'.color()),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                    Spacer(),
                    ParticleButton(child: CSImg(name: 'cs_setting_icon', width: 32, height: 32), onTap: (){
                       context.tipShow(CSSettingDialog());
                    }),
                    SizedBox(width: 16.w)
                  ],
                ),
              ],
            ),
          );
        }
    );
  }
}

class CSHomeListNotificationService {
  static final StreamController<int> _streamController = StreamController<int>.broadcast();

  static Stream<int> get stream => _streamController.stream;

  static void sendToDomandNumberNotification(int value) {
    _streamController.sink.add(value);
  }

  static void close() {
    _streamController.close();
  }
}
