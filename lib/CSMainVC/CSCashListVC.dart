import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:cashscratchgo/CSTool/CS_LocalProvider.dart';
import 'package:cashscratchgo/CSTool/cs_GradientNumber.dart';
import 'package:cashscratchgo/CSTool/cs_GradientText.dart';
import 'package:cashscratchgo/CSTool/cs_stroke_text.dart';
import 'package:cashscratchgo/CSTool/cs_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../CSTool/CS_extension_help.dart';
import '../CSTool/cs_img.dart';
import 'CSHomeListVC.dart';

class CSCashListVC extends StatefulWidget {
  const CSCashListVC({super.key});

  @override
  State<CSCashListVC> createState() => _CSCashListVCState();
}

class _CSCashListVCState extends State<CSCashListVC> with SingleTickerProviderStateMixin {

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
                  getCashOneTypeWidget(),
                ],
              ),
            ),
          Center(child: SizedBox(width: 328, height: 32,child: CSText(text: 'Tips：Cash Will Arrive In Your Account Within 24 Hours As Soon As Possible', size: 12, color: '#A97671'.color(), weight: FontWeight.w500, maxLines: 2,))),
          SizedBox(height: 22.h),
        ],
      )
    );
  }

  Widget getCashOneTypeWidget(){
    return SizedBox(
            width: 328.w, height: 116.h,
            child: Stack(
              children: [
                Positioned(left: 12.w,top: 18.h,child: CSGradientStrokeText(text: '\$', gradientColors: ['#FFFFFF'.color(),'#FFF189'.color()], width: 14, height: 28, fontSize: 20, strokeWidth: 1, strokeColor: '#983300'.color(),)),
                Positioned(left: 56.w,top: 18.h,child: CSGradientStrokeText(text: '1000', gradientColors: ['#FFFFFF'.color(),'#FFF189'.color()], width: 14, height: 28, fontSize: 28, strokeWidth: 1, strokeColor: '#983300'.color(),)),
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
                          width: constraints.maxWidth * (CSLocalProvider.instance.cs_dolas_number / 1000),
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
                Positioned(right: 16.w,bottom: 28.h,child: CSText(text: '${((CSLocalProvider.instance.cs_dolas_number / 1000) * 100).toInt()}%', size: 12, color: '#FFD91D'.color(), weight: FontWeight.w700)),
              ],
            ),
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
          CSGradientNumberRoller(
            value: CSLocalProvider.instance.cs_dolas_number,
            duration: 1800,
            fontSize: 32.0,
            gradientColors: ['#FFFFFF'.color(), '#FFF189'.color()],
            borderColor: '#983300'.color(),
            borderWidth: 1,
            decimalPlaces: 2,
          ),),
          Positioned(right: 12.w,bottom: 16.w,child: ParticleButton(child: Container(
            width: 88,
            height: 28,
            decoration: BoxDecoration(
              image: CSDImg('cs_cash_green')
            ),
            child: Center(
              child: CSStrokeText(text: 'Cash Out', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#025C10'.color()),
            ),
          ), onTap: (){

          })),
          Positioned(right: 4.w,top: 4.w,child: CSImg(name: 'cs_cash_home_${CSLocalProvider.instance.cs_account_seled_index}', width: 60, height: 60)),
        ],
      ),
    );
  }

}