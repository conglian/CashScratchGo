import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:cashscratchgo/CSDialog/CSDialog.dart';
import 'package:cashscratchgo/CSTool/CSLocalImageScratchCard.dart';
import 'package:cashscratchgo/CSTool/CSNumberHelpers.dart';
import 'package:cashscratchgo/CSTool/cs_GradientText.dart';
import 'package:cashscratchgo/CSTool/cs_ad_manger.dart';
import 'package:cashscratchgo/CSTool/cs_extension_help.dart';
import 'package:cashscratchgo/CSTool/cs_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../CSBasic/CSTabBar.dart';
import '../CSDialog/CSGuideDialog.dart';
import '../CSTool/CSTBAEventTool.dart';
import '../CSTool/cs_GradientNumber.dart';
import '../CSTool/cs_LocalProvider.dart';
import '../CSTool/cs_stroke_text.dart';
import '../CSTool/cs_text.dart';
import 'CSCashListVC.dart';
import 'CSHomeListVC.dart';
import 'CSLuckySpineVC.dart';


final GlobalKey targetKey = GlobalKey();

class CSScratchCardVC extends StatefulWidget {
  final int type;
  const CSScratchCardVC({super.key, required this.type});

  @override
  State<CSScratchCardVC> createState() => _CSScratchCardVCState();
}

class _CSScratchCardVCState extends State<CSScratchCardVC> with SingleTickerProviderStateMixin {

  bool _show_animation = false;

  List<dynamic> card_award = [];

  @override
  void initState() {
    super.initState();
    getCardContent();
    print('CSLocalProvider.instance.cs_dolas_number=${CSLocalProvider.instance.cs_dollar_number}');
  }

  Future<void> getCardContent() async {
    if (widget.type == 0){
      card_award = await CSNumberHelpers().getFruitMatch();
      setState(() {});
    } else if (widget.type == 1){
      card_award = await CSNumberHelpers().getBigGame();
      setState(() {});
    } else if (widget.type == 2){
      card_award = await CSNumberHelpers().getTigerWinner();
      setState(() {});
    } else if (widget.type == 3){
      card_award = await CSNumberHelpers().get77hot();
      setState(() {});
    } else if (widget.type == 4){
      card_award = await CSNumberHelpers().getcard_emoji();
      setState(() {});
    } else if (widget.type == 5){
      card_award = await CSNumberHelpers().getcard_8rich();
      setState(() {});
    }
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
              image: CSDImg('cs_card_bgs_${widget.type}')
            ),
            child: Column(
              children: [
                CSCardNavBarWidget(),
                widget.type == 0 ? getTopCardNumWidget() : getTopCardNumGrand(),
                getTopimageWidget(),
                getCenterNumWidget(),
                getScratchCardWidget(),
                getBottomTipsWidget(),
                Spacer(),
                getBottomWidget(),
                SizedBox(height: 8.h)
              ],
            ),
          ),
          Positioned(left: 12.w, top: 92.h,
            child: Consumer<CSLocalProvider>(
                builder: (context, provider, child) {
                  return Container(
                    width: 68,
                    height: 68,
                    decoration: BoxDecoration(
                      image: CSDImg('cs_box_btn')
                    ),
                    child: Center(child: GradientCircleProgress(progress: provider.cs_scratch_box_index / 5.0)),
                  );
                }
            ),
          ),
          Positioned(child: CSBubbleButton()),
        ],
      ),
    );
  }
  Widget getScratchCardWidget(){
    if (widget.type == 0){
      if (card_award.isEmpty == true){
        return SizedBox();
      }
      return SizedBox(
        width: 0.width(context),
        height: 251.h,
        child: Column(
          children: [
            SizedBox(height: 11.h),
            SizedBox(
              width: 328.w,
              height: 240.h,
              child: CSLocalImageScratchCard(coverImagePath:'cs_card_top_${widget.type}'.image(), contentW: 328.w, contentH: 240.h, autoStartY: 20.h,child: Container(
                width: 328.w,
                height: 240.h,
                decoration: BoxDecoration(
                    image: CSDImg('cs_card_bg_${widget.type}')
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: .spaceAround,
                      children: [
                        CSBouncyText(text: '\$${card_award[5][0]}', fontSize: 20, color: '#FFE733'.color(), fontWeight: FontWeight.w900, enableAnimation: card_award[0] == 0 && _show_animation),
                        CSBouncyText(text: '\$${card_award[5][1]}', fontSize: 20, color: '#FFE733'.color(), fontWeight: FontWeight.w900, enableAnimation: card_award[0] == 1 && _show_animation),
                        CSBouncyText(text: '\$${card_award[5][2]}', fontSize: 20, color: '#FFE733'.color(), fontWeight: FontWeight.w900, enableAnimation: card_award[0] == 2 && _show_animation),
                      ],
                    ),
                    SizedBox(width: 20.h,),
                    SizedBox(
                      width: 222.w,
                      height: 240.h,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // 一行5个
                          mainAxisSpacing: 0, // 垂直间距
                          crossAxisSpacing: 4, // 水平间距
                          childAspectRatio: 88.w / 88, // 宽高比
                        ),
                        itemCount: 9,
                        padding: EdgeInsets.only(top: 10.h, left: 0.w), // 移除默认的padding// 最多显示10个
                        itemBuilder: (context, index) {
                          return SizedBox(
                              child: Stack(
                                clipBehavior: .none,
                                  children: [
                                    Positioned(top: 10.h,left: 0.w,child: Row(
                                      children: [
                                        if (card_award[3][index] == -1)
                                          CSAnimatedImageMove(imageUrl: 'cs_key_icon', isAnimationEnabled: _show_animation, ws: 64, hs: 64, targetKey: targetKey),
                                        if (card_award[3][index] != -1)
                                          CSBouncyImage(imagePath: 'cs_card1_icon_${card_award[3][index]}', width: 64, height: 64, enableAnimation:(card_award[0] == 0 && (index == 0 || index == 1 || index == 2) && _show_animation) || (card_award[0] == 1 && (index == 3 || index == 4 || index == 5) && _show_animation) || (card_award[0] == 2 && (index == 4 || index == 5 || index == 6) && _show_animation))
                                      ],
                                    )),
                                  ]
                              )
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),onScratchEnd: () async {
                setState(() {
                  _show_animation = true;
                });
                Future.delayed(Duration(milliseconds: 2000),() async {
                  // key
                  if (card_award[1] == 1){
                    await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_wheel_numberName, CSLocalProvider.instance.cs_wheel_number + 1);
                    Future.delayed(Duration(milliseconds: 100),() async {
                      CSLuckyWheelNotificationService.sendToDomandNumberNotification(0);
                    });
                  }
                  // num
                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scrach_end_number_0Name, CSLocalProvider.instance.cs_scrach_end_number_0 + 1);
                  // box
                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_box_indexName, CSLocalProvider.instance.cs_scratch_box_index + 1);
                  // guaka index
                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_gua_indexName, CSLocalProvider.instance.cs_scratch_gua_index + 1);

                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_num_rowName, CSLocalProvider.instance.cs_scratch_num_row + 1);

                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_num_indexName, CSLocalProvider.instance.cs_scratch_num_index + 1);

                  await CSLocalProvider.instance.updateString(CSLocalProvider.instance.cs_scrach_end_time_0Name, DateTime.now().toIso8601String());

                  Future.delayed(Duration(milliseconds: 100),() async {
                    CSHomeListNotificationService.sendToDomandNumberNotification(0);
                  });

                  if (card_award[2] == 1){
                    if (card_award[4] >= CSNumberHelpers().getbigwinNum()){
                      int code = await context.tipShow2(CSBigwinDialog(award: card_award[4], isGuide: false));
                      if (code >= 0){
                        if (CSLocalProvider.instance.cs_scrach_end_number_0 >= 10){
                          Navigator.pop(context);
                        } else {
                          showTXPopDialog();
                        }
                      }
                    } else {
                      int code = await context.tipShow2(CSCashWinDialog(award: card_award[4], isGuide: false));
                      if (code >= 0){
                        if (CSLocalProvider.instance.cs_scrach_end_number_0 >= 10){
                          Navigator.pop(context);
                        } else {
                          showTXPopDialog();
                        }
                      }
                    }
                  } else {
                    int code = await context.tipShow2(CSNotAwardDialog());
                    if (code >= 0){
                      if (CSLocalProvider.instance.cs_scrach_end_number_0 >= 10){
                        Navigator.pop(context);
                      } else {
                        showTXPopDialog();
                      }
                    }
                  }
                  card_award = await CSNumberHelpers().getFruitMatch();
                  // 刷新下一张
                  CSScratchUpdateNotificationService.sendToDomandNumberNotification(0);

                  setState(() {
                    _show_animation = false;
                  });
                });
              },),
            )

          ],
        ),
      );
    } else if (widget.type == 1){
      if (card_award.isEmpty == true){
        return SizedBox();
      }
      return SizedBox(
        width: 0.width(context),
        height: 312.h,
        child: Column(
          children: [
            SizedBox(height: 4.h),
            SizedBox(
              width: 328.w,
              height: 308.h,
              child: CSLocalImageScratchCard(coverImagePath:'cs_card_top_${widget.type}'.image(), contentW: 328.w, contentH: 308.h, autoStartY: 20,child: Container(
                width: 328.w,
                height: 308.h,
                decoration: BoxDecoration(
                    image: CSDImg('cs_card_bg_${widget.type}')
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        CSBouncyText(text: '${card_award[3][0]}', fontSize: 36, color: '#FFF1A9'.color(), fontWeight: FontWeight.w900, enableAnimation: card_award[3][0] == card_award[4] && _show_animation),
                        CSBouncyText(text: '${card_award[3][1]}', fontSize: 36, color: '#FFF1A9'.color(), fontWeight: FontWeight.w900, enableAnimation: card_award[3][1] == card_award[4] && _show_animation),
                        CSBouncyText(text: '${card_award[3][2]}', fontSize: 36, color: '#FFF1A9'.color(), fontWeight: FontWeight.w900, enableAnimation: card_award[3][2] == card_award[4] && _show_animation),
                      ],
                    ),
                    SizedBox(height: 0.h),
                    SizedBox(
                      width: 328.w,
                      height: 225.h,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, // 一行5个
                          mainAxisSpacing: 0, // 垂直间距
                          crossAxisSpacing: 0, // 水平间距
                          childAspectRatio: (328 / 4.0).w / 75.h, // 宽高比
                        ),
                        itemCount: 12,
                        padding: EdgeInsets.only(top: 12.h, left: 18.w), // 移除默认的padding// 最多显示10个
                        itemBuilder: (context, index) {
                          return SizedBox(
                              width: (328 / 4.0).w,
                              height: 75.h,
                              child: Stack(
                                clipBehavior: .none,
                                children: [
                                  Visibility(
                                    visible: _show_animation && index == card_award[0],
                                    child: Lottie.asset(
                                      fit: BoxFit.fill,
                                      "guang.zip".files(),
                                      repeat: true,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      if (card_award[6][index] == -1)
                                        CSAnimatedImageMove(imageUrl: 'cs_key_icon', isAnimationEnabled: _show_animation, ws: 55, hs: 48, targetKey: targetKey),
                                      if (card_award[6][index] != -1)
                                        Padding(padding: EdgeInsetsGeometry.only(left: 8.w, top: 2.h),child: CSBouncyText(text: '${card_award[6][index]}', fontSize: 32, color: '#FFF1A9'.color(), fontWeight: FontWeight.w900, enableAnimation: _show_animation && index == card_award[0])),
                                      if (card_award[6][index] != -1)
                                        CSStrokeText(text: '\$${card_award[5][index]}', size: 16, color: '#FFDD1F'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#000000'.color())
                                    ],
                                  )
                                ],
                              )
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),onScratchEnd: (){
                setState(() {
                  _show_animation = true;
                });
                Future.delayed(Duration(milliseconds: 2000),() async {
                  // key
                  if (card_award[1] == 1){
                    await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_wheel_numberName, CSLocalProvider.instance.cs_wheel_number + 1);
                    Future.delayed(Duration(milliseconds: 100),() async {
                      CSLuckyWheelNotificationService.sendToDomandNumberNotification(0);
                    });
                  }
                  // num
                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scrach_end_number_1Name, CSLocalProvider.instance.cs_scrach_end_number_1 + 1);
                  // box
                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_box_indexName, CSLocalProvider.instance.cs_scratch_box_index + 1);
                  // guaka index
                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_gua_indexName, CSLocalProvider.instance.cs_scratch_gua_index + 1);

                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_num_rowName, CSLocalProvider.instance.cs_scratch_num_row + 1);

                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_num_indexName, CSLocalProvider.instance.cs_scratch_num_index + 1);

                  await CSLocalProvider.instance.updateString(CSLocalProvider.instance.cs_scrach_end_time_1Name, DateTime.now().toIso8601String());

                  Future.delayed(Duration(milliseconds: 100),() async {
                    CSHomeListNotificationService.sendToDomandNumberNotification(0);
                  });

                  if (card_award[2] == 1){
                    if (card_award[4] >= CSNumberHelpers().getbigwinNum()){
                      int code = await context.tipShow2(CSBigwinDialog(award: card_award[4], isGuide: false));
                      if (code >= 0){
                        if (CSLocalProvider.instance.cs_scrach_end_number_1 >= 10){
                          Navigator.pop(context);
                        } else {
                          showTXPopDialog();
                        }
                      }
                    } else {
                      int code = await context.tipShow2(CSCashWinDialog(award: card_award[4], isGuide: false));
                      if (code >= 0){
                        if (CSLocalProvider.instance.cs_scrach_end_number_1 >= 10){
                          Navigator.pop(context);
                        } else {
                          showTXPopDialog();
                        }
                      }
                    }
                  } else {
                    int code = await context.tipShow2(CSNotAwardDialog());
                    if (code >= 0){
                      if (CSLocalProvider.instance.cs_scrach_end_number_1 >= 10){
                        Navigator.pop(context);
                      } else {
                        showTXPopDialog();
                      }
                    }
                  }
                  card_award = await CSNumberHelpers().getBigGame();
                  // 刷新下一张
                  CSScratchUpdateNotificationService.sendToDomandNumberNotification(0);

                  setState(() {
                    _show_animation = false;
                  });
                });
              },),
            )

          ],
        ),
      );
    } else if (widget.type == 2){
      return SizedBox(
        width: 0.width(context),
        height: 312.h,
        child: Column(
          children: [
            SizedBox(height: 8.h),
            SizedBox(
              width: 328.w,
              height: 304.h,
              child: CSLocalImageScratchCard(coverImagePath:'cs_card_top_${widget.type}'.image(), contentW: 328.w, contentH: 308.h, autoStartY: 20.h,child: Container(
                width: 328.w,
                height: 304.h,
                decoration: BoxDecoration(
                    image: CSDImg('cs_card_bg_${widget.type}')
                ),
                child: Column(
                  children: [
                    SizedBox(height: 32.h),
                    Row(
                      children: [
                        SizedBox(width: 52.w),
                        SizedBox(
                          width: 38,
                          height: 46.h,
                          child: Column(
                            children: [
                              CSBouncyChild(child:CSGradientStrokeText(text: '3', gradientColors: ['#FFE851'.color(),'#FF8400'.color()], width: 22, height: 15.5, fontSize: 18, strokeWidth: 1, strokeColor: '#382128'.color()), enableAnimation: card_award[5] == 3),
                              CSBouncyChild(child: CSStrokeText(text: 'x1', size: 12, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#8C0404'.color()), enableAnimation: card_award[5] == 3),
                              CSBouncyChild(child: CSStrokeText(text: 'BET', size: 12, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#8C0404'.color()), enableAnimation: card_award[5] == 3),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 38,
                          height: 46.h,
                          child: Column(
                            children: [
                              CSBouncyChild(child: CSGradientStrokeText(text: '4', gradientColors: ['#FFE851'.color(),'#FF8400'.color()], width: 22, height: 15.5, fontSize: 18, strokeWidth: 1, strokeColor: '#382128'.color()), enableAnimation: card_award[5] == 4),
                              CSBouncyChild(child: CSStrokeText(text: 'x2', size: 12, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#8C0404'.color()), enableAnimation: card_award[5] == 4),
                              CSBouncyChild(child: CSStrokeText(text: 'BET', size: 12, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#8C0404'.color()), enableAnimation: card_award[5] == 4),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 38,
                          height: 46.h,
                          child: Column(
                            children: [
                              CSBouncyChild(child: CSGradientStrokeText(text: '5', gradientColors: ['#FFE851'.color(),'#FF8400'.color()], width: 22, height: 15.5, fontSize: 18, strokeWidth: 1, strokeColor: '#382128'.color()), enableAnimation: card_award[5] == 5),
                              CSBouncyChild(child: CSStrokeText(text: 'x3', size: 12, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#8C0404'.color()), enableAnimation: card_award[5] == 5),
                              CSBouncyChild(child: CSStrokeText(text: 'BET', size: 12, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#8C0404'.color()), enableAnimation: card_award[5] == 5),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 38,
                          height: 46.h,
                          child: Column(
                            children: [
                              CSBouncyChild(child: CSGradientStrokeText(text: '6', gradientColors: ['#FFE851'.color(),'#FF8400'.color()], width: 22, height: 15.5, fontSize: 18, strokeWidth: 1, strokeColor: '#382128'.color()), enableAnimation: card_award[5] == 6),
                              CSBouncyChild(child: CSStrokeText(text: 'x4', size: 12, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#8C0404'.color()), enableAnimation: card_award[5] == 6),
                              CSBouncyChild(child: CSStrokeText(text: 'BET', size: 12, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#8C0404'.color()), enableAnimation: card_award[5] == 6),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 38,
                          height: 46.h,
                          child: Column(
                            children: [
                              CSBouncyChild(child: CSGradientStrokeText(text: '7', gradientColors: ['#FFE851'.color(),'#FF8400'.color()], width: 22, height: 15.5, fontSize: 18, strokeWidth: 1, strokeColor: '#382128'.color()), enableAnimation: card_award[5] == 7),
                              CSBouncyChild(child: CSStrokeText(text: 'x5', size: 12, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#8C0404'.color()), enableAnimation: card_award[5] == 7),
                              CSBouncyChild(child: CSStrokeText(text: 'BET', size: 12, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#8C0404'.color()), enableAnimation: card_award[5] == 7),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 38,
                          height: 46.h,
                          child: Column(
                            children: [
                              CSBouncyChild(child: CSGradientStrokeText(text: '8', gradientColors: ['#FFE851'.color(),'#FF8400'.color()], width: 22, height: 15.5, fontSize: 18, strokeWidth: 1, strokeColor: '#382128'.color()), enableAnimation: card_award[5] == 8),
                              CSBouncyChild(child: CSStrokeText(text: 'x6', size: 12, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#8C0404'.color()), enableAnimation: card_award[5] == 8),
                              CSBouncyChild(child: CSStrokeText(text: 'BET', size: 12, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#8C0404'.color()), enableAnimation: card_award[5] == 8),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 38,
                          height: 46.h,
                          child: Column(
                            children: [
                              CSBouncyChild(child: CSGradientStrokeText(text: '9', gradientColors: ['#FFE851'.color(),'#FF8400'.color()], width: 22, height: 15.5, fontSize: 18, strokeWidth: 1, strokeColor: '#382128'.color()), enableAnimation: card_award[5] == 9),
                              CSBouncyChild(child: CSStrokeText(text: 'x7', size: 12, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#8C0404'.color()), enableAnimation: card_award[5] == 9),
                              CSBouncyChild(child: CSStrokeText(text: 'BET', size: 12, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#8C0404'.color()), enableAnimation: card_award[5] == 9),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 328.w,
                      height: 225.h,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, // 一行5个
                          mainAxisSpacing: 0, // 垂直间距
                          crossAxisSpacing: 0, // 水平间距
                          childAspectRatio: (328 / 4.0).w / 75.h, // 宽高比
                        ),
                        itemCount: 12,
                        padding: EdgeInsets.only(top: 12.h, left: 18.w), // 移除默认的padding// 最多显示10个
                        itemBuilder: (context, index) {
                          return SizedBox(
                              width: (328 / 4.0).w,
                              height: 75.h,
                              child: Stack(
                                children: [
                                  Visibility(
                                    visible: card_award[3][index] == 0,
                                    child: Lottie.asset(
                                      fit: BoxFit.fill,
                                      "guang.zip".files(),
                                      repeat: true,
                                    ),
                                  ),
                                  if (card_award[2][index] == -1)
                                    Center(child: CSAnimatedImageMove(imageUrl: 'cs_key_icon', isAnimationEnabled: _show_animation, ws: 50, hs: 50, targetKey: targetKey)),
                                  if (card_award[2][index] != -1)
                                    CSBouncyImage(imagePath: 'cs_card3_${card_award[2][index]}', width: 68.w, height: 68.w, enableAnimation: _show_animation && card_award[2][index] == 0),
                                  Column(
                                    children: [
                                      SizedBox(height: 50.h),
                                      CSStrokeText(text: '\$${card_award[3][index]}', size: 16, color: '#FFDD1F'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#000000'.color())
                                    ],
                                  )
                                ],
                              )
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),onScratchEnd: (){
                setState(() {
                  _show_animation = true;
                });
                Future.delayed(Duration(milliseconds: 2000),() async {
                  // key
                  if (card_award[0] == 1){
                    await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_wheel_numberName, CSLocalProvider.instance.cs_wheel_number + 1);
                    Future.delayed(Duration(milliseconds: 100),() async {
                      CSLuckyWheelNotificationService.sendToDomandNumberNotification(0);
                    });
                  }
                  // num
                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scrach_end_number_2Name, CSLocalProvider.instance.cs_scrach_end_number_2 + 1);
                  // box
                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_box_indexName, CSLocalProvider.instance.cs_scratch_box_index + 1);
                  // guaka index
                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_gua_indexName, CSLocalProvider.instance.cs_scratch_gua_index + 1);

                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_num_rowName, CSLocalProvider.instance.cs_scratch_num_row + 1);

                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_num_indexName, CSLocalProvider.instance.cs_scratch_num_index + 1);

                  await CSLocalProvider.instance.updateString(CSLocalProvider.instance.cs_scrach_end_time_2Name, DateTime.now().toIso8601String());

                  Future.delayed(Duration(milliseconds: 100),() async {
                    CSHomeListNotificationService.sendToDomandNumberNotification(0);
                  });

                  if (card_award[1] == 1){
                    if (card_award[4] >= CSNumberHelpers().getbigwinNum()){
                      int code = await context.tipShow2(CSBigwinDialog(award: card_award[4], isGuide: false));
                      if (code >= 0){
                        if (CSLocalProvider.instance.cs_scrach_end_number_2 >= 10){
                          Navigator.pop(context);
                        } else {
                          showTXPopDialog();
                        }
                      }
                    } else {
                      int code = await context.tipShow2(CSCashWinDialog(award: card_award[4], isGuide: false));
                      if (code >= 0){
                        if (CSLocalProvider.instance.cs_scrach_end_number_2 >= 10){
                          Navigator.pop(context);
                        } else {
                          showTXPopDialog();
                        }
                      }
                    }
                  } else {
                    int code = await context.tipShow2(CSNotAwardDialog());
                    if (code >= 0){
                      if (CSLocalProvider.instance.cs_scrach_end_number_2 >= 10){
                        Navigator.pop(context);
                      } else {
                        showTXPopDialog();
                      }
                    }
                  }
                  card_award = await CSNumberHelpers().getTigerWinner();
                  // 刷新下一张
                  CSScratchUpdateNotificationService.sendToDomandNumberNotification(0);

                  setState(() {
                    _show_animation = false;
                  });
                });
              },),
            )

          ],
        ),
      );
    } else if (widget.type == 3){
      return SizedBox(
        width: 0.width(context),
        height: 260.h,
        child: Column(
          children: [
            SizedBox(height: 8.h),
            SizedBox(
              width: 328.w,
              height: 252.h,
              child: CSLocalImageScratchCard(coverImagePath:'cs_card_top_${widget.type}'.image(), contentW: 328.w, contentH: 252.h, autoStartY: 20.h,child: Container(
                width: 328.w,
                height: 252.h,
                decoration: BoxDecoration(
                    image: CSDImg('cs_card_bg_${widget.type}')
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 328.w,
                      height: 252.h,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, // 一行5个
                          mainAxisSpacing: 0, // 垂直间距
                          crossAxisSpacing: 0, // 水平间距
                          childAspectRatio: (328 / 4.0).w / 75.h, // 宽高比
                        ),
                        itemCount: 12,
                        padding: EdgeInsets.only(top: 18.h, left: 12.w), // 移除默认的padding// 最多显示10个
                        itemBuilder: (context, index) {
                          return SizedBox(
                              width: (328 / 4.0).w,
                              height: 75.h,
                              child: Stack(
                                children: [
                                  Visibility(
                                    visible: card_award[2] == 1 || card_award[2] == 2,
                                    child: Lottie.asset(
                                      fit: BoxFit.fill,
                                      "guang.zip".files(),
                                      repeat: true,
                                    ),
                                  ),
                                  if (card_award[2][index] == -1)
                                    Center(child: CSAnimatedImageMove(imageUrl: 'cs_key_icon', isAnimationEnabled: _show_animation, ws: 50, hs: 50, targetKey: targetKey)),
                                  if (card_award[2][index] == 1)
                                    Center(child: CSBouncyImage(imagePath: 'cs_7_b', width: 48, height: 48, enableAnimation: _show_animation)),
                                  if (card_award[2][index] == 2)
                                    Center(child: CSBouncyImage(imagePath: 'cs_77_b', width: 48, height: 48, enableAnimation: _show_animation)),
                                  if (card_award[2][index] != 2 && card_award[2][index] != 1 && card_award[2][index] != -1)
                                    SizedBox(
                                      width: 68.w,
                                      height: 68.w,
                                      child: CSGradientStrokeText(text: '${card_award[2][index]}', gradientColors: ['#FFCE2C'.color(),'#FF8C00'.color()], width: 68.w, height: 68.w, fontSize: 36, strokeWidth: 2, strokeColor: '#220906'.color()),
                                    ),
                                  if (card_award[2][index] == 2 || card_award[2][index] == 1)
                                    Column(
                                    children: [
                                      SizedBox(height: 52.h),
                                      Padding(padding:  EdgeInsetsGeometry.only(left: 8.w),child: CSStrokeText(text: '\$${card_award[3][index]}', size: 16, color: '#FFDD1F'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#000000'.color()))
                                    ],
                                  )
                                ],
                              )
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),onScratchEnd: (){
                setState(() {
                  _show_animation = true;
                });
                Future.delayed(Duration(milliseconds: 2000),() async {
                  // key
                  if (card_award[0] == 1){
                    await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_wheel_numberName, CSLocalProvider.instance.cs_wheel_number + 1);
                    Future.delayed(Duration(milliseconds: 100),() async {
                      CSLuckyWheelNotificationService.sendToDomandNumberNotification(0);
                    });
                  }
                  // num
                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scrach_end_number_3Name, CSLocalProvider.instance.cs_scrach_end_number_3 + 1);
                  // box
                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_box_indexName, CSLocalProvider.instance.cs_scratch_box_index + 1);
                  // guaka index
                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_gua_indexName, CSLocalProvider.instance.cs_scratch_gua_index + 1);

                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_num_rowName, CSLocalProvider.instance.cs_scratch_num_row + 1);

                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_num_indexName, CSLocalProvider.instance.cs_scratch_num_index + 1);

                  await CSLocalProvider.instance.updateString(CSLocalProvider.instance.cs_scrach_end_time_3Name, DateTime.now().toIso8601String());

                  Future.delayed(Duration(milliseconds: 100),() async {
                    CSHomeListNotificationService.sendToDomandNumberNotification(0);
                  });

                  if (card_award[1] == 1){
                    if (card_award[4] >= CSNumberHelpers().getbigwinNum()){
                      int code = await context.tipShow2(CSBigwinDialog(award: card_award[4], isGuide: false));
                      if (code >= 0){
                        if (CSLocalProvider.instance.cs_scrach_end_number_3 >= 10){
                          Navigator.pop(context);
                        } else {
                          showTXPopDialog();
                        }
                      }
                    } else {
                      int code = await context.tipShow2(CSCashWinDialog(award: card_award[4], isGuide: false));
                      if (code >= 0){
                        if (CSLocalProvider.instance.cs_scrach_end_number_3 >= 10){
                          Navigator.pop(context);
                        } else {
                          showTXPopDialog();
                        }
                      }
                    }
                  } else {
                    int code = await context.tipShow2(CSNotAwardDialog());
                    if (code >= 0){
                      if (CSLocalProvider.instance.cs_scrach_end_number_3 >= 10){
                        Navigator.pop(context);
                      } else {
                        showTXPopDialog();
                      }
                    }
                  }
                  card_award = await CSNumberHelpers().get77hot();
                  // 刷新下一张
                  CSScratchUpdateNotificationService.sendToDomandNumberNotification(0);

                  setState(() {
                    _show_animation = false;
                  });
                });
              },),
            )

          ],
        ),
      );
    } else if (widget.type == 4){
      return SizedBox(
        width: 0.width(context),
        height: 272.h,
        child: Column(
          children: [
            SizedBox(height: 8.h),
            SizedBox(
              width: 328.w,
              height: 264.h,
              child: CSLocalImageScratchCard(coverImagePath:'cs_card_top_${widget.type}'.image(), contentW: 328.w, contentH: 264.h, autoStartY: 20.h,child: Container(
                width: 328.w,
                height: 264.h,
                decoration: BoxDecoration(
                    image: CSDImg('cs_card_bg_${widget.type}')
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 328.w,
                      height: 264.h,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // 一行5个
                          mainAxisSpacing: 12.h, // 垂直间距
                          crossAxisSpacing:0, // 水平间距
                          childAspectRatio: 88.w / 68.h, // 宽高比
                        ),
                        itemCount: 9,
                        padding: EdgeInsets.only(top: 6.h, left: 32.w), // 移除默认的padding// 最多显示10个
                        itemBuilder: (context, index) {
                          return SizedBox(
                              width: 88.w,
                              height: 68.h,
                              child: Stack(
                                children: [
                                  Visibility(
                                    visible: card_award[2][index] == 0,
                                    child: Lottie.asset(
                                      fit: BoxFit.fill,
                                      "guang.zip".files(),
                                      repeat: true,
                                    ),
                                  ),
                                  if (card_award[2][index] != -1)
                                    Positioned(left: 7.w,top: 8.h,child: CSBouncyImage(imagePath: 'cs_card4_${card_award[2][index]}', width: 55.w, height: 55.w, enableAnimation: _show_animation && card_award[2][index] == 0,)),
                                  if (card_award[2][index] == -1)
                                    Center(child: CSAnimatedImageMove(imageUrl: 'cs_key_icon', isAnimationEnabled: _show_animation, ws: 50, hs: 50, targetKey: targetKey)),
                                  if (card_award[2][index] == 0)
                                    Column(
                                    children: [
                                      SizedBox(height: 50.h),
                                      Padding(padding: EdgeInsetsGeometry.only(left: 6.w),child: CSStrokeText(text: '\$${card_award[3][index]}', size: 16, color: '#FFDD1F'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#000000'.color()))
                                    ],
                                  ),
                                ],
                              )
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),onScratchEnd: (){
                setState(() {
                  _show_animation = true;
                });
                Future.delayed(Duration(milliseconds: 2000),() async {
                  // key
                  if (card_award[0] == 1){
                    await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_wheel_numberName, CSLocalProvider.instance.cs_wheel_number + 1);
                    Future.delayed(Duration(milliseconds: 100),() async {
                      CSLuckyWheelNotificationService.sendToDomandNumberNotification(0);
                    });
                  }
                  // num
                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scrach_end_number_4Name, CSLocalProvider.instance.cs_scrach_end_number_4 + 1);
                  // box
                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_box_indexName, CSLocalProvider.instance.cs_scratch_box_index + 1);
                  // guaka index
                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_gua_indexName, CSLocalProvider.instance.cs_scratch_gua_index + 1);

                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_num_rowName, CSLocalProvider.instance.cs_scratch_num_row + 1);

                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_num_indexName, CSLocalProvider.instance.cs_scratch_num_index + 1);

                  await CSLocalProvider.instance.updateString(CSLocalProvider.instance.cs_scrach_end_time_4Name, DateTime.now().toIso8601String());

                  Future.delayed(Duration(milliseconds: 100),() async {
                    CSHomeListNotificationService.sendToDomandNumberNotification(0);
                  });

                  if (card_award[1] == 1){
                    if (card_award[4] >= CSNumberHelpers().getbigwinNum()){
                      int code = await context.tipShow2(CSBigwinDialog(award: card_award[4], isGuide: false));
                      if (code >= 0){
                        if (CSLocalProvider.instance.cs_scrach_end_number_4 >= 10){
                          Navigator.pop(context);
                        } else {
                          showTXPopDialog();
                        }
                      }
                    } else {
                      int code = await context.tipShow2(CSCashWinDialog(award: card_award[4], isGuide: false));
                      if (code >= 0){
                        if (CSLocalProvider.instance.cs_scrach_end_number_4 >= 10){
                          Navigator.pop(context);
                        } else {
                          showTXPopDialog();
                        }
                      }
                    }
                  } else {
                    int code = await context.tipShow2(CSNotAwardDialog());
                    if (code >= 0){
                      if (CSLocalProvider.instance.cs_scrach_end_number_4 >= 10){
                        Navigator.pop(context);
                      } else {
                        showTXPopDialog();
                      }
                    }
                  }
                  card_award = await CSNumberHelpers().getcard_emoji();
                  // 刷新下一张
                  CSScratchUpdateNotificationService.sendToDomandNumberNotification(0);

                  setState(() {
                    _show_animation = false;
                  });
                });
              },),
            )
          ],
        ),
      );
    } else if (widget.type == 5){
      return SizedBox(
        width: 0.width(context),
        height: 288.h,
        child: Column(
          children: [
            SizedBox(height: 8.h),
            SizedBox(
              width: 328.w,
              height: 280.h,
              child: CSLocalImageScratchCard(coverImagePath:'cs_card_top_${widget.type}'.image(), contentW: 328.w, contentH: 280.h, autoStartY: 20.h,child: Container(
                width: 328.w,
                height: 280.h,
                decoration: BoxDecoration(
                    image: CSDImg('cs_card_bg_${widget.type}')
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 328.w,
                      height: 280.h,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5, // 一行5个
                          mainAxisSpacing: 0.h, // 垂直间距
                          crossAxisSpacing:0, // 水平间距
                          childAspectRatio: 60.w / 70.h, // 宽高比
                        ),
                        itemCount: 15,
                        padding: EdgeInsets.only(top: 42.h, left: 8.w), // 移除默认的padding// 最多显示10个
                        itemBuilder: (context, index) {
                          List<int> award_index = card_award[5];
                          return SizedBox(
                              width: 60.w,
                              height: 70.h,
                              child: Stack(
                                children: [
                                  Visibility(
                                    visible: award_index.contains(index) || card_award[2] == 0,
                                    child: Lottie.asset(
                                      fit: BoxFit.fill,
                                      "guang.zip".files(),
                                      repeat: true,
                                    ),
                                  ),
                                  if (card_award[2][index] != -1)
                                    Positioned(left: 7.w,top: 8.h,child: CSBouncyImage(imagePath: 'cs_card5_${card_award[2][index]}', width: 55.w, height: 55.w, enableAnimation: _show_animation && award_index.contains(index))),
                                  if (card_award[2][index] == -1)
                                    Center(child: CSAnimatedImageMove(imageUrl: 'cs_key_icon', isAnimationEnabled: _show_animation, ws: 50, hs: 50, targetKey: targetKey)),
                                  if (award_index.contains(index))
                                    Column(
                                      children: [
                                        SizedBox(height: 50.h),
                                        Padding(padding: EdgeInsetsGeometry.only(left: 2.w),child: CSStrokeText(text: '\$${card_award[3][index]}', size: 14, color: '#FFDD1F'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#000000'.color()))
                                      ],
                                    ),
                                ],
                              ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),onScratchEnd: (){
                setState(() {
                  _show_animation = true;
                });
                Future.delayed(Duration(milliseconds: 2000),() async {
                  // key
                  if (card_award[0] == 1){
                    await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_wheel_numberName, CSLocalProvider.instance.cs_wheel_number + 1);
                    Future.delayed(Duration(milliseconds: 100),() async {
                      CSLuckyWheelNotificationService.sendToDomandNumberNotification(0);
                    });
                  }
                  // num
                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scrach_end_number_5Name, CSLocalProvider.instance.cs_scrach_end_number_5 + 1);
                  // box
                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_box_indexName, CSLocalProvider.instance.cs_scratch_box_index + 1);
                  // guaka index
                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_gua_indexName, CSLocalProvider.instance.cs_scratch_gua_index + 1);

                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_num_rowName, CSLocalProvider.instance.cs_scratch_num_row + 1);

                  await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_num_indexName, CSLocalProvider.instance.cs_scratch_num_index + 1);

                  await CSLocalProvider.instance.updateString(CSLocalProvider.instance.cs_scrach_end_time_5Name, DateTime.now().toIso8601String());

                  Future.delayed(Duration(milliseconds: 100),() async {
                    CSHomeListNotificationService.sendToDomandNumberNotification(0);
                  });

                  if (card_award[1] == 1){
                    if (card_award[4] >= CSNumberHelpers().getbigwinNum()){
                      int code = await context.tipShow2(CSBigwinDialog(award: card_award[4], isGuide: false));
                      if (code >= 0){
                        if (CSLocalProvider.instance.cs_scrach_end_number_5 >= 10){
                          Navigator.pop(context);
                        } else {
                          showTXPopDialog();
                        }
                      }
                    } else {
                      int code = await context.tipShow2(CSCashWinDialog(award: card_award[4], isGuide: false));
                      if (code >= 0){
                        if (CSLocalProvider.instance.cs_scrach_end_number_5 >= 10){
                          Navigator.pop(context);
                        } else {
                          showTXPopDialog();
                        }
                      }
                    }
                  } else {
                    int code = await context.tipShow2(CSNotAwardDialog());
                    if (code >= 0){
                      if (CSLocalProvider.instance.cs_scrach_end_number_5 >= 10){
                        Navigator.pop(context);
                      } else {
                        showTXPopDialog();
                      }
                    }
                  }
                  card_award = await CSNumberHelpers().getcard_8rich();
                  // 刷新下一张
                  CSScratchUpdateNotificationService.sendToDomandNumberNotification(0);

                  setState(() {
                    _show_animation = false;
                  });
                });
              },),
            )

          ],
        ),
      );
    }
    return SizedBox();
  }

  // 流程性弹窗
  Future<void> showTXPopDialog() async {
    await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_Level_inedxName, CSLocalProvider.instance.cs_Level_inedx + 1);
    setTxProgress();
    if (CSLocalProvider.instance.cs_scratch_gua_index == CSLocalProvider.instance.card_push_number && CSLocalProvider.instance.cs_account_id.isEmpty){
      int code = await context.tipShow(CSCardTipsDialog());
      if (code >= 0){
        showLevelDialog();
      }
    } else if (CSLocalProvider.instance.cs_account_id.isNotEmpty && CSLocalProvider.instance.cs_dollar_number / CSNumberHelpers().gameModel!.card_range.first >= 0.8 && CSLocalProvider.instance.cs_dolas_80_end == false){
      await CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_dolas_80_endName, true);
      int code = await context.tipShow(CSCardTipsDialog());
      if (code >= 0){
        showLevelDialog();
      }
    } else if (CSLocalProvider.instance.cs_scratch_num_row >= 5) {
      await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_num_rowName, 0);
      int code = await context.tipShow(CSCardhengDialog(tips: RewardTextUtil.getRandomMessage()));
      if (code >= 0){
        showLevelDialog();
      }
    } else if (CSLocalProvider.instance.cs_scratch_num_index == 8 || CSLocalProvider.instance.cs_scratch_num_index == 15 || CSLocalProvider.instance.cs_scratch_num_index == 20){
      int code = await context.tipShow(CSQuizRankTwoDialog(quiz_num: CSLocalProvider.instance.cs_scratch_num_index + 20));
      if (code >= 0){
        showLevelDialog();
      }
    } else if (CSLocalProvider.instance.cs_card_quicken_num / 20 >= 0.3 && CSLocalProvider.instance.cs_card_quicken_30 == false) {
      await CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_card_quicken_30Name, true);
      int code = await context.tipShow(CSTXonly2Dialog(pro: 75));
      if (code >= 0){
        showLevelDialog();
      }
    } else if (CSLocalProvider.instance.cs_card_quicken_num / 20 >= 0.5 && CSLocalProvider.instance.cs_card_quicken_50 == false) {
      await CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_card_quicken_50Name, true);
      int code = await context.tipShow(CSTXonly2Dialog(pro: 89));
      if (code >= 0){
        showLevelDialog();
      }
    } else if (CSLocalProvider.instance.cs_card_quicken_num / 20 >= 0.8 && CSLocalProvider.instance.cs_card_quicken_80 == false) {
      await CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_card_quicken_80Name, true);
      int code = await context.tipShow(CSTXonly2Dialog(pro: 99));
      if (code >= 0){
        showLevelDialog();
      }
    } else if (CSLocalProvider.instance.cs_card_quicken_num / 20 >= 0.9 && CSLocalProvider.instance.cs_card_quicken_90 == false) {
      await CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_card_quicken_90Name, true);
      int code = await context.tipShow(CSTXonlyDialog());
      if (code >= 0){
        showLevelDialog();
      }
    } else if (CSLocalProvider.instance.cs_card_quicken_num >= 19 && CSLocalProvider.instance.cs_card_quicken_1 == false) {
      await CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_card_quicken_90Name, true);
      int code = await context.tipShow(CSTXonly3Dialog());
      if (code >= 0){
        showLevelDialog();
      }
    } else if (CSLocalProvider.instance.cs_card_quicken_num >= 19.9 && CSLocalProvider.instance.cs_card_quicken_01 == false) {
      await CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_card_quicken_01Name, true);
      int code = await context.tipShow(CSTXonly3Dialog());
      if (code >= 0){
        showLevelDialog();
      }
    } else {
      showLevelDialog();
    }
  }
  // 显示升级
  Future<void> showLevelDialog() async {
    if (CSLocalProvider.instance.cs_Level_inedx >= 6){
      await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_Level_inedxName, 0);
      await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_Level_numberName, CSLocalProvider.instance.cs_Level_number + 1);
      int code = await context.tipShow(CSLevelDialog());
      if (code >= 0){
        txFirstShowDialog();
      }
    } else {
      txFirstShowDialog();
    }
  }

  // 判断是否发起提现
  void txFirstShowDialog(){
    if (CSLocalProvider.instance.cs_dollar_number >= CSNumberHelpers().gameModel!.card_range.first && CSLocalProvider.instance.cs_first_show_cash == false){
      CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_first_show_cashName, true);
      context.tipShow(CSLastTipsDialog());
    }
  }


  // 提现任务进度记录
  Future<void> setTxProgress() async {
    if (CSLocalProvider.instance.cs_tx_task_index == 0 || CSLocalProvider.instance.cs_tx_task_index == 3 || CSLocalProvider.instance.cs_tx_task_index == 6) {
      await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_card_indexName, CSLocalProvider.instance.cs_tx_card_index + 1);
      Future.delayed(Duration(milliseconds: 50), () async {
        CSCashListNotificationService.sendToDomandNumberNotification(0);
        if (CSLocalProvider.instance.cs_tx_card_index >= CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num) {
          await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_card_indexName, 0);
          await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_wheel_indexName, 0);
          await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_bubble_indexName, 0);
          await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_task_indexName, CSLocalProvider.instance.cs_tx_task_index + 1);
          Future.delayed(Duration(milliseconds: 50), () async {
            CSCashListNotificationService.sendToDomandNumberNotification(0);
          });
        }
      });
      // 重置任务
      Future.delayed(Duration(milliseconds: 100), () async {
        if (CSLocalProvider.instance.cs_tx_task_index + 1 >= CSNumberHelpers().gameModel!.wtd_task.length){
          await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_card_indexName, 0);
          await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_wheel_indexName, 0);
          await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_bubble_indexName, 0);
          await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_task_indexName, 0);
          Future.delayed(Duration(milliseconds: 50), () async {
            CSCashListNotificationService.sendToDomandNumberNotification(0);
          });
        }
      });
    };
  }

  Widget getBottomTipsWidget(){
    if (widget.type == 0){
      return SizedBox(
        width: 0.width(context),
        height: 24,
        child: Column(
          children: [
            SizedBox(height: 12),
            CSStrokeText(text: 'Match 3 Symbols In A Line To Win The Shown Prize', size: 10, color: '#FFF39B'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#000000'.color(), align: .center)
          ],
        ),
      );
    } else if (widget.type == 1) {
      return SizedBox(
        width: 0.width(context),
        height: 24,
        child: Column(
          children: [
            SizedBox(height: 4),
            CSStrokeText(text: 'Match Winning Numbers To Any Of Your Numbers To Win Prize', size: 10, color: '#FFF39B'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#000000'.color(), align: .center)
          ],
        ),
      );
    } else if (widget.type == 3) {
      return SizedBox(
        width: 0.width(context),
        height: 24 + 14,
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: .center,
              children: [
                CSStrokeText(text: 'Reveal  ', size: 10, color: '#FFF39B'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#000000'.color()),
                CSImg(name: 'cs_7_s', width: 16, height: 16),
                CSStrokeText(text: 'Symbol, Win Shown Prize Reveal  ', size: 10, color: '#FFF39B'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#000000'.color()),
                CSImg(name: 'cs_77_s', width: 24, height: 16),
                CSStrokeText(text: ' Symbol, Win The', size: 10, color: '#FFF39B'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#000000'.color()),
              ],
            ),
            Row(
              mainAxisAlignment: .center,
              children: [
                CSStrokeText(text: 'Double Prize', size: 10, color: '#FFF39B'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#000000'.color()),
              ],
            ),
          ],
        ),
      );
    } else if (widget.type == 4) {
      return SizedBox(
        width: 0.width(context),
        height: 24 + 8,
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: .center,
              children: [
                CSStrokeText(text: 'Reveal Three  ', size: 10, color: '#FFF39B'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#000000'.color()),
                CSImg(name: 'cs_emjio_s', width: 16, height: 16),
                CSStrokeText(text: '  In Same Row, Column, Or Diagonal To Win', size: 10, color: '#FFF39B'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#000000'.color()),
              ],
            ),
          ],
        ),
      );
    } else if (widget.type == 5) {
      return SizedBox(
        width: 0.width(context),
        height: 24 + 8,
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: .center,
              children: [
                CSStrokeText(text: 'Match 3 Symbols To Win The Shown Prize', size: 10, color: '#FFF39B'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#000000'.color()),
              ],
            ),
          ],
        ),
      );
    }
    return SizedBox();
  }

  Widget getBottomWidget(){
    return SizedBox(
      width: 0.width(context),
      height: 118,
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 16.w),
                  ParticleButton(child: Container(
                    width: 52,
                    height: 52,
                    key: targetKey,
                    decoration: BoxDecoration(
                        image: CSDImg('cs_wheel_icon_bottom')
                    ),
                    child: Column(
                      children: [
                        Spacer(),
                        Padding(padding: EdgeInsetsGeometry.only(left: 4),child: CSStrokeText(text: 'WHEEL', size: 10, color: '#FFFAB6'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#983300'.color()))
                      ],
                    ),
                  ), onTap: (){
                    Navigator.pop(context);
                    CashTabController.switchTo(1);
                  }),
                  SizedBox(width: 50.w),
                  ParticleButton(
                    onTap: (){
                      // ad
                    },
                    child: SizedBox(
                      width: 138,
                      height: 44,
                      child: Stack(
                        children: [
                          Positioned(left: 23,top: 8,child: Container(
                            width: 114,
                            height: 28,
                            decoration: BoxDecoration(
                                color: '#000000'.color(opacity: 0.6),
                                borderRadius: BorderRadius.circular(14)
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 50),
                                Consumer<CSLocalProvider>(
                                    builder: (context, provider, child) {
                                      return CSText(text: '${10 - getCuuectIndex()}', size: 16, color: '#FFFFFF'.color(), weight: FontWeight.w700);
                                    }
                                ),
                                Spacer(),
                                CSImg(name: 'cs_add_btn', width: 24, height: 24),
                                SizedBox(width: 2)
                              ],
                            ),
                          )),
                          CSImg(name: 'cs_cards_un_btn', width: 44, height: 44),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 7.8),
              Row(
                children: [
                  SizedBox(width: 16.w),
                  ParticleButton(
                    onTap: (){
                       if (!_show_animation){
                         CSScratchUpdateNotificationService.sendToDomandNumberNotification(1);
                       }
                    },
                    child: Container(
                      width: 262.w,
                      height: 52,
                      decoration: BoxDecoration(
                          image: CSDImg('cs_green_btn_bg')
                      ),
                      child: Center(
                        child: CSStrokeText(text: 'REVEAL ALL', size: 24, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#5C2F02'.color()),
                      ),
                    ),
                  ),
                  Spacer(),
                  ParticleButton(
                    onTap: (){
                      Navigator.pop(context);
                      CashTabController.switchTo(2);
                    },
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                          image: CSDImg('cs_cash_btn')
                      ),
                      child: Column(
                        children: [
                          Spacer(),
                          CSStrokeText(text: 'CASH', size: 10, color: '#FFFAB6'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#983300'.color())
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                ],
              )
            ],
          ),
          Positioned(
            left: 48.w,
            child: Container(
              width: 44,
              height: 20,
              decoration: BoxDecoration(
                image: CSDImg('cs_key_bgs')
              ),
              child: Row(
                mainAxisAlignment: .center,
                children: [
                  CSImg(name: 'cs_key_icon_s', width: 16, height: 16),
                  Consumer<CSLocalProvider>(
                      builder: (context, provider, child) {
                        return CSGradientStrokeText(text: 'x${provider.cs_wheel_number}', gradientColors: ['#FFFFFF'.color(),'#FFF189'.color()], width: 20, height: 16, fontSize: 11, strokeWidth: 0.5, strokeColor: '#983300'.color());
                      }
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }

  Widget getTopCardNumWidget(){
    return Consumer<CSLocalProvider>(
        builder: (context, provider, child) {
          return Container(
            width: 321.w,
            height: 24,
            decoration: BoxDecoration(
                image: CSDImg('cs_scractch_num_bg${widget.type}')
            ),
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w900,
                      color: '#FFFFFF'.color()
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Scratch ',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextSpan(
                      text: '${10 - getCuuectIndex()} Cards ',
                      style: TextStyle(color: '#FFD91D'.color(), fontSize: 14),
                    ),
                    TextSpan(
                      text: 'Left To Level Up',
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  Widget getTopCardNumGrand(){
    return Consumer<CSLocalProvider>(
        builder: (context, provider, child) {
          return Container(
            width: 321.w,
            height: 24,
            decoration: BoxDecoration(
                image: CSDImg('cs_scractch_num_bg${widget.type}')
            ),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // ================= STROKE LAYER =================
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w900,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = Colors.black,
                      ),
                      children: [
                        const TextSpan(text: 'Scratch '),
                        TextSpan(
                          text: '${10 - getCuuectIndex()} Cards ',
                          style: TextStyle(fontSize: 14),
                        ),
                        const TextSpan(text: 'Left To Level Up'),
                      ],
                    ),
                  ),

                  // ================= FILL LAYER =================
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w900,
                        color: '#FFFFFF'.color(),
                      ),
                      children: [
                        const TextSpan(text: 'Scratch '),
                        TextSpan(
                          text: '${10 - getCuuectIndex()} Cards ',
                          style: TextStyle(
                            color: '#FFD91D'.color(),
                            fontSize: 14,
                          ),
                        ),
                        const TextSpan(text: 'Left To Level Up'),
                      ],
                    ),
                  ),
                ],
              ),
            )
          );
        }
    );
  }

  Widget getTopimageWidget(){
    if (widget.type == 0){
      return SizedBox(
        width: 0.width(context),
        height: 164,
        child: Column(
          children: [
            SizedBox(height: 12),
            CSImg(name: 'cs_card1_1', width: 0.width(context), height: 152)
          ],
        ),
      );
    } else if (widget.type == 2){
      return SizedBox(
        width: 0.width(context),
        height: 160,
        child: Column(
          children: [
            CSImg(name: 'cs_card3_top', width: 0.width(context), height: 160)
          ],
        ),
      );
    } else if (widget.type == 3){
      return SizedBox(
        width: 288,
        height: 152,
        child: Column(
          children: [
            CSImg(name: 'cs_card4_top', width: 288, height: 152)
          ],
        ),
      );
    } else if (widget.type == 4){
      return SizedBox(
        width: 0.width(context),
        height: 160,
        child: Column(
          children: [
            CSImg(name: 'cs_card5_top', width: 0.width(context), height: 160)
          ],
        ),
      );
    } else if (widget.type == 5){
      return SizedBox(
        width: 264,
        height: 152,
        child: Column(
          children: [
            SizedBox(height: 4),
            CSImg(name: 'cs_card6_top', width: 264, height: 148)
          ],
        ),
      );
    }
    return SizedBox();
  }

  Widget getCenterNumWidget(){
    if (widget.type == 0){
      return SizedBox(
        width: 0.width(context),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CSGradientStrokeText(text: 'WIN\nUP TO', gradientColors: ['#FFFFFF'.color(),'#FFDD00'.color()], width: 80, height: 44, fontSize: 24, strokeWidth: 2, strokeColor: '#783C00'.color()),
            SizedBox(width: 7.w),
            CSGradientStrokeText(text: '\$${CSNumberHelpers().gameModel!.card_fruit.winup_number}', gradientColors: ['#FFFFFF'.color(),'#FFDD00'.color()], width: 160, height: 48, fontSize: 48, strokeWidth: 2, strokeColor: '#783C00'.color()),
          ],
        ),
      );
    } else if(widget.type == 1){
      return SizedBox(
        width: 0.width(context),
        height: 195,
        child: Column(
          children: [
            SizedBox(height: 0),
            CSImg(name: 'cs_card2_1', width: 264, height: 144),
            SizedBox(height: 2.h),
            Container(
              width: 328.w,
              height: 48,
              decoration: BoxDecoration(
                  image: CSDImg('cs_card2_2')
              ),
              child: Row(
                mainAxisAlignment: .center,
                children: [
                  CSGradientStrokeText(text: 'WIN UP TO  ', gradientColors: ['#AFB5B5'.color(),'#FFFFFF'.color(), '#B1B8B8'.color()], width: 140.w, height: 48, fontSize: 28),
                  CSGradientStrokeText(text: '\$${CSNumberHelpers().gameModel!.card_number.winup_number}', gradientColors: ['#AFB5B5'.color(),'#FFFFFF'.color(), '#B1B8B8'.color()], width: 120.w, height: 48, fontSize: 40),
                ],
              ),
            )
          ],
        ),
      );
    } else if (widget.type == 2){
      return SizedBox(
        width: 0.width(context),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CSGradientStrokeText(text: 'WIN UP TO', gradientColors: ['#FFFBA6'.color(),'#FFFFFF'.color(),'#FFF193'.color()], width: 142, height: 32, fontSize: 28, strokeWidth: 2, strokeColor: '#000000'.color()),
            SizedBox(width: 12.w),
            CSGradientStrokeText(text: '\$${CSNumberHelpers().gameModel!.card_tiger.winup_number}', gradientColors: ['#FFFBA6'.color(),'#FFFFFF'.color(),'#FFF193'.color()], width: 120, height: 48, fontSize: 40, strokeWidth: 2, strokeColor: '#000000'.color()),
          ],
        ),
      );
    } else if (widget.type == 3){
      return SizedBox(
        width: 0.width(context),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CSGradientStrokeText(text: 'WIN UP TO', gradientColors: ['#FFEDB5'.color(),'#FFFFFF'.color(),'#FFF193'.color()], width: 142, height: 32, fontSize: 28, strokeWidth: 2, strokeColor: '#000000'.color()),
            SizedBox(width: 12.w),
            CSGradientStrokeText(text: '\$${CSNumberHelpers().gameModel!.card_77hot.winup_number}', gradientColors: ['#FFEDB5'.color(),'#FFFFFF'.color(),'#FFF193'.color()], width: 120, height: 48, fontSize: 40, strokeWidth: 2, strokeColor: '#000000'.color()),
          ],
        ),
      );
    } else if (widget.type == 4){
      return SizedBox(
        width: 0.width(context),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CSGradientStrokeText(text: 'WIN UP TO', gradientColors: ['#FFFBA6'.color(),'#FFFFFF'.color(),'#FFF193'.color()], width: 142, height: 32, fontSize: 28, strokeWidth: 2, strokeColor: '#000000'.color()),
            SizedBox(width: 12.w),
            CSGradientStrokeText(text: '\$${CSNumberHelpers().gameModel!.card_emoji.winup_number}', gradientColors: ['#FFFBA6'.color(),'#FFFFFF'.color(),'#FFF193'.color()], width: 120, height: 48, fontSize: 40, strokeWidth: 2, strokeColor: '#000000'.color()),
          ],
        ),
      );
    } else if (widget.type == 5){
      return SizedBox(
        width: 0.width(context),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CSGradientStrokeText(text: 'WIN UP TO', gradientColors: ['#BE920A'.color(),'#F4C437'.color(),'#C89200'.color()], width: 142, height: 32, fontSize: 28, strokeWidth: 2, strokeColor: '#000000'.color()),
            SizedBox(width: 12.w),
            CSGradientStrokeText(text: '\$${CSNumberHelpers().gameModel!.card_8rich.winup_number}', gradientColors: ['#EBC884'.color(),'#FFFFFF'.color(),'#EBC884'.color()], width: 120, height: 48, fontSize: 40, strokeWidth: 2, strokeColor: '#000000'.color()),
          ],
        ),
      );
    }
    return SizedBox();
  }

  int getCuuectIndex(){
    if (widget.type == 0){
      return CSLocalProvider.instance.cs_scrach_end_number_0;
    } else if (widget.type == 1){
      return CSLocalProvider.instance.cs_scrach_end_number_1;
    } else if (widget.type == 2){
      return CSLocalProvider.instance.cs_scrach_end_number_2;
    } else if (widget.type == 3){
      return CSLocalProvider.instance.cs_scrach_end_number_3;
    } else if (widget.type == 4){
      return CSLocalProvider.instance.cs_scrach_end_number_4;
    } else {
      return CSLocalProvider.instance.cs_scrach_end_number_5;
    }
  }
}

class CSCardNavBarWidget extends StatefulWidget {
  const CSCardNavBarWidget({super.key});

  @override
  State<CSCardNavBarWidget> createState() => _CSCardNavBarWidgetState();
}

class _CSCardNavBarWidgetState extends State<CSCardNavBarWidget> with SingleTickerProviderStateMixin {

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
          return SizedBox(
            width: 0.width(context),
            height: 88,
            child: Column(
              children: [
                SizedBox(height: 40),
                Row(
                  children: [
                    SizedBox(width: 16.w),
                    ParticleButton(child: CSImg(name: 'cs_home_icon', width: 36, height: 36), onTap: (){
                      // Navigator.pop(context);
                      context.tipShow2(CSGuideNew6Dialog());
                    }),
                    SizedBox(width: 8.w),
                    ParticleButton(
                      onTap: (){
                        Navigator.pop(context);
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
                  ],
                )
              ],
            ),
          );
        }
    );
  }
}

class GradientCircleProgress extends StatelessWidget {
  final double progress; // 0.0 ~ 1.0

  const GradientCircleProgress({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 62,
      height: 62,
      child: CustomPaint(
        painter: _GradientCirclePainter(progress),
      ),
    );
  }
}

class _GradientCirclePainter extends CustomPainter {
  final double progress;

  _GradientCirclePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    const strokeWidth = 6.0;

    final rect = Rect.fromCircle(center: center, radius: radius);

    final gradient = SweepGradient(
      startAngle: -pi / 2,
      endAngle: 3 * pi / 2,
      colors: const [
        Color(0xFFFFAC00),
        Color(0xFFE46700),
      ],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * pi * progress.clamp(0.0, 1.0);

    canvas.drawArc(
      rect,
      -pi / 2,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _GradientCirclePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}


class RewardTextUtil {
  static final List<String> _messages = [
    'Keep Scratching! Today Super Easy Cash Out \$1000',
    'Keep Going! \$1000 Cash Out Feels Easy Today',
    'Don’t Stop! Today’s \$1000 Is Within Reach',
    'Stay in the Game — \$1000 Is Heating Up',
    'Keep Scratching — Today’s \$1000 Is Hot',
    'Almost There! \$1000 Feels Closer Today',
  ];

  static final Random _random = Random();

  static String getRandomMessage() {
    return _messages[_random.nextInt(_messages.length)];
  }
}

// 气泡
class CSBubbleButton extends StatefulWidget {
  const CSBubbleButton({super.key});

  @override
  _CSBubbleButtonState createState() => _CSBubbleButtonState();
}

class _CSBubbleButtonState extends State<CSBubbleButton> with SingleTickerProviderStateMixin {

  late Ticker _ticker;

  double _top = 66; // 初始位置从屏幕左上角开始
  double _left = 80; // 初始位置从屏幕左上角开始
  double _dx = 50; // 每秒移动多少 px
  double _dy = 80;

  double _iconSize = 60;

  bool _showPop = true;

  double _pptReward = CSNumberHelpers().getPrizeWithBubbledollarsNum();
  late double maxW, maxH;
  late double screenWidth;
  late double screenHeight;

  late int _lastTime; // 用来计算 deltaTime

  @override
  void initState() {
    super.initState();
    _lastTime = DateTime.now().millisecondsSinceEpoch;

    _ticker = createTicker(_onTick)..start();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 使用 MediaQuery 获取屏幕的宽度和高度
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _onTick(Duration elapsed) {
    if (!mounted) return;

    final now = DateTime.now().millisecondsSinceEpoch;
    final dt = (now - _lastTime) / 1000.0; // dt 秒
    _lastTime = now;

    maxW = screenWidth - _iconSize;
    maxH = screenHeight - _iconSize - 100;

    // 按时间移动，而不是按帧
    _left += _dx * dt;
    _top += _dy * dt;

    if (_left <= 0) {
      _left = 0;
      _dx = -_dx;
    } else if (_left >= maxW) {
      _left = maxW;
      _dx = -_dx;
    }

    if (_top <= 0) {
      _top = 0;
      _dy = -_dy;
    } else if (_top >= maxH) {
      _top = maxH;
      _dy = -_dy;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!_showPop) return SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.only(left: _left, top: _top),
      child: GestureDetector(
        onTap: _openPopPT,
        child: SizedBox(
          width: _iconSize,
          height: _iconSize,
          child: Container(
            width: _iconSize,
            height: _iconSize,
            decoration: BoxDecoration(image: CSDImg('cs_dolas_bubble')),
            child: Column(
              children: [
                Spacer(),
                CSStrokeText(
                  text: '\$${_pptReward.toStringAsFixed(2)}',
                  size: 14,
                  color: '#FBF544'.color(),
                  weight: FontWeight.w700,
                  skWidth: 1,
                  skColor: '#804D00'.color(),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openPopPT() {
    cs_event_fire('bubble_c', {});
    CSCardAds().cs_showAd(context, 'pppuz_bubble_int', onCacheResponse: (onCacheResponse) {
      _hidePoPT();
    }, adDidClosed: (adDidClosed) async {
      await CSLocalProvider.instance.updatedouble(
          CSLocalProvider.instance.cs_dolas_numberName, CSLocalProvider.instance.cs_dollar_number + _pptReward
      );
      playbgMUsic();
      _hidePoPT();
      setTxProgress();
    });
  }

  Future<void> playbgMUsic() async {
    if (CSLocalProvider.instance.cs_sound_music) {
      // await MSAudioUtils().playAward2Audio();
      Future.delayed(Duration(milliseconds: 1000), () async {
        if (!mounted) return;
        // await MSAudioUtils().stopAllTempAudio();
      });
    }
  }

  void _hidePoPT() {
    _pptReward = CSNumberHelpers().getPrizeWithBubbledollarsNum();
    if (mounted) {
      setState(() {
        _showPop = false;
      });
    }
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      if (mounted) {
        setState(() {
          _showPop = true;
        });
      }
    });
  }


  // 提现任务进度记录
  Future<void> setTxProgress() async {
    if (CSLocalProvider.instance.cs_tx_task_index == 2 || CSLocalProvider.instance.cs_tx_task_index == 5 || CSLocalProvider.instance.cs_tx_task_index == 8) {
      await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_bubble_indexName, CSLocalProvider.instance.cs_tx_bubble_index + 1);
      Future.delayed(Duration(milliseconds: 50), () async {
        CSCashListNotificationService.sendToDomandNumberNotification(0);
        if (CSLocalProvider.instance.cs_tx_bubble_index >= CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num) {
          await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_card_indexName, 0);
          await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_wheel_indexName, 0);
          await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_bubble_indexName, 0);
          await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_task_indexName, CSLocalProvider.instance.cs_tx_task_index + 1);
          Future.delayed(Duration(milliseconds: 50), () async {
            CSCashListNotificationService.sendToDomandNumberNotification(0);
          });
        }
      });
      // 重置任务
      Future.delayed(Duration(milliseconds: 100), () async {
        if (CSLocalProvider.instance.cs_tx_task_index + 1 >= CSNumberHelpers().gameModel!.wtd_task.length){
          await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_card_indexName, 0);
          await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_wheel_indexName, 0);
          await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_bubble_indexName, 0);
          await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_task_indexName, 0);
          Future.delayed(Duration(milliseconds: 50), () async {
            CSCashListNotificationService.sendToDomandNumberNotification(0);
          });
        }
      });
    };
  }
}