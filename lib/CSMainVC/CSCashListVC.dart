import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:cashscratchgo/CSDialog/CSDialog.dart';
import 'package:cashscratchgo/CSTool/CSNumberHelpers.dart';
import 'package:cashscratchgo/CSTool/CSTBAEventTool.dart';
import 'package:cashscratchgo/CSTool/cs_LocalProvider.dart';
import 'package:cashscratchgo/CSTool/cs_GradientNumber.dart';
import 'package:cashscratchgo/CSTool/cs_GradientText.dart';
import 'package:cashscratchgo/CSTool/cs_ad_manger.dart';
import 'package:cashscratchgo/CSTool/cs_stroke_text.dart';
import 'package:cashscratchgo/CSTool/cs_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../CSBasic/CSTabBar.dart';
import '../CSTool/CS_extension_help.dart';
import '../CSTool/cs_img.dart';
import 'CSHomeListVC.dart';
import 'CSScratchCardVC.dart';

class CSCashListVC extends StatefulWidget {
  const CSCashListVC({super.key});

  @override
  State<CSCashListVC> createState() => _CSCashListVCState();
}

class _CSCashListVCState extends State<CSCashListVC> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    CSCashListNotificationService.stream.listen((value) async {
      setState(() {});
    });
  }

  @override
  void dispose() {
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
                image: CSDImg('cs_cash_bgs')
            ),
           child: Column(
             children: [
               CSNavBarWidget(),
               SizedBox(height: 8.h),
               topListWidget(),
               SizedBox(height: 12.h),
               getTopActBananleWidget(),
               SizedBox(height: 16.h),
               getCentertTipsWidget(),
               SizedBox(height: 16.h),
               getBotoomListWidget(),
               SizedBox(height: 12.h),
             ],
           ),
          ),
        ],
      ),
    );
  }

  Widget getCentertTipsWidget(){
    return Container(
      width: 328,
      height: 32,
      decoration: BoxDecoration(
          image: CSDImg('cs_cash_center_bg')
      ),
      child: Center(
        child: CSText(text: 'Choose Withdraw Amount', size: 14, color: '#FFFAB6'.color(), weight: FontWeight.w900),
      ),
    );
  }

  Widget getBotoomListWidget(){
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          for (int i = 0; i < 4; i++)
            Container(
              width: 328.w,
              height: 116.h,
              margin: EdgeInsets.only(bottom: 12.h),
              child: Stack(
                alignment: AlignmentGeometry.center,
                children: [
                  CSImg(name: 'cs_cash_list_bg', width: 328.w, height: 116.h),
                  if (CSLocalProvider.instance.cs_dollar_number >= CSNumberHelpers().gameModel!.card_range.first && i == 0 && (CSLocalProvider.instance.cs_card_quicken_num < 20 || CSLocalProvider.instance.cs_current_ranking != 1) && CSLocalProvider.instance.cs_tx_ing_account == CSLocalProvider.instance.cs_account_seled_index)
                    getCashTwoTypeWidget(i),
                  if (i != 0 || CSLocalProvider.instance.cs_dollar_number < CSNumberHelpers().gameModel!.card_range.first || CSLocalProvider.instance.cs_tx_ing_account != CSLocalProvider.instance.cs_account_seled_index)
                    getCashOneTypeWidget(i),
                  if (CSLocalProvider.instance.cs_dollar_number >= CSNumberHelpers().gameModel!.card_range.first && i == 0 && CSLocalProvider.instance.cs_card_quicken_num >= 20 && CSLocalProvider.instance.cs_current_ranking == 1 && CSLocalProvider.instance.cs_tx_ing_account == CSLocalProvider.instance.cs_account_seled_index)
                    getCashThreeTypeWidget(i),
                ],
              ),
            ),
          Center(child: SizedBox(width: 328, height: 32,child: CSText(text: 'Tips：Cash Will Arrive In Your Account Within 24 Hours As Soon As Possible', size: 12, color: '#A97671'.color(), weight: FontWeight.w500, maxLines: 2,))),
          SizedBox(height: 22.h),
        ],
      )
    );
  }
  Widget getCashTwoTypeWidget(int row){
    return Consumer<CSLocalProvider>(
        builder: (context, provider, child) {
          return SizedBox(
            width: 328.w, height: 116.h,
            child: Stack(
              children: [
                Positioned(left: 12.w,top: 8.h,child: CSGradientStrokeText(text: '\$', gradientColors: ['#FFFFFF'.color(),'#FFF189'.color()], width: 14, height: 28, fontSize: 20, strokeWidth: 1, strokeColor: '#983300'.color(),)),
                Positioned(left: 56.w,top: 8.h,child: CSGradientStrokeText(text: '${CSNumberHelpers().gameModel!.card_range[row]}', gradientColors: ['#FFFFFF'.color(),'#FFF189'.color()], width: 14, height: 28, fontSize: 28, strokeWidth: 1, strokeColor: '#983300'.color(),)),
                Positioned(right: 12.w,top: 12.w,child: ParticleButton(child: Container(
                  width: 88,
                  height: 28,
                  decoration: BoxDecoration(
                      image: CSDImg('cs_cash_green')
                  ),
                  child: Center(
                    child: CSStrokeText(text: gettxStringStatus(), size: CSLocalProvider.instance.cs_card_quicken_num < 20 ? 10 : 14, color: '#FFFFFF'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#025C10'.color()),
                  ),
                ), onTap: (){
                  if (CSLocalProvider.instance.cs_card_quicken_num >= 20){
                     context.tipShow(CSRankDialog());
                  } else {
                    pushtoCardDetails();
                  }
                })),
                Positioned(left: 12.w,top: 48.h,child: Container(
                  width: 304.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: '#176136'.color(),
                    borderRadius: BorderRadius.circular(10.h),
                    border: Border.all(
                      width: 0.5,
                      color: '#FFB300'.color()
                    )
                  ),
                  child: Center(
                    child: CSText(text: 'Security check in progress to protect your payout', size: 10, color: '#FFFFFF'.color(), weight: FontWeight.w500),
                  ),
                )),
                Positioned(left: 12.w,bottom: 28.h,child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: CSLocalProvider.instance.cs_card_quicken_num < 20 ? 'Verification Task: ' : 'Your Current Rank:',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: CSLocalProvider.instance.cs_card_quicken_num < 20 ? 'Collect 20 Payout Boost Cards' : ' ${CSLocalProvider.instance.cs_current_ranking}',
                        style: TextStyle(color: CSLocalProvider.instance.cs_card_quicken_num < 20 ? '#FFFFFF'.color() : "#FFD91D".color(), fontSize: CSLocalProvider.instance.cs_card_quicken_num < 20 ? 10 : 12),
                      ),
                    ],
                  ),
                ),),
                Positioned(left: 12.w,bottom: 12.h,child: Container(
                  width: 180.w, height: 12.h,
                  decoration: BoxDecoration(
                      image: CSDImg('cs_cash_pro_bg')
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: constraints.maxWidth * (CSLocalProvider.instance.cs_card_quicken_num >= 20 ? (100- CSLocalProvider.instance.cs_current_ranking) / 100.0 : ((CSLocalProvider.instance.cs_card_quicken_num >= 20 ? 20 : CSLocalProvider.instance.cs_card_quicken_num) / 20)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.h),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                '#FFEA76'.color(),
                                '#F39F0E'.color(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
                Visibility(
                  visible: CSLocalProvider.instance.cs_card_quicken_num >= 20,
                  child: Positioned(right: 12.w,bottom: 8.h,child: ParticleButton(child: Container(
                    width: 72.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: '#FFD000'.color(),
                      borderRadius: BorderRadius.circular(10.h)
                    ),
                    child: Center(
                      child: CSText(text: 'Speed Up', size: 12, color: '#5C2F02'.color(), weight: FontWeight.w700),
                    ),
                  ), onTap: (){
                    CSCardAds().cs_showAd(context, 'rakwt_queue_rv', onCacheResponse: (onCacheResponse){}, adDidClosed: (adDidClosed){
                      cs_rankupdate();
                    });
                  })),
                ),
                Visibility(
                  visible: CSLocalProvider.instance.cs_card_quicken_num >= 20,
                  child: Positioned(right: 8.w,bottom: 20.h,child: ParticleButton(child: CSImg(name: 'cs_ad_icon', width: 12, height: 12), onTap: (){
                    CSCardAds().cs_showAd(context, 'rakwt_queue_rv', onCacheResponse: (onCacheResponse){}, adDidClosed: (adDidClosed){
                      cs_rankupdate();
                    });
                  })),
                ),
                Positioned(left: 200.w,bottom: 10.h,child: CSText(text:CSLocalProvider.instance.cs_card_quicken_num < 20 ? '${0.to2Double(CSLocalProvider.instance.cs_card_quicken_num)}/20' : '${(((100-CSLocalProvider.instance.cs_current_ranking) / 100) * 100).toInt()}%', size: 12, color: '#FFD91D'.color(), weight: FontWeight.w700)),
              ],
            ),
          );
        }
    );
  }
  // 排行榜
  Future<void> cs_rankupdate() async {
    int row = randomIntInRange(min: CSNumberHelpers().gameModel!.queue_number_current.int_current_delete!.first, max: CSNumberHelpers().gameModel!.queue_number_current.int_current_delete!.last);
    if (CSLocalProvider.instance.cs_current_ranking - row <= 1) {
      await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_current_rankingName, 1);
      await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_bubble_indexName, 0);
      await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_card_indexName, 0);
      await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_wheel_indexName, 0);
      await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_task_indexName, 0);
      if (!mounted) return;
      CSDialogTool.toastRanking(context, 1);
      context.tipShow(CSTXLastDialog(type: CSLocalProvider.instance.cs_tx_task_index));
      CSCashListNotificationService.sendToDomandNumberNotification(0);
    } else {
      await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_all_rankingName, CSLocalProvider.instance.cs_all_ranking - randomIntInRange(min: CSNumberHelpers().gameModel!.queue_number_all.int_all_delete!.first, max: CSNumberHelpers().gameModel!.queue_number_all.int_all_delete!.last));
      await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_current_rankingName, CSLocalProvider.instance.cs_current_ranking - row);
      Future.delayed(Duration(milliseconds: 200),(){
        if (!mounted) return;
        setState(() {
          CSDialogTool.toastRanking(context, CSLocalProvider.instance.cs_current_ranking);
          CSCashListNotificationService.sendToDomandNumberNotification(0);
        });
      });
    }
  }

  /// Returns a random integer between [min] and [max] (inclusive).
  int randomIntInRange({required int min, required int max}) {
    if (min > max) {
      throw ArgumentError('min should be less than or equal to max');
    }
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }

  // 挂卡详情页
  void pushtoCardDetails(){
    // 外部跳转挂卡详情页
    if (CSLocalProvider.instance.cs_scrach_end_number_0 < 10){
      CashTabController.switchTo(0);
      Navigator.push(
        homeKey.currentState!.context,
        MaterialPageRoute(
          builder: (_) => CSScratchCardVC(type: 0),
        ),
      );
    } else if (CSLocalProvider.instance.cs_scrach_end_number_1 < 10){
      CashTabController.switchTo(0);
      Navigator.push(
        homeKey.currentState!.context,
        MaterialPageRoute(
          builder: (_) => CSScratchCardVC(type: 1),
        ),
      );
    } else if (CSLocalProvider.instance.cs_scrach_end_number_2 < 10){
      CashTabController.switchTo(0);
      Navigator.push(
        homeKey.currentState!.context,
        MaterialPageRoute(
          builder: (_) => CSScratchCardVC(type: 2),
        ),
      );
    } else if (CSLocalProvider.instance.cs_scrach_end_number_3 < 10){
      CashTabController.switchTo(0);
      Navigator.push(
        homeKey.currentState!.context,
        MaterialPageRoute(
          builder: (_) => CSScratchCardVC(type: 3),
        ),
      );
    } else if (CSLocalProvider.instance.cs_scrach_end_number_4 < 10){
      CashTabController.switchTo(0);
      Navigator.push(
        homeKey.currentState!.context,
        MaterialPageRoute(
          builder: (_) => CSScratchCardVC(type: 4),
        ),
      );
    } else if (CSLocalProvider.instance.cs_scrach_end_number_5 < 10){
      CashTabController.switchTo(0);
      Navigator.push(
        homeKey.currentState!.context,
        MaterialPageRoute(
          builder: (_) => CSScratchCardVC(type: 5),
        ),
      );
    }
  }

  Widget getCashThreeTypeWidget(int row){
    return Consumer<CSLocalProvider>(
        builder: (context, provider, child) {
          return SizedBox(
            width: 328.w, height: 116.h,
            child: Stack(
              children: [
                Positioned(left: 12.w,top: 18.h,child: CSGradientStrokeText(text: '\$', gradientColors: ['#FFFFFF'.color(),'#FFF189'.color()], width: 14, height: 28, fontSize: 20, strokeWidth: 1, strokeColor: '#983300'.color(),)),
                Positioned(left: 56.w,top: 18.h,child: CSGradientStrokeText(text: '${CSNumberHelpers().gameModel!.card_range[row]}', gradientColors: ['#FFFFFF'.color(),'#FFF189'.color()], width: 14, height: 28, fontSize: 28, strokeWidth: 1, strokeColor: '#983300'.color(),)),
                Positioned(right: 12.w,top: 22.w,child: ParticleButton(child: Container(
                  width: 88,
                  height: 28,
                  decoration: BoxDecoration(
                      image: CSDImg('cs_cash_green')
                  ),
                  child: Center(
                    child: CSStrokeText(text: gettxStringStatus(), size: CSLocalProvider.instance.cs_card_quicken_num < 20 ? 10 : 14, color: '#FFFFFF'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#025C10'.color()),
                  ),
                ), onTap: (){
                  context.tipShow(CSTXLastDialog(type: CSLocalProvider.instance.cs_tx_task_index));
                })),
                Positioned(left: 48.w,bottom: 10.h,child: Container(
                  width: 228.w, height: 12.h,
                  decoration: BoxDecoration(
                      image: CSDImg('cs_cash_pro_bg')
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: constraints.maxWidth * getTaskProgress(),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.h),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                '#FFEA76'.color(),
                                '#F39F0E'.color(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
                Positioned(left: 48.w,bottom: 26.h,child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: getTaskTopString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: '${CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num}',
                        style: TextStyle(color: "#FFD91D".color(), fontSize: 12),
                      ),
                      TextSpan(
                        text: getTaskbottomString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),),
                Positioned(right: 12.w,bottom: 10.h,child: CSText(text: getTaskSize(), size: 12, color: '#FFD91D'.color(), weight: FontWeight.w700)),
                Positioned(left: 12.w,bottom: 8.h,child: CSImg(name: getTaskImageNameString(), width: 32, height: 32)),
              ],
            ),
          );
        }
    );
  }
  // 文案
  String getTaskString(){
    if (CSLocalProvider.instance.cs_tx_task_index == 0){
      return 'Scratch ${CSLocalProvider.instance.cs_tx_card_index}/${CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num} Cards';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 1){
      return 'Spin ${CSLocalProvider.instance.cs_tx_wheel_index}/${CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num} Times';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 2){
      return 'Watch ${CSLocalProvider.instance.cs_tx_bubble_index}/${CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num} Ad Video';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 3){
      return 'Scratch ${CSLocalProvider.instance.cs_tx_card_index}/${CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num} Cards';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 4){
      return 'Spin ${CSLocalProvider.instance.cs_tx_wheel_index}/${CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num} Times';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 5){
      return 'Watch ${CSLocalProvider.instance.cs_tx_bubble_index}/${CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num} Ad Video';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 6){
      return 'Scratch ${CSLocalProvider.instance.cs_tx_card_index}/${CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num} Cards';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 7){
      return 'Spin ${CSLocalProvider.instance.cs_tx_wheel_index}/${CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num} Times';
    } else {
      return 'Watch ${CSLocalProvider.instance.cs_tx_bubble_index}/${CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num} Ad Video';
    }
  }
  String getTaskImageNameString(){
    if (CSLocalProvider.instance.cs_tx_task_index == 0){
      return 'cs_tx_card';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 1){
      return 'cs_tx_wheel';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 2){
      return 'cs_dolas_bubble';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 3){
      return 'cs_tx_card';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 4){
      return 'cs_tx_wheel';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 5){
      return 'cs_dolas_bubble';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 6){
      return 'cs_tx_card';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 7){
      return 'cs_tx_wheel';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 8){
      return 'cs_dolas_bubble';
    } else {
      return 'cs_dolas_bubble';
    }
  }
  String getTaskTopString(){
    if (CSLocalProvider.instance.cs_tx_task_index == 0){
      return 'Scratch ';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 1){
      return 'Spin ';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 2){
      return 'Watch ';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 3){
      return 'Scratch ';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 4){
      return 'Spin ';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 5){
      return 'Watch ';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 6){
      return 'Scratch ';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 7){
      return 'Spin ';
    } else {
      return 'Watch ';
    }
  }
  String getTaskbottomString(){
    if (CSLocalProvider.instance.cs_tx_task_index == 0){
      return ' Cards ';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 1){
      return ' Times ';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 2){
      return ' Ad Video ';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 3){
      return ' Cards ';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 4){
      return ' Times ';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 5){
      return ' Ad Video ';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 6){
      return ' Cards ';
    } else if (CSLocalProvider.instance.cs_tx_task_index == 7){
      return ' Times ';
    } else {
      return 'Ad Video ';
    }
  }
  // 提现任务进度
  String getTaskSize(){
      if (CSLocalProvider.instance.cs_tx_task_index == 0){
        return '${CSLocalProvider.instance.cs_tx_card_index}/${CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num}';
      } else if (CSLocalProvider.instance.cs_tx_task_index == 1){
        return '${CSLocalProvider.instance.cs_tx_wheel_index}/${CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num}';
      } else if (CSLocalProvider.instance.cs_tx_task_index == 2){
        return '${CSLocalProvider.instance.cs_tx_bubble_index}/${CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num}';
      } else if (CSLocalProvider.instance.cs_tx_task_index == 3){
        return '${CSLocalProvider.instance.cs_tx_card_index}/${CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num}';
      } else if (CSLocalProvider.instance.cs_tx_task_index == 4){
        return '${CSLocalProvider.instance.cs_tx_wheel_index}/${CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num}';
      } else if (CSLocalProvider.instance.cs_tx_task_index == 5){
        return '${CSLocalProvider.instance.cs_tx_bubble_index}/${CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num}';
      } else if (CSLocalProvider.instance.cs_tx_task_index == 6){
        return '${CSLocalProvider.instance.cs_tx_card_index}/${CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num}';
      } else if (CSLocalProvider.instance.cs_tx_task_index == 7){
        return '${CSLocalProvider.instance.cs_tx_wheel_index}/${CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num}';
      } else if (CSLocalProvider.instance.cs_tx_task_index == 8){
        return '${CSLocalProvider.instance.cs_tx_bubble_index}/${CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num}';
      }
    return '';
  }

  double getTaskProgress(){
    if (CSLocalProvider.instance.cs_pig_level == 1){
      return CSLocalProvider.instance.cs_pig_level_index / 20;
    } else if (CSLocalProvider.instance.cs_pig_level == 2 && CSLocalProvider.instance.cs_tx_ing_status == false) {
      return CSLocalProvider.instance.cs_pig_level_index / 10;
    } else if (CSLocalProvider.instance.cs_pig_level_index >= 10 && CSLocalProvider.instance.cs_pig_level == 2 && CSLocalProvider.instance.cs_current_ranking != 1) {
      return (99 - CSLocalProvider.instance.cs_current_ranking) / 99;
    } else if (CSLocalProvider.instance.cs_current_ranking <= 1) {
      if (CSLocalProvider.instance.cs_tx_task_index == 0){
        return CSLocalProvider.instance.cs_tx_card_index / CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num;
      } else if (CSLocalProvider.instance.cs_tx_task_index == 1){
        return CSLocalProvider.instance.cs_tx_wheel_index / CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num;
      } else if (CSLocalProvider.instance.cs_tx_task_index == 2){
        return CSLocalProvider.instance.cs_tx_bubble_index / CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num;
      } else if (CSLocalProvider.instance.cs_tx_task_index == 3){
        return CSLocalProvider.instance.cs_tx_card_index / CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num;
      } else if (CSLocalProvider.instance.cs_tx_task_index == 4){
        return CSLocalProvider.instance.cs_tx_wheel_index / CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num;
      } else if (CSLocalProvider.instance.cs_tx_task_index == 5){
        return CSLocalProvider.instance.cs_tx_bubble_index / CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num;
      } else if (CSLocalProvider.instance.cs_tx_task_index == 6){
        return CSLocalProvider.instance.cs_tx_card_index / CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num;
      } else if (CSLocalProvider.instance.cs_tx_task_index == 7){
        return CSLocalProvider.instance.cs_tx_wheel_index / CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num;
      } else if (CSLocalProvider.instance.cs_tx_task_index == 8){
        return CSLocalProvider.instance.cs_tx_bubble_index / CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num;
      }
    }
    return 0;
  }

  String gettxStringStatus(){
    if (CSLocalProvider.instance.cs_card_quicken_num < 20){
      return 'Unlock Payout';
    } else if (CSLocalProvider.instance.cs_current_ranking != 1){
      return 'In Queue';
    } else {
      return 'Claim';
    }
  }

  Widget getCashOneTypeWidget(int row){
    return Consumer<CSLocalProvider>(
        builder: (context, provider, child) {
          return SizedBox(
            width: 328.w, height: 116.h,
            child: Stack(
              children: [
                Positioned(left: 12.w,top: 18.h,child: CSGradientStrokeText(text: '\$', gradientColors: ['#FFFFFF'.color(),'#FFF189'.color()], width: 14, height: 28, fontSize: 20, strokeWidth: 1, strokeColor: '#983300'.color(),)),
                Positioned(left: 56.w,top: 18.h,child: CSGradientStrokeText(text: '${CSNumberHelpers().gameModel!.card_range[row]}', gradientColors: ['#FFFFFF'.color(),'#FFF189'.color()], width: 14, height: 28, fontSize: 28, strokeWidth: 1, strokeColor: '#983300'.color(),)),
                Positioned(right: 12.w,top: 22.w,child: ParticleButton(child: Container(
                  width: 88,
                  height: 28,
                  decoration: BoxDecoration(
                      image: CSDImg('cs_cash_green')
                  ),
                  child: Center(
                    child: CSStrokeText(text: 'Cash Out', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#025C10'.color()),
                  ),
                ), onTap: (){
                  tapWtdEvent(row);
                })),
                Positioned(left: 12.w,bottom: 18.h,child: CSImg(name: 'cs_cash_bubble', width: 32, height: 32)),
                Positioned(left: 48.w,bottom: 28.h,child: Container(
                  width: 228.w, height: 12.h,
                  decoration: BoxDecoration(
                      image: CSDImg('cs_cash_pro_bg')
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: constraints.maxWidth * (CSLocalProvider.instance.cs_dollar_number / CSNumberHelpers().gameModel!.card_range[row]),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.h),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                '#FFEA76'.color(),
                                '#F39F0E'.color(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
                Positioned(right: 16.w,bottom: 28.h,child: CSText(text: '${((CSLocalProvider.instance.cs_dollar_number / CSNumberHelpers().gameModel!.card_range[row]) * 100).toInt()}%', size: 12, color: '#FFD91D'.color(), weight: FontWeight.w700)),
              ],
            ),
          );
        }
    );
  }

  Widget topListWidget(){
    final List<String> items = List.generate(11, (index) => 'cs_cash_list_${index}_${CSLocalProvider.instance.cs_account_seled_index == index ? 's' : "n"}');
    return Container(
      width: 328.w,
      height: 44, // cell 高度
      decoration: BoxDecoration(
        image: CSDImg('cs_cash_top_bg')
      ),
      child: ListView.separated(
        padding: EdgeInsetsGeometry.only(left: 4, right: 4),
        scrollDirection: Axis.horizontal, // 横向滚动
        itemCount: items.length,
        separatorBuilder: (context, index) => SizedBox(width: 4), // 间距 4
        itemBuilder: (context, index) {
          return SizedBox(
            width: 100, // cell 宽度
            height: 44,
            child: ParticleButton(child: Center(
              child: CSImg(name: items[index], width: 100, height: 36),
            ), onTap: () async {
              await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_account_seled_indexName, index);
              setState(() {});
            }),
          );
        },
      ),
    );
  }
  Widget getTopActBananleWidget(){
    return  Container(
      width: 328.w,
      height: 104.w,
      decoration: BoxDecoration(
          image: CSDImg('cs_top_act_bg')
      ),
      child: Stack(
        children: [
          Positioned(left: 12.w, top: 36.h,child: CSText(text: 'My Balance', size: 12, color: '#FFFFFF'.color(), weight: FontWeight.w500)),
          Positioned(left: 11.w, top: 51.h,child:
          Consumer<CSLocalProvider>(
              builder: (context, provider, child) {
                return CSGradientNumberRoller(
                  value: provider.cs_dollar_number,
                  duration: 1800,
                  fontSize: 32.0,
                  gradientColors: ['#FFFFFF'.color(), '#FFF189'.color()],
                  borderColor: '#983300'.color(),
                  borderWidth: 1,
                  decimalPlaces: 2,
                );
              }
          )),
          // Positioned(right: 12.w,bottom: 16.w,child: ParticleButton(child: Container(
          //   width: 88,
          //   height: 28,
          //   decoration: BoxDecoration(
          //     image: CSDImg('cs_cash_green')
          //   ),
          //   child: Center(
          //     child: CSStrokeText(text: 'Cash Out', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#025C10'.color()),
          //   ),
          // ), onTap: (){
          //
          // })),
          Positioned(right: 4.w,top: 4.w,child: CSImg(name: 'cs_cash_home_${CSLocalProvider.instance.cs_account_seled_index}', width: 60, height: 60)),
        ],
      ),
    );
  }
  
  void tapWtdEvent(int row){
    cs_event_fire('cash_page_c', {});
    if (CSLocalProvider.instance.cs_dollar_number < CSNumberHelpers().gameModel!.card_range[row]){
      context.tipShow(CSNotCashDialog(row: row));
    } else {
      CSDialogTool.toast(context, 'Please complete the withdrawal for the first tier first.');
    }
  }

}

class CSCashListNotificationService {
  static final StreamController<int> _streamController = StreamController<int>.broadcast();

  static Stream<int> get stream => _streamController.stream;

  static void sendToDomandNumberNotification(int value) {
    _streamController.sink.add(value);
  }

  static void close() {
    _streamController.close();
  }
}