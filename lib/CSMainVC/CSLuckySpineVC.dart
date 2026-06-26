import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:cashscratchgo/CSDialog/CSDialog.dart';
import 'package:cashscratchgo/CSDialog/CSGuideDialog.dart';
import 'package:cashscratchgo/CSMainVC/CSCashListVC.dart';
import 'package:cashscratchgo/CSTool/CSNumberHelpers.dart';
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

  late Animation<double> _scaleAnimation;

  late AnimationController _controller;


  @override
  void initState() {
    super.initState();

    /// 放大缩小动画
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.15,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.addStatusListener((status){
      if (status == .completed){
        _controller.reverse();
      } else if (status == .dismissed){
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
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
          )),
          /// 手指动画
          Positioned(
            left: (0.width(context) - 72.w) * 0.65,
            top: 470.h,
            width: 72.w,
            height: 72.h,
            child: ParticleButton(
              onTap: (){
                tapWheel();
              },
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: CSImg(
                  name: 'cs_finger_icon',
                  width: 72.w,
                  height: 72.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  // 2=$20 1=加速卡 3=$50 4=$20 5=加速卡 6=$80 7=$100 8=$50
  void tapWheel(){
    int awards = CSNumberHelpers().getWheelLuckyIndex();
    if (is_tap_wheel== false) {
      if (CSLocalProvider.instance.cs_wheel_number <= 0){
        // 次数不足
        Future.delayed(Duration(seconds: 1),(){
          is_tap_wheel = false;
          context.tipShow(CSWheelNotDialog());
        });
      } else {
        setTxProgress();
        // 2=20 3=50 6=80 7=100
        int row = 2;
        if (awards == 20){
          row = 2;
        } else if (awards == 50){
          row = 3;
        } else if (awards == 80){
          row = 6;
        } else if (awards == 100){
          row = 7;
        } else {
          row = 2;
          awards = 20;
        }
        WheelStartCSNotificationService.sendToStartIndexNotification(row);
        CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_wheel_numberName, CSLocalProvider.instance.cs_wheel_number - 1);
        Future.delayed(Duration(seconds: 2),() async {
          if (CSLocalProvider.instance.cs_wheel_number <= 0){
            CSLuckyWheelNotificationService.sendToDomandNumberNotification(0);
          }
          is_tap_wheel = false;
          if (CSLocalProvider.instance.cs_old_guide == false){
            CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_old_guideName, true);
             int code = await context.tipShow(CSOldAwardDialog(award: 0.to2Double(awards)));
             if (code >= 0){
               txFirstShowDialog();
             }
          } else {
            int code = await context.tipShow(CSBigwinDialog(award: 0.to2Double(awards), isGuide: false));
            if (code >= 0){
              txFirstShowDialog();
            }
          }
        });
      }
    }
    is_tap_wheel = true;
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
    if (CSLocalProvider.instance.cs_tx_task_index == 1 || CSLocalProvider.instance.cs_tx_task_index == 4 || CSLocalProvider.instance.cs_tx_task_index == 7) {
      await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_wheel_indexName, CSLocalProvider.instance.cs_tx_wheel_index + 1);
      Future.delayed(Duration(milliseconds: 50), () async {
        CSCashListNotificationService.sendToDomandNumberNotification(0);
        if (CSLocalProvider.instance.cs_tx_wheel_index >= CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num) {
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


class CSLuckyWheelNotificationService {
  static final StreamController<int> _streamController = StreamController<int>.broadcast();

  static Stream<int> get stream => _streamController.stream;

  static void sendToDomandNumberNotification(int value) {
    _streamController.sink.add(value);
  }

  static void close() {
    _streamController.close();
  }
}
