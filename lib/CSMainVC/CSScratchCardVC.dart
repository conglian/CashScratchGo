import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:cashscratchgo/CSTool/CSLocalImageScratchCard.dart';
import 'package:cashscratchgo/CSTool/cs_GradientText.dart';
import 'package:cashscratchgo/CSTool/cs_extension_help.dart';
import 'package:cashscratchgo/CSTool/cs_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../CSBasic/CSTabBar.dart';
import '../CSDialog/CSGuideDialog.dart';
import '../CSTool/cs_GradientNumber.dart';
import '../CSTool/cs_LocalProvider.dart';
import '../CSTool/cs_stroke_text.dart';
import '../CSTool/cs_text.dart';

class CSScratchCardVC extends StatefulWidget {
  final int type;
  const CSScratchCardVC({super.key, required this.type});

  @override
  State<CSScratchCardVC> createState() => _CSScratchCardVCState();
}

class _CSScratchCardVCState extends State<CSScratchCardVC> with SingleTickerProviderStateMixin {

  bool _show_animation = false;

  @override
  void initState() {
    super.initState();
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
              image: CSDImg('cs_card1_${widget.type}')
            ),
            child: Column(
              children: [
                CSCardNavBarWidget(),
                getTopCardNumWidget(),
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
        ],
      ),
    );
  }
  Widget getScratchCardWidget(){
    if (widget.type == 0){
      return SizedBox(
        width: 0.width(context),
        height: 251,
        child: Column(
          children: [
            SizedBox(height: 11),
            SizedBox(
              width: 328.w,
              height: 240,
              child: CSLocalImageScratchCard(coverImagePath:'cs_card_top_${widget.type}'.image(), contentW: 328.w, contentH: 240, child: Container(
                width: 328.w,
                height: 240,
                decoration: BoxDecoration(
                    image: CSDImg('cs_card_bg_${widget.type}')
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: .spaceAround,
                      children: [
                        CSStrokeText(text: '\$40.22', size: 20, color: '#FFE733'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#C50000'.color()),
                        CSStrokeText(text: '\$60.22', size: 20, color: '#FFE733'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#C50000'.color()),
                        CSStrokeText(text: '\$57.22', size: 20, color: '#FFE733'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#C50000'.color()),
                      ],
                    ),
                    SizedBox(width: 20.h,),
                    SizedBox(
                      width: 222.w,
                      height: 240,
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
                              width: 88.w,
                              height: 88,
                              child: Stack(
                                  children: [
                                    Positioned(top: 10.h,left: 0.w,child: Row(
                                      children: [
                                        CSImg(name: 'cs_card1_icon_4', width: 64, height: 64,),
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
              ),onScratchEnd: (){
                _show_animation = true;
              },),
            )
            
          ],
        ),
      );
    }
    return SizedBox();
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
    }
    return SizedBox();
  }

  Widget getBottomWidget(){
    return SizedBox(
      width: 0.width(context),
      height: 168,
      child: Column(
        children: [
          SizedBox(height: 4),
          Row(
            children: [
              SizedBox(width: 16.w),
              Container(
                width: 96,
                height: 32,
                decoration: BoxDecoration(
                    color: '#000000'.color(opacity: 0.6),
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Stack(
                  children: [
                    Positioned(left: 20,bottom: 2,child: CSStrokeText(text: 'x1', size: 9, color: '#FFE365'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#601E00'.color())),
                    Positioned(
                      top: 4,
                      left: 8,
                      child: Row(
                        mainAxisAlignment: .spaceEvenly,
                        children: [
                          CSImg(name: 'cs_wheel_0', width: 24, height: 24),
                          SizedBox(width: 2),
                          CSImg(name: 'cs_wheel_1', width: 24, height: 24),
                          SizedBox(width: 2),
                          CSImg(name: 'cs_wheel_2', width: 24, height: 24),
                        ],
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              SizedBox(width: 16.w),
              ParticleButton(child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                    image: CSDImg('cs_luckyspin_unicon')
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

                },
                child: Container(
                  width: 262.w,
                  height: 52,
                  decoration: BoxDecoration(
                    image: CSDImg('cs_yellow_button')
                  ),
                  child: Center(
                    child: CSStrokeText(text: 'NEW TICKETS', size: 24, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#5C2F02'.color()),
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
    );
  }

  Widget getTopCardNumWidget(){
    return Consumer<CSLocalProvider>(
        builder: (context, provider, child) {
          return Container(
            width: 321.w,
            height: 24,
            decoration: BoxDecoration(
                image: CSDImg('cs_scractch_num_bg')
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
            CSGradientStrokeText(text: '1,000', gradientColors: ['#FFFFFF'.color(),'#FFDD00'.color()], width: 160, height: 48, fontSize: 48, strokeWidth: 2, strokeColor: '#783C00'.color()),
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
                              value: provider.cs_dolas_number,
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
                              width: 86 * 0.5,
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