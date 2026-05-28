import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:cashscratchgo/CSTool/CardWheelPage.dart';
import 'package:cashscratchgo/CSTool/cs_GradientText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:cashscratchgo/CSTool/cs_extension_help.dart';
import 'package:cashscratchgo/CSTool/cs_img.dart';
import 'package:cashscratchgo/CSTool/cs_stroke_text.dart';
import 'package:cashscratchgo/CSTool/cs_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../CSDialog/CSGuideManager.dart';
import '../CSTool/cs_LocalProvider.dart';
import 'CSHomeListVC.dart';

class CSLuckySpineVC extends StatefulWidget {
  const CSLuckySpineVC({super.key});

  @override
  State<CSLuckySpineVC> createState() => _CSLuckySpineVCState();
}

class _CSLuckySpineVCState extends State<CSLuckySpineVC> with SingleTickerProviderStateMixin {

  bool is_tap_wheel = false;

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
              image: CSDImg('cs_wheel_bg')
            ),
            child: Column(
              children: [
                CSNavBarWidget(),
                SizedBox(height: 12.h),
                CSImg(name: 'cs_wheel_top', width: 264, height: 158),
                SizedBox(height: 16.h),
                SizedBox(
                  width: 328.w, height:328.w,
                  child: Stack(
                    children: [
                      ParticleButton(child: CardWheelPage(imagePath: 'cs_wheel_center'),onTap: (){
                        tapWheel();
                      }),
                      Positioned(
                        left: 120.w,
                        top: 120.h,
                        child: ParticleButton(child: CSImg(name: 'cs_wheel_btn', width: 88, height: 100), onTap: (){
                          tapWheel();
                        }),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(left:16.w,top: 110.h,child: Container(width: 56, height: 56,
            decoration: BoxDecoration(
              image: CSDImg('cs_key_bg')
            ),
            child: Stack(
              children: [
                Positioned(left: 8,top: 8,child: CSImg(name: 'cs_key_icons', width: 40, height: 40)),
                Positioned(left: (56-38) * 0.55,bottom: 2,
                  child: Consumer<CSLocalProvider>(
                    builder: (context, provider, child) {
                      return CSGradientStrokeText(text: 'x${provider.cs_wheel_number}', gradientColors: ['#FFFAE1'.color(),'#FFE365'.color()], width: 38, height: 20, fontSize: 14, strokeWidth: 1, strokeColor: '#601E00'.color(),);
                   }
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
  // 2=$20 1=加速卡 3=$50 4=$20 5=加速卡 6=$80 7=$100 8=$50
  void tapWheel(){
    if (is_tap_wheel== false) {
      if (CSLocalProvider.instance.cs_wheel_number <= 0){
        // 次数不足
        WheelStartCSNotificationService.sendToStartIndexNotification(8);
        Future.delayed(Duration(seconds: 1),(){
          is_tap_wheel = false;

        });
      } else {
        WheelStartCSNotificationService.sendToStartIndexNotification(2);
        Future.delayed(Duration(seconds: 2),(){
          is_tap_wheel = false;
        });
      }
    }
    is_tap_wheel = true;
  }
}
