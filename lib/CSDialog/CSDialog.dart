import 'package:cashscratchgo/CSBasic/CSTabBar.dart';
import 'package:cashscratchgo/CSTool/cs_GradientText.dart';
import 'package:cashscratchgo/CSTool/cs_img.dart';
import 'package:cashscratchgo/CSTool/cs_stroke_text.dart';
import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../CSTool/cs_extension_help.dart';

class CSDialogTool {
  // tosat
  static void toast(BuildContext buildContext, String text) async {
    await showAndroidToast(
      padding: 0.0.all(16),
      margin: 0.0.all(32),
      alignment: Alignment.center,
      backgroundColor: '#000000'.color(opacity: 0.8),
      duration: Duration(seconds: 2),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
      ),
      context: buildContext,
    );
  }

  static void toastRanking(BuildContext buildContext, int num) async {
    await showAndroidToast(
      padding: 0.0.all(0),
      margin: 0.0.all(0),
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      duration: Duration(seconds: 3),
      child: Container(
        width: 205,
        height: 50.5,
        decoration: BoxDecoration(
          color: '#000000'.color(opacity: 0.8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Your Current rank: ',
                  style: TextStyle(color: Colors.white),
                ),
                TextSpan(
                  text: '$num',
                  style: TextStyle(color: '#16FF16'.color(), fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
      context: buildContext,
    );
  }
}


// 转盘次数不足
class CSWheelNotDialog extends StatefulWidget {
  const CSWheelNotDialog({super.key});

  @override
  State<CSWheelNotDialog> createState() => CSWheelNotDialogState();
}

class CSWheelNotDialogState extends State<CSWheelNotDialog>
    with SingleTickerProviderStateMixin {


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
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(left: (0.width(context) - 272.w) * 0.5),
            child: Container(
              width: 272.w,
              height: 296.h,
              decoration: BoxDecoration(
                image: CSDImg('cs_not_num_bg')
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20.h),
                      Padding(padding: EdgeInsetsGeometry.only(left: 20.w),child: CSGradientStrokeText(text: 'Not Enough\nKeys To Unlock Spin', gradientColors: ['#FFF184'.color(),'#FFA600'.color()], width: 240, height: 56, fontSize: 20, strokeWidth: 1, strokeColor: '#952923'.color())),
                      SizedBox(height: 20.h),
                      CSImg(name: 'cs_not_num_key', width: 100.w, height: 100.w),
                      SizedBox(height: 18.h),
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 18.w),
                        child: ParticleButton(
                          onTap: (){
                            Navigator.pop(context, 0);
                            CashTabController.switchTo(0);
                          },
                          child: Container(
                            width: 200.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                              image: CSDImg('cs_not_num_btn')
                            ),
                            child: Center(
                              child: CSStrokeText(text: 'FIND IT', size: 20, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(right: 0,top: 0,child: ParticleButton(child: CSImg(name: 'cs_close_btn', width: 32, height: 32), onTap: (){
                     Navigator.pop(context, 0);
                  })),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}