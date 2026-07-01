import 'dart:async';
import 'dart:math';

import 'package:cashscratchgo/CSBasic/CSTabBar.dart';
import 'package:cashscratchgo/CSTool/CSNumberHelpers.dart';
import 'package:cashscratchgo/CSTool/cs_GradientText.dart';
import 'package:cashscratchgo/CSTool/cs_WebKitView.dart';
import 'package:cashscratchgo/CSTool/cs_ad_manger.dart';
import 'package:cashscratchgo/CSTool/cs_img.dart';
import 'package:cashscratchgo/CSTool/cs_stroke_text.dart';
import 'package:cashscratchgo/CSTool/cs_text.dart';
import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cashscratchgo/CSTool/cs_LocalProvider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../CSMainVC/CSCashListVC.dart';
import '../CSMainVC/CSScratchCardVC.dart';
import '../CSTool/CSAudioUtils.dart';
import '../CSTool/CSTBAEventTool.dart';
import '../CSTool/cs_GradientNumber.dart';
import '../CSTool/cs_extension_help.dart';
import 'package:lottie/lottie.dart';

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
    cs_event_fire('wheel_not_key', {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: 0.width(context),
        height: 0.height(context),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Container(
                width: 272.w,
                height: 296.h,
                decoration: BoxDecoration(
                  image: CSDImg('cs_not_num_bg')
                ),
                child: Stack(
                  alignment: .center,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 28.h),
                        CSGradientStrokeText(text: 'Not Enough\nKeys To Unlock Spin', gradientColors: ['#FFF184'.color(),'#FFA600'.color()], width: 240, height: 56, fontSize: 20, strokeWidth: 1, strokeColor: '#952923'.color()),
                        SizedBox(height: 20.h),
                        CSImg(name: 'cs_not_num_key', width: 100.w, height: 100.w),
                        SizedBox(height: 12.h),
                        ParticleButton(
                          onTap: (){
                            cs_event_fire('wheel_not_key_c', {});
                            Navigator.pop(context, 0);
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
                      ],
                    ),
                    Positioned(right: 0,top: 0,child: ParticleButton(child: CSImg(name: 'cs_close_btn', width: 32, height: 32), onTap: (){
                       Navigator.pop(context, 0);
                       cs_event_fire('wheel_not_key_c', {});
                       if (CSNumberHelpers().checkProbability()){
                         CSCardAds().cs_showAd(context, 'rakwt_close_int', onCacheResponse: (onCacheResponse){}, adDidClosed: (adDidClosed){
                         });
                       }
                    })),
                  ],
                ),
              ),
          ],
        ),
      )
    );
  }
}
// 提现最后一步
class CSLastTipsDialog extends StatefulWidget {
  const CSLastTipsDialog({super.key});

  @override
  State<CSLastTipsDialog> createState() => CSLastTipsDialogState();
}

class CSLastTipsDialogState extends State<CSLastTipsDialog>
    with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
    cs_event_fire('cash_reach_pop', {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: 0.width(context),
          height: 0.height(context),
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              CSImg(name: 'cs_last_top', width: 330, height: 100),
              SizedBox(height: 100.h),
              CSImg(name: 'cs_last_card', width: 160, height: 160),
              SizedBox(height: 7.35.h),
              CSGradientStrokeText(text: '\$${CSNumberHelpers().gameModel!.card_range.first}', gradientColors: ['#FFFFFF'.color(), '#FFF189'.color()], width: 150, height: 48, fontSize: 36, strokeWidth: 1, strokeColor: '#983300'.color()),
              SizedBox(height: 16.h),
              CSText(text: 'Your balance just reached \$${CSNumberHelpers().gameModel!.card_range.first}', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w500),
              SizedBox(height: 60.h),
              ParticleButton(child: Container(
                width: 252,
                height: 52,
                decoration: BoxDecoration(
                  image: CSDImg('cs_green_b_btn')
                ),
                child: Center(
                  child: CSStrokeText(text: 'CLAIM MY \$${CSNumberHelpers().gameModel!.card_range.first} NOW', size: 18, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                ),
              ), onTap: (){
                cs_event_fire('cash_reach_pop_c', {});
                Navigator.pop(context, 0);
                  if (CSLocalProvider.instance.cs_account_id.isEmpty){
                    context.tipShow(CSInputAccountDialog(isGuide: false, isTx: true));
                  } else {
                    // 审核页面
                    context.tipShow(CSReviewActDialog());
                  }
              }),
          
            ],
          ),
        )
    );
  }
}


// 输入账号
class CSInputAccountDialog extends StatefulWidget {
  final bool isGuide;
  final bool isTx;
  const CSInputAccountDialog({super.key, required this.isGuide, required this.isTx});

  @override
  State<CSInputAccountDialog> createState() => CSInputAccountDialogState();
}

class CSInputAccountDialogState extends State<CSInputAccountDialog>
    with SingleTickerProviderStateMixin {

  final TextEditingController controller = TextEditingController();

  bool hasText = false;

  @override
  void initState() {
    super.initState();
   cs_event_fire('cash_confirm_pop', {});
    controller.addListener(() {
      setState(() {
        hasText = controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: 0.width(context),
          height: 0.height(context),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .center,
              children: [
                SizedBox(height: 40.h),
                Row(
                  children: [
                    Spacer(),
                    ParticleButton(child: CSImg(name: 'cs_close_btn', width: 32, height: 32), onTap: (){
                       Navigator.pop(context, 0);
                    }),
                    SizedBox(width: 16.h),
                  ],
                ),
                SizedBox(height: 124.h),
                Container(
                  width: 320.w,
                  height: 392.h,
                  decoration: BoxDecoration(
                    image: CSDImg('cs_pop_bg_0')
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 13.h),
                      CSGradientStrokeText(text: 'Confirm Payment\nInformation', gradientColors: ['#FFEA30'.color(), '#FF9113'.color()], width: 212, height: 40, fontSize: 16, strokeColor: Colors.transparent),
                      SizedBox(height: 27.h),
                      Row(
                        children: [
                          SizedBox(width: 24.w),
                          CSStrokeText(text: 'Payment Method', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#230000'.color()),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Padding(padding: EdgeInsetsGeometry.only(left: 24, right: 16),child: topListWidget()),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          SizedBox(width: 24.w),
                          CSStrokeText(text: 'Email/Phone Number', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#230000'.color()),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        width: 272.w,
                        height: 42.h,
                        decoration: BoxDecoration(
                          color: '#2D0303'.color(),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 272.w,
                            height: 42.h,
                            child: TextField(
                              controller: controller,

                              // ✅ 文字居中
                              textAlign: TextAlign.center,

                              // ✅ 光标也居中
                              textAlignVertical: TextAlignVertical.center,

                              style: TextStyle(
                                fontSize: 14,
                                color: hasText ? Colors.white : '#FFFFFF'.color(), // 两种状态颜色
                              ),

                              decoration: InputDecoration(
                                hintText: " Please Input Your Account ID",
                                hintStyle: TextStyle(
                                  color: '#856565'.color(),
                                ),
                                // 去掉默认边框
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        children: [
                          SizedBox(width: 24.w),
                          CSImg(name: 'cs_Safety_icon_s', width: 16, height: 16),
                          SizedBox(width: 4.w),
                          CSText(text: 'We’ll only use this for sending your withdrawal', size: 10, color: '#DF9797'.color(), weight: FontWeight.w500)
                        ],
                      ),
                      SizedBox(height: 24.h),
                      ParticleButton(child: Container(
                        width: 252,
                        height: 52,
                        decoration: BoxDecoration(
                            image: CSDImg('cs_green_b_btn')
                        ),
                        child: Center(
                          child: CSStrokeText(text: 'ConFirm', size: 18, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                        ),
                      ), onTap: (){

                        cs_event_fire('cash_confirm_pop_c', {});
                        if (controller.text.isEmpty){
                            CSDialogTool.toast(context, 'Please enter the correct withdrawal account number');
                        } else {
                          Navigator.pop(context, 0);
                          // CSDialogTool.toast(context, 'Application submitted, money is on your way');
                          CSLocalProvider.instance.updateString(CSLocalProvider.instance.cs_account_idName, controller.text);
                          if (widget.isGuide){
                            context.tipShow(CSTXConfirmDialog());
                          }
                          if (widget.isTx){
                            context.tipShow(CSReviewActDialog());
                          }
                        }
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  Widget topListWidget(){
    final List<String> items = List.generate(11, (index) => 'cs_cash_list_${index}_${CSLocalProvider.instance.cs_account_seled_index == index ? 's' : "n"}');
    return SizedBox(
      width: 308.w,
      height: 44,
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
              await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_tx_ing_accountName, index);
              setState(() {});
            }),
          );
        },
      ),
    );
  }
}

// 正在审核
class CSReviewActDialog extends StatefulWidget {
  const CSReviewActDialog({super.key});

  @override
  State<CSReviewActDialog> createState() => CSReviewActDialogState();
}

class CSReviewActDialogState extends State<CSReviewActDialog>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _progressAnim;
  
  late Route _route;

  @override
  void initState() {
    super.initState();
    cs_event_fire('ad_review_pop', {});
    /// 进度动画（0 -> 1，2秒）
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _progressAnim = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    _controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;

        final navigator = Navigator.of(context);

        // 当前 route 仍然在栈里才关闭
        if (_route.isCurrent) {
          navigator.pop(0);
          context.tipShow(CSReviewFaildDialog());
        }
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _route = ModalRoute.of(context)!;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: 0.width(context),
        height: 0.height(context),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // ❗你原来这里写错过 .center
            children: [
              SizedBox(height: 80.h),

              // Row(
              //   children: [
              //     const Spacer(),
              //     ParticleButton(
              //       child: CSImg(
              //         name: 'cs_close_btn',
              //         width: 32,
              //         height: 32,
              //       ),
              //       onTap: () {
              //         Navigator.pop(context, 0);
              //       },
              //     ),
              //     SizedBox(width: 16.h),
              //   ],
              // ),

              SizedBox(height: 124.h),

              Container(
                width: 320.w,
                height: 364.h,
                decoration: BoxDecoration(
                  image: CSDImg('cs_pop_bg_0'),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 13.h),

                    CSGradientStrokeText(
                      text: 'Advertiser Review\nPending',
                      gradientColors: [
                        '#FFEA30'.color(),
                        '#FF9113'.color(),
                      ],
                      width: 212,
                      height: 40,
                      fontSize: 16,
                      strokeColor: Colors.transparent,
                    ),

                    SizedBox(height: 47.h),

                    CSImg(
                      name:
                      'cs_cash_list_${CSLocalProvider.instance.cs_account_seled_index}_s',
                      width: 200,
                      height: 72,
                    ),

                    SizedBox(height: 8.h),

                    CSGradientStrokeText(
                      text: '\$${0.to2Double(CSLocalProvider.instance.cs_dollar_number)}',
                      gradientColors: [
                        '#FFFFFF'.color(),
                        '#FFF189'.color(),
                      ],
                      width: 212,
                      height: 40,
                      fontSize: 36,
                      strokeColor: '#983300'.color(),
                    ),

                    SizedBox(height: 28.h),

                    /// ==============================
                    /// ❗只改这里：不动你的CS组件
                    /// ==============================
                    AnimatedBuilder(
                      animation: _progressAnim,
                      builder: (context, child) {
                        final p = _progressAnim.value;

                        return Column(
                          children: [
                            Container(
                              width: 272.w,
                              height: 12.h,
                              decoration: BoxDecoration(
                                image: CSDImg('cs_cash_pro_bg'),
                              ),
                              child: Center(
                                child: GradientProgressBar(
                                  progress: p,
                                  gradientColors: [
                                    '#FFEA76'.color(),
                                    '#F39F0E'.color(),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 4.h),

                            CSText(
                              text: '${(p * 100).toInt()}%',
                              size: 12,
                              color: '#FFD91D'.color(),
                              weight: FontWeight.w700,
                            ),
                          ],
                        );
                      },
                    ),

                    SizedBox(height: 28.h),

                    CSText(
                      text: 'You’re close to unlocking withdrawal',
                      size: 12,
                      color: '#DF9797'.color(),
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientProgressBar extends StatelessWidget {
  final double progress; // 0.0 ~ 1.0
  final double width;
  final double height;

  final List<Color> gradientColors;
  final Color backgroundColor;

  const GradientProgressBar({
    super.key,
    required this.progress,
    this.width = 272,
    this.height = 8,
    required this.gradientColors,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(height / 2),
      child: Container(
        width: width,
        height: height,
        color: backgroundColor,
        child: Stack(
          children: [
            // 已完成进度
            FractionallySizedBox(
              widthFactor: progress.clamp(0.0, 1.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradientColors,
                  ),
                  borderRadius: BorderRadius.circular(height / 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// 审核失败
class CSReviewFaildDialog extends StatefulWidget {
  const CSReviewFaildDialog({super.key});

  @override
  State<CSReviewFaildDialog> createState() => CSReviewFaildDialogState();
}

class CSReviewFaildDialogState extends State<CSReviewFaildDialog>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    cs_event_fire('speed_review_pop', {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: 0.width(context),
          height: 0.height(context),
          child:Column(
                crossAxisAlignment: .center,
                children: [
                  SizedBox(height: 80.h),
                  // Row(
                  //   children: [
                  //     Spacer(),
                  //     ParticleButton(child: CSImg(name: 'cs_close_btn', width: 32, height: 32), onTap: (){
                  //       Navigator.pop(context, 0);
                  //     }),
                  //     SizedBox(width: 16.h),
                  //   ],
                  // ),
                  SizedBox(height: 124.h),
                  Container(
                    width: 320.w,
                    height: 376.h,
                    decoration: BoxDecoration(
                        image: CSDImg('cs_pop_bg_0')
                    ),
                    child: Stack(
                      children: [
                    Positioned(
                      left: 28.w,
                      child: Column(
                        crossAxisAlignment: .center,
                      children: [
                      SizedBox(height: 13.h),
                      CSGradientStrokeText(text: 'Speed Up\nYour Payout?', gradientColors: ['#FFEA30'.color(), '#FF9113'.color()], width: 212, height: 40, fontSize: 16, strokeColor: Colors.transparent),
                      SizedBox(height: 47.h),
                      CSImg(
                        name:
                        'cs_cash_list_${CSLocalProvider.instance.cs_account_seled_index}_s',
                        width: 200,
                        height: 72,
                      ),
                      SizedBox(height: 20.h),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w900,
                              color: '#FFFFFF'.color()
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Current Review Process: ',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(
                              text: '60%',
                              style: TextStyle(color: '#FFD91D'.color(), fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 14.h),
                      SizedBox(width: 272, height: 32,child: CSText(text: 'Advertisers allow eligible users to speed up verification', size: 12, color: '#DF9797'.color(), weight: FontWeight.w500, maxLines: 2, align: .center,)),
                      SizedBox(height: 24.h),
                      ParticleButton(child: Container(
                        width: 252,
                        height: 52,
                        decoration: BoxDecoration(
                            image: CSDImg('cs_green_b_btn')
                        ),
                        child: Center(
                          child: CSStrokeText(text: 'Activate Speed-Up ', size: 18, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                        ),
                      ), onTap: (){
                        cs_event_fire('speed_review_pop_c', {});
                        Navigator.pop(context, 0);
                        context.tipShow(CSTipsCenterDialog(contextStr: 'Withdrawal Boost Access Unlocked'));
                      }),
                      ],
                                        ),
                    ),
                        Positioned(right: 58.w,top: 96.h,child: CSImg(name: 'cs_shan_icon', width: 24, height: 24))
                        ],
                    ),
                  )
                ],
              ),
        ),
    );
  }

  Widget topListWidget(){
    final List<String> items = List.generate(11, (index) => 'cs_cash_list_${index}_${CSLocalProvider.instance.cs_account_seled_index == index ? 's' : "n"}');
    return SizedBox(
      width: 308.w,
      height: 44,
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
              CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_account_seled_indexName, index);
              setState(() {});
            }),
          );
        },
      ),
    );
  }
}
// 提示文案居中
class CSTipsCenterDialog extends StatefulWidget {
  final String contextStr;
  const CSTipsCenterDialog({super.key, required this.contextStr});

  @override
  State<CSTipsCenterDialog> createState() => CSTipsCenterDialogState();
}

class CSTipsCenterDialogState extends State<CSTipsCenterDialog>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  late Route _route;

  @override
  void initState() {
    super.initState();

    /// 平移动画
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.2, 0), // 从屏幕右边外开始
      end: const Offset(0, 0), // 滑到偏左位置
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;

        final navigator = Navigator.of(context);

        // 当前 route 仍然在栈里才关闭
        if (_route.isCurrent) {
          navigator.pop(0);
          context.tipShow(CSUserBoxDialog());
        }
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _route = ModalRoute.of(context)!;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SlideTransition(
            position: _offsetAnimation,
            child: Stack(
              children: [

                Positioned(
                  top: (0.height(context) - 180) * 0.5,
                  child: CSImg(
                    name: 'cs_guide_tips_bg',
                    width: 0.width(context),
                    height: 180,
                  ),
                ),

                Positioned(
                  top: (0.height(context) - 180) * 0.5,
                  child: Column(
                    children: [
                      const SizedBox(height: 62),
                      Padding(
                        padding: EdgeInsets.only(left: 44.w),
                        child: SizedBox(
                          width: 328,
                          height: 72,
                          child: CSText(
                            text:
                            widget.contextStr,
                            size: 24,
                            color: '#F5F4D0'.color(),
                            weight: FontWeight.w700,
                            maxLines: 2,
                            align: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 优质用户开宝箱
class CSUserBoxDialog extends StatefulWidget {
  const CSUserBoxDialog({super.key});

  @override
  State<CSUserBoxDialog> createState() => CSUserBoxDialogState();
}

class CSUserBoxDialogState extends State<CSUserBoxDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  bool _openOne = false;

  int _countDown = 3;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    cs_event_fire('lucky_user_pop', {});
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

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();

    /// ===== 3秒倒计时 =====
    _startCountDown();
  }

  void _startCountDown() {
    _timer?.cancel();
    _countDown = 3;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;

      if (_countDown <= 1) {
        timer.cancel();

        setState(() {
          _countDown = 0;
          _openOne = true; // 自动打开宝箱
          Future.delayed(Duration(seconds: 1),(){
            Navigator.pop(context, 0);
            context.tipShow(CSUserCardDialog());
          });
        });

        return;
      }

      setState(() {
        _countDown--;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SizedBox(
            width: 0.width(context),
            height: 0.height(context),
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                CSImg(name: 'cs_youtitle_icon', width: 292, height: 100),
                SizedBox(height: 12.h),
                CSText(
                  text:
                  'Our advertisers have activated a Lucky Value\nbonus for you.',
                  size: 14,
                  color: '#FFFFFF'.color(),
                  weight: FontWeight.w500,
                  maxLines: 2,
                  align: .center,
                ),
                SizedBox(height: 28.h),

                SizedBox(
                  width: 220,
                  height: 220,
                  child: Lottie.asset(
                    width: 220,
                    height: 220,
                    fit: BoxFit.fill,
                    _openOne
                        ? "box_open.zip".files()
                        : "box_dou.zip".files(),
                    repeat: true,
                  ),
                ),

                SizedBox(height: 92.h),

                ParticleButton(
                  child: Container(
                    width: 252,
                    height: 52,
                    decoration:
                    BoxDecoration(image: CSDImg('cs_green_b_btn')),
                    child: Center(
                      child: CSStrokeText(
                        text: _openOne
                            ? 'Opened'
                            : 'Click To Open ($_countDown s)',
                        size: 18,
                        color: '#FFFFFF'.color(),
                        weight: FontWeight.w900,
                        skWidth: 2,
                        skColor: '#025C10'.color(),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _openOne = true;
                    });
                    cs_event_fire('lucky_user_pop_c', {});
                    Future.delayed(Duration(seconds: 1),(){
                      Navigator.pop(context, 0);
                      context.tipShow(CSUserCardDialog());
                    });
                  },
                ),
              ],
            ),
          ),

          /// 手指动画
          Positioned(
            right: 32.w,
            bottom: 88.h,
            width: 72.w,
            height: 72.h,
            child: ParticleButton(
              onTap: () {
                Navigator.pop(context, 0);
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
          )
        ],
      ),
    );
  }
}
//加速卡收集提示
class CSUserCardDialog extends StatefulWidget {
  const CSUserCardDialog({super.key});

  @override
  State<CSUserCardDialog> createState() => CSUserCardDialogState();
}

class CSUserCardDialogState extends State<CSUserCardDialog> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    cs_event_fire('speed_card_pop', {});
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

    /// 无限循环
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SizedBox(
              width: 0.width(context),
              height: 0.height(context),
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                children: [
                  CSImg(name: 'cs_youtitle_icon', width: 292, height: 100),
                  SizedBox(height: 12.h),
                  CSText(text: 'Our advertisers have activated a Lucky Value\nbonus for you.', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w500, maxLines: 2, align: .center),
                  SizedBox(height: 28.h),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        image: CSDImg('cs_card_shou')
                    ),
                  ),
                  SizedBox(height: 8.h),
                  CSGradientStrokeText(text: 'x1', gradientColors: ['#FFFFFF'.color(), '#FFF189'.color()], width: 120, height: 48, fontSize: 36, strokeWidth: 1, strokeColor: '#983300'.color()),
                  SizedBox(height: 16.h),
                  Container(
                    width: 328.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                        image: CSDImg('cs_cards_top_bg')
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            width: 272.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                                color: '#4E0A0A'.color(),
                                borderRadius: BorderRadius.circular(12.h)
                            ),
                            child: Stack(
                              children: [
                                Positioned(left: 2, top: 2,
                                  child: Container(
                                    width: 268.w * (CSLocalProvider.instance.cs_card_quicken_num / 20),
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                      color: '#F39F0E'.color(),
                                      borderRadius: BorderRadius.circular(12.h),
                                    ),
                                  ),
                                ),
                                Positioned(top: 4.h,left: 100.w,child: CSStrokeText(text: '${CSLocalProvider.instance.cs_card_quicken_num}/20', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#4D2D15'.color()))
                              ],
                            ),
                          ),
                        ),
                        Positioned(left: 6.w,top: 2.h,child: CSImg(name: 'cs_crad_s_bg', width: 40, height: 40,)),
                        Positioned(right: 6.w,top: 6.h,child: Container(
                          width: 100.w,
                          height: 36.h,
                          decoration: BoxDecoration(
                              image: CSDImg('cs_cash_list_${CSLocalProvider.instance.cs_account_seled_index}_s')
                          ),
                          child: Stack(
                            children: [
                              Container(
                                width: 100.w,
                                height: 36.h,
                                decoration: BoxDecoration(
                                    color: '#000000'.color(opacity: 0.5),
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 2.w),
                                    CSImg(name: 'cs_lock_icons', width: 28, height: 28,),
                                    CSGradientStrokeText(text: '\$${0.to2Double(CSLocalProvider.instance.cs_dollar_number)}', gradientColors: ['#FFFFFF'.color(),'#FFF189'.color()], width: 70, height: 24, fontSize: 16, strokeWidth: 1, strokeColor: '#983300'.color())
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(height: 36.h),
                  SizedBox(
                    width: 312,
                    height: 40,
                    child: RichText(
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      text: TextSpan(
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: '#FFFFFF'.color()
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Keep Scratching To ',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: 'Collect 20 Payout Boost Cards ',
                            style: TextStyle(color: '#FFD91D'.color()),
                          ),
                          TextSpan(
                            text: 'And Activate Payout Access',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  ParticleButton(child: Container(
                    width: 252,
                    height: 52,
                    decoration: BoxDecoration(
                        image: CSDImg('cs_green_b_btn')
                    ),
                    child: Center(
                      child: CSStrokeText(text: 'COLLECT NOW', size: 18, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                    ),
                  ), onTap: (){
                    cs_event_fire('speed_card_pop_c', {});
                    Navigator.pop(context, 0);
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
                  }),
                ],
              ),
            ),
            /// 手指动画
            Positioned(
              right: 32.w,
              bottom: 88.h,
              width: 72.w,
              height: 72.h,
              child: ParticleButton(
                onTap: (){
                  cs_event_fire('speed_card_pop_c', {});
                  Navigator.pop(context, 0);
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
            )
          ],
        )
    );
  }
}


// 排行榜
class CSRankDialog extends StatefulWidget {
  const CSRankDialog({super.key});

  @override
  State<CSRankDialog> createState() => CSRankDialogState();
}

class CSRankDialogState extends State<CSRankDialog>
    with SingleTickerProviderStateMixin {

  final List<String> texts = List.generate(CSLocalProvider.instance.cs_all_ranking, (index) => '${index+1}');

  late ScrollController _scrollController = ScrollController();

  List<String> _generateList() {
    final random = Random(); // 创建一个随机数生成器
    List<String> list = List.generate(CSLocalProvider.instance.cs_all_ranking, (index) {
      if (index == CSLocalProvider.instance.cs_current_ranking - 1) { // 第90个位置（索引为89）
        return CSLocalProvider.instance.cs_account_id;
      } else {
        // 生成随机的三位数字
        String randomPart = random.nextInt(1000).toString().padLeft(3, '0');
        return "1*****$randomPart";
      }
    });
    return list;
  }

  final random = Random(); // 创建一个随机数生成器
  // 定义可能的金额值
  List possibleValues = CSNumberHelpers().gameModel!.card_range;
  // 生成列表
  List<String> _generateDolasList() {
    List<String> list = List.filled(CSLocalProvider.instance.cs_all_ranking, ""); // 初始化一个长度为200的空字符串列表

    for (int i = 0; i < list.length; i++) {
      if (i == CSLocalProvider.instance.cs_current_ranking - 1) { // 第90个位置（索引为89）
        list[i] = "${0.dolasType()}${possibleValues[CSLocalProvider.instance.cs_tx_ing_number]}";
      } else {
        // 随机选择一个可能的金额值
        list[i] = '${0.dolasType()}${possibleValues[random.nextInt(possibleValues.length)]}';
      }
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    cs_event_fire('cash_queue_pop', {});
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToIndex(CSLocalProvider.instance.cs_current_ranking);
    });
  }


  void _scrollToIndex(int index) {
    // 每个 item 的高度固定为 38（根据你的例子）
    double itemHeight = 24;

    // 计算目标位置
    final double offset = (index - 1) * itemHeight;

    // 平滑滚动动画
    if (_scrollController.positions.isEmpty) return;
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  /// Returns a random integer between [min] and [max] (inclusive).
  int randomIntInRange({required int min, required int max}) {
    if (min > max) {
      throw ArgumentError('min should be less than or equal to max');
    }
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: 0.width(context),
        height: 0.height(context),
        child:Column(
          crossAxisAlignment: .center,
          children: [
            SizedBox(height: 40.h),
            Row(
              children: [
                Spacer(),
                ParticleButton(child: CSImg(name: 'cs_close_btn', width: 32, height: 32), onTap: (){
                  cs_event_fire('cash_queue_pop_close', {});
                  Navigator.pop(context, 0);
                }),
                SizedBox(width: 16.h),
              ],
            ),
            SizedBox(height: 124.h),
            Container(
              width: 320.w,
              height: 500.h,
              decoration: BoxDecoration(
                  image: CSDImg('cs_rank_bg')
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 24.w,
                    child: Column(
                      crossAxisAlignment: .center,
                      children: [
                        SizedBox(height: 13.h),
                        CSGradientStrokeText(text: "    Verified! You're\nNow in the payout queue.", gradientColors: ['#FFEA30'.color(), '#FF9113'.color()], width: 212, height: 40, fontSize: 16, strokeColor: Colors.transparent),
                        SizedBox(height: 47.h),
                        CSImg(
                          name:
                          'cs_cash_list_${CSLocalProvider.instance.cs_account_seled_index}_s',
                          width: 200,
                          height: 72,
                        ),
                        SizedBox(height: 8.h),
                        CSGradientStrokeText(text: '\$${CSNumberHelpers().gameModel!.card_range.first}', gradientColors: ['#FFFFFF'.color(), '#FFF189'.color()], width: 150, height: 48, fontSize: 36, strokeWidth: 1, strokeColor: '#983300'.color()),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'librefranklin',
                                color: '#FFFFFF'.color()
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${CSLocalProvider.instance.cs_all_ranking} ',
                                style: TextStyle(color: '#FFD91D'.color()),
                              ),
                              TextSpan(
                                text: 'In queue, Your Current Rank: ',
                              ),
                              TextSpan(
                                text: '${CSLocalProvider.instance.cs_current_ranking}',
                                style: TextStyle(color: '#FFD91D'.color()),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          width: 272.w,
                          height: 120.h,
                          decoration: BoxDecoration(
                              color: '#5A0909'.color(),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'User ID',
                                        style: TextStyle(color: '#DF9797'.color(), fontSize: 12, fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'Number',
                                        style: TextStyle(color: '#DF9797'.color(), fontSize: 12, fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'Amount',
                                        style: TextStyle(color: '#DF9797'.color(), fontSize: 12, fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 0.h),
                              SizedBox(
                                width: 272.0.w,
                                height: 96.h,
                                child: ListView.builder(
                                  controller: _scrollController,
                                  padding: const EdgeInsets.only(top: 0.0),
                                  itemCount: texts.length, // 计算需要多少行
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 272.0.w,
                                      height: 24,
                                      decoration: BoxDecoration(
                                          color: index + 1 == CSLocalProvider.instance.cs_current_ranking ? '#0A4BA1'.color() : Colors.transparent,
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                texts[index],
                                                style: TextStyle(color: index + 1 == CSLocalProvider.instance.cs_current_ranking ? '#FFFFFF'.color() : '#FFFFFF'.color(), fontSize: 12, fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                _generateList()[index],
                                                style: TextStyle(color: index + 1 == CSLocalProvider.instance.cs_current_ranking ? '#FFFFFF'.color() : '#FFFFFF'.color(), fontSize: 12, fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                _generateDolasList()[index],
                                                style: TextStyle(color: index + 1 == CSLocalProvider.instance.cs_current_ranking ? '#FFFFFF'.color() : '#FFFFFF'.color(), fontSize: 12, fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 32.h),
                        ParticleButton(child: Container(
                          width: 252,
                          height: 52,
                          decoration: BoxDecoration(
                              image: CSDImg('cs_green_b_btn')
                          ),
                          child: Center(
                            child: CSStrokeText(text: 'SKIP WAIT', size: 24, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                          ),
                        ), onTap: (){
                          CSCardAds().cs_showAd(context, 'rakwt_queue_rv', onCacheResponse: (onCacheResponse){
                          }, adDidClosed: (adDidClosed) async {
                            cs_rankupdate();
                            await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_rank_ad_countName, CSLocalProvider.instance.cs_rank_ad_count + 1);
                            cs_event_fire('cash_queue_pop_c', {'ad_number' : CSLocalProvider.instance.cs_rank_ad_count});
                          });
                        }),
                      ],
                    ),
                  ),
                  Positioned(left: 82.w,top: 14.h,child: CSImg(name: 'cs_dui_icons', width: 20, height: 20)),
                  Positioned(right: 26.w,bottom: 70.h,child: CSImg(name: 'cs_ad_icon', width: 32, height: 32))
                ],
              ),
            )
          ],
        ),
      ),
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
      _scrollToIndex(CSLocalProvider.instance.cs_current_ranking);
      if (!mounted) return;
      CSDialogTool.toastRanking(context, 1);
      Navigator.pop(context, 1);
      context.tipShow(CSTXLastDialog(type: CSLocalProvider.instance.cs_tx_task_index));
      CSCashListNotificationService.sendToDomandNumberNotification(0);
    } else {
      await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_all_rankingName, CSLocalProvider.instance.cs_all_ranking - randomIntInRange(min: CSNumberHelpers().gameModel!.queue_number_all.int_all_delete!.first, max: CSNumberHelpers().gameModel!.queue_number_all.int_all_delete!.last));
      await CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_current_rankingName, CSLocalProvider.instance.cs_current_ranking - row);
      _scrollToIndex(CSLocalProvider.instance.cs_current_ranking);
      Future.delayed(Duration(milliseconds: 50),(){
        if (!mounted) return;
        setState(() {
          CSDialogTool.toastRanking(context, CSLocalProvider.instance.cs_current_ranking);
          CSCashListNotificationService.sendToDomandNumberNotification(0);
        });
      });
    }
  }
}


// 提现最后一步
class CSTXLastDialog extends StatefulWidget {
  final int type;
  const CSTXLastDialog({super.key, required this.type});
  @override
  State<CSTXLastDialog> createState() => CSTXLastDialogState();
}

class CSTXLastDialogState extends State<CSTXLastDialog>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    cs_event_fire('one_last_step_pop', {'task_from' : gettypeString()});
  }

  @override
  void dispose() {
    super.dispose();
  }

  String gettypeString(){
    if (widget.type == 0){
      return 'card';
    } else if (widget.type == 1){
      return 'wheel';
    } else if (widget.type == 2){
      return 'bubble';
    } else if (widget.type == 3){
      return 'card';
    } else if (widget.type == 4){
      return 'wheel';
    } else if (widget.type == 5){
      return 'bubble';
    } else if (widget.type == 6){
      return 'card';
    } else if (widget.type == 7){
      return 'wheel';
    } else {
      return 'bubble';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: 0.width(context),
        height: 0.height(context),
        child:Column(
          crossAxisAlignment: .center,
          children: [
            SizedBox(height: 40.h),
            Row(
              children: [
                Spacer(),
                ParticleButton(child: CSImg(name: 'cs_close_btn', width: 32, height: 32), onTap: (){
                  Navigator.pop(context, 0);
                  cs_event_fire('one_last_step_pop_close', {'task_from' : gettypeString()});
                }),
                SizedBox(width: 16.h),
              ],
            ),
            SizedBox(height: 124.h),
            Container(
              width: 320.w,
              height: 464.h,
              decoration: BoxDecoration(
                  image: CSDImg('cs_last_bg')
              ),
              child: Column(
                crossAxisAlignment: .center,
                children: [
                  SizedBox(height: 13.h),
                  CSGradientStrokeText(text: "One Last Step", gradientColors: ['#FFEA30'.color(), '#FF9113'.color()], width: 212, height: 40, fontSize: 20, strokeColor: Colors.transparent),
                  SizedBox(height: 49.h),
                  CSImg(
                    name:
                    'cs_cash_list_${CSLocalProvider.instance.cs_account_seled_index}_s',
                    width: 200,
                    height: 72,
                  ),
                  SizedBox(height: 8.h),
                  CSGradientStrokeText(text: '\$${CSNumberHelpers().gameModel!.card_range.first}', gradientColors: ['#FFFFFF'.color(), '#FFF189'.color()], width: 150, height: 48, fontSize: 36, strokeWidth: 1, strokeColor: '#983300'.color()),
                  SizedBox(height: 8.h),
                  SizedBox(width: 272, height: 48,child: CSText(text: 'Only One Step Away From Successful Withdrawal', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w900, maxLines: 2, align: .center)),
                  Container(
                    width: 272.w,
                    height: 78.h,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16.h)
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 12.h),
                        CSText(text: getTaskString(), size: 14, color: '#FFD91D'.color(), weight: FontWeight.w500),
                        SizedBox(height: 15.h),
                        Container(
                          width: 272.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                              color: '#320707'.color(),
                              borderRadius: BorderRadius.circular(12.h)
                          ),
                          child: Stack(
                            children: [
                              Container(
                                width: 272.w * getTaskProgress(),
                                height: 24.h,
                                decoration: BoxDecoration(
                                  color: '#F39F0E'.color(),
                                  borderRadius: BorderRadius.circular(12.h),
                                ),
                              ),
                              Positioned(top: 6.h,left: 128.w,child: CSStrokeText(text: '${(getTaskProgress() * 100).toInt()}%', size: 10, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#4D2D15'.color()))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  ParticleButton(child: Container(
                    width: 252,
                    height: 52,
                    decoration: BoxDecoration(
                        image: CSDImg('cs_green_b_btn')
                    ),
                    child: Center(
                      child: CSStrokeText(text: 'CASH OUT', size: 24, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                    ),
                  ), onTap: (){
                    cs_event_fire('one_last_step_pop_c', {'task_from' : gettypeString()});
                    Navigator.pop(context, 0);
                    if (CSLocalProvider.instance.cs_tx_task_index == 0){
                      CashTabController.switchTo(0);
                    } else if (CSLocalProvider.instance.cs_tx_task_index == 1){
                      cs_event_fire('wheel_c', {'source_from' : 'task'});
                      CashTabController.switchTo(1);
                    } else if (CSLocalProvider.instance.cs_tx_task_index == 3){
                      cs_event_fire('wheel_c', {'source_from' : 'task'});
                      CashTabController.switchTo(1);
                    } else if (CSLocalProvider.instance.cs_tx_task_index == 4){
                      CashTabController.switchTo(0);
                    } else if (CSLocalProvider.instance.cs_tx_task_index == 5){
                      cs_event_fire('wheel_c', {'source_from' : 'task'});
                      CashTabController.switchTo(1);
                    } else if (CSLocalProvider.instance.cs_tx_task_index == 6){
                      cs_event_fire('wheel_c', {'source_from' : 'task'});
                      CashTabController.switchTo(1);
                    } else if (CSLocalProvider.instance.cs_tx_task_index == 7){
                      CashTabController.switchTo(0);
                    } else if (CSLocalProvider.instance.cs_tx_task_index == 8){
                      cs_event_fire('wheel_c', {'source_from' : 'task'});
                      CashTabController.switchTo(1);
                    } else if (CSLocalProvider.instance.cs_tx_task_index == 9){
                      cs_event_fire('wheel_c', {'source_from' : 'task'});
                      CashTabController.switchTo(1);
                    }
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

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

  double getTaskProgress(){
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
    } else {
      return CSLocalProvider.instance.cs_tx_bubble_index / CSNumberHelpers().gameModel!.wtd_task[CSLocalProvider.instance.cs_tx_task_index].num;
    }
  }

  bool isBrazilianPortuguese(BuildContext context) {
    // 获取当前语言环境
    Locale currentLocale = Localizations.localeOf(context);

    // 判断是否是巴西葡萄牙语
    return currentLocale.languageCode == 'pt' || currentLocale.countryCode == 'BR';
  }

}

// 挂卡流程弹窗
class CSCardTipsDialog extends StatefulWidget {
  const CSCardTipsDialog({super.key});

  @override
  State<CSCardTipsDialog> createState() => CSCardTipsDialogState();
}

class CSCardTipsDialogState extends State<CSCardTipsDialog> with SingleTickerProviderStateMixin{

  late Animation<double> _scaleAnimation;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    cs_event_fire('process_confirm_account_pop', {});
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
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: 140.h),
                  CSImg(name: 'cs_card_top_title', width: 321, height: 56),
                  SizedBox(height: 8.h),
                  CSText(text: 'You’re About To Withdraw \$${CSNumberHelpers().gameModel!.card_range.first}', size: 18, color: '#FFFFFF'.color(), weight: FontWeight.w700),
                  SizedBox(height: 78.h),
                  CSText(text: 'Pending Balance', size: 16, color: '#FFFFFF'.color(), weight: FontWeight.w500),
                  SizedBox(height: 28.h),
                  CSImg(
                    name:
                    'cs_cash_list_${CSLocalProvider.instance.cs_account_seled_index}_s',
                    width: 200,
                    height: 72,
                  ),
                  SizedBox(height: 8.h),
                  CSGradientStrokeText(text: '\$${CSNumberHelpers().gameModel!.card_range.first}', gradientColors: ['#FFFFFF'.color(), '#FFF189'.color()], width: 150, height: 48, fontSize: 36, strokeWidth: 1, strokeColor: '#983300'.color()),
                  SizedBox(height: 138.h),
                  ParticleButton(child: Container(
                    width: 252,
                    height: 52,
                    decoration: BoxDecoration(
                        image: CSDImg('cs_green_b_btn')
                    ),
                    child: Center(
                      child: CSStrokeText(text: 'CONFIRM ACCOUNT', size: 18, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                    ),
                  ), onTap: (){
                    Navigator.pop(context, 0);
                    if (CSLocalProvider.instance.cs_account_id.isNotEmpty){
                      cs_event_fire('process_confirm_account_pop_c', {'type' : 'yes'});
                      context.tipShow(CSAccountConfrimDialog());
                    } else {
                      cs_event_fire('process_confirm_account_pop_c', {'type' : 'no'});
                      context.tipShow(CSInputAccountDialog(isGuide: true, isTx: false));
                    }
                  })
                ],
              ),
            ),
            Positioned(right: 14.w,bottom: 100.h,
              width: 72.w,
              height: 72.h,child: ParticleButton(
              onTap: (){
                Navigator.pop(context, 0);
              },
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: CSImg(
                  name: 'cs_finger_icon',
                  width: 72.w,
                  height: 72.h,
                ),
              ),
            ),)
          ],
        )
    );
  }
}

// 账号确认弹窗
class CSAccountConfrimDialog extends StatefulWidget {
  const CSAccountConfrimDialog({super.key});

  @override
  State<CSAccountConfrimDialog> createState() => CSAccountConfrimDialogState();
}

class CSAccountConfrimDialogState extends State<CSAccountConfrimDialog>
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
      body: SizedBox(
        width: 0.width(context),
        height: 0.height(context),
        child:Column(
          crossAxisAlignment: .center,
          children: [
            SizedBox(height: 40.h),
            Row(
              children: [
                Spacer(),
                ParticleButton(child: CSImg(name: 'cs_close_btn', width: 32, height: 32), onTap: (){
                  Navigator.pop(context, 0);
                  context.tipShow(CSTXConfirmDialog());
                }),
                SizedBox(width: 16.h),
              ],
            ),
            SizedBox(height: 124.h),
            Container(
              width: 320.w,
              height: 324.h,
              decoration: BoxDecoration(
                  image: CSDImg('cs_confirm_bg')
              ),
              child: Column(
                children: [
                  SizedBox(height: 13.h),
                  CSGradientStrokeText(text: "Advertiser Payment\nConfirmation", gradientColors: ['#FFEA30'.color(), '#FF9113'.color()], width: 212, height: 40, fontSize: 16, strokeColor: Colors.transparent),
                  SizedBox(height: 27.h),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      CSStrokeText(text: 'Account Name:', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#230000'.color()),
                      SizedBox(width: 4.w),
                      Container(
                        width: 164.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: '#5A2323'.color(),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Center(
                          child: CSText(text: '${CSLocalProvider.instance.cs_account_id}', size: 16, color: '#FFFFFF'.color(), weight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      SizedBox(width: 24.w,),
                      CSStrokeText(text: 'Payment Method:', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#230000'.color()),
                      SizedBox(width: 4.w),
                      Container(
                        width: 100.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                            image: CSDImg('cs_cash_list_${CSLocalProvider.instance.cs_account_seled_index}_s')
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      SizedBox(width: 24.w,),
                      CSImg(name: 'cs_Safety_icon_s', width: 16, height: 16),
                      SizedBox(width: 4.w),
                      CSText(text: 'We’ll only use this for sending your withdrawal', size: 10, color: '#DF9797'.color(), weight: FontWeight.w500)
                    ],
                  ),
                  SizedBox(height: 24.h),
                  ParticleButton(child: Container(
                    width: 252,
                    height: 52,
                    decoration: BoxDecoration(
                        image: CSDImg('cs_green_b_btn')
                    ),
                    child: Center(
                      child: CSStrokeText(text: 'APPLY FOR PAYOUT', size: 18, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                    ),
                  ), onTap: (){
                    Navigator.pop(context, 0);
                    context.tipShow(CSTXConfirmDialog());
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 收集加速卡
class CSAccelerationCardDialog extends StatefulWidget {
  final double award;
  const CSAccelerationCardDialog({super.key, required this.award});

  @override
  State<CSAccelerationCardDialog> createState() => CSAccelerationCardDialogState();
}

class CSAccelerationCardDialogState extends State<CSAccelerationCardDialog> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    cs_event_fire('speed_card_getpop', {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: 140.h),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'librefranklin',
                          color: '#FFFFFF'.color()
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Just ',
                        ),
                        TextSpan(
                          text: '20',
                          style: TextStyle(color: '#FFD91D'.color()),
                        ),
                        TextSpan(
                          text: ' PayOut Boost Card to Cash Out! ',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    width: 328.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      image: CSDImg('cs_cards_top_bg')
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            width: 272.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                                color: '#4E0A0A'.color(),
                                borderRadius: BorderRadius.circular(12.h)
                            ),
                            child: Stack(
                              children: [
                                Positioned(left: 2, top: 2,
                                  child: Container(
                                    width: 268.w * CSLocalProvider.instance.cs_card_quicken_num / 20,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                      color: '#F39F0E'.color(),
                                      borderRadius: BorderRadius.circular(12.h),
                                    ),
                                  ),
                                ),
                                Positioned(top: 4.h,left: 128.w,child: CSStrokeText(text: '${0.to2Double(CSLocalProvider.instance.cs_card_quicken_num)}/20', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#4D2D15'.color()))
                              ],
                            ),
                          ),
                        ),
                        Positioned(left: 6.w,top: 2.h,child: CSImg(name: 'cs_crad_s_bg', width: 40, height: 40,)),
                        Positioned(right: 6.w,top: 6.h,child: Container(
                          width: 100.w,
                          height: 36.h,
                          decoration: BoxDecoration(
                            image: CSDImg('cs_cash_list_${CSLocalProvider.instance.cs_account_seled_index}_s')
                          ),
                          child: Stack(
                            children: [
                              Container(
                                width: 100.w,
                                height: 36.h,
                                decoration: BoxDecoration(
                                  color: '#000000'.color(opacity: 0.5),
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 2.w),
                                    CSImg(name: 'cs_lock_icons', width: 28, height: 28,),
                                    CSGradientStrokeText(text: '\$${0.to2Double(CSLocalProvider.instance.cs_dollar_number)}', gradientColors: ['#FFFFFF'.color(),'#FFF189'.color()], width: 70, height: 24, fontSize: 16, strokeWidth: 1, strokeColor: '#983300'.color())
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  CSText(text: 'Money’s In—Ready To Withdraw!', size: 12, color: '#DF9797'.color(), weight: FontWeight.w500),
                  SizedBox(height: 36.h),
                  CSImg(name: 'cs_crad_b_bg', width: 120, height: 120),
                  SizedBox(height: 7.h),
                  CSGradientStrokeText(text: 'x${widget.award}', gradientColors: ['#FFFFFF'.color(), '#FFF189'.color()], width: 100, height: 48, fontSize: 36, strokeWidth: 2, strokeColor: '#983300'.color()),
                  SizedBox(height: 136.h),
                  ParticleButton(child: Container(
                    width: 252,
                    height: 52,
                    decoration: BoxDecoration(
                        image: CSDImg('cs_green_b_btn')
                    ),
                    child: Row(
                      mainAxisAlignment: .center,
                          children: [
                            CSStrokeText(text: 'COLLECT', size: 24, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                            SizedBox(width: 12.w),
                            CSImg(name: 'cs_ad_icon', width: 24, height: 24)
                          ],
                    ),
                  ), onTap: (){
                    Navigator.pop(context, 1);
                    cs_event_fire('speed_card_getpop_c', {});
                    CSCardAds().cs_showAd(context, 'rakwt_boost_rv', onCacheResponse: (onCacheResponse){}, adDidClosed: (adDidClosed){
                      CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_card_quicken_numName, CSLocalProvider.instance.cs_card_quicken_num + widget.award);
                    });
                  }),
                  SizedBox(height: 20.h),
                  CSUnderlineTextButton(text: 'Give Up', textColor: '#FFFFFF'.color(), underlineColor: '#FFFFFF'.color(),onPressed: (){
                    cs_event_fire('speed_card_getpop_close', {});
                    Navigator.pop(context,0);
                    if (CSNumberHelpers().checkProbability()){
                      CSCardAds().cs_showAd(context, 'rakwt_close_int', onCacheResponse: (onCacheResponse){}, adDidClosed: (adDidClosed){
                      });
                    }
                  },)
                ],
              ),
            ),
          ],
        )
    );
  }
}
// 提交信息确认无误
class CSTXConfirmDialog extends StatefulWidget {
  const CSTXConfirmDialog({super.key});

  @override
  State<CSTXConfirmDialog> createState() => CSTXConfirmDialogState();
}

class CSTXConfirmDialogState extends State<CSTXConfirmDialog>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  late Route _route;

  @override
  void initState() {
    super.initState();

    /// 平移动画
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.2, 0), // 从屏幕右边外开始
      end: const Offset(0, 0), // 滑到偏左位置
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;

        final navigator = Navigator.of(context);

        // 当前 route 仍然在栈里才关闭
        if (_route.isCurrent) {
          navigator.pop(0);
        }
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _route = ModalRoute.of(context)!;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SlideTransition(
            position: _offsetAnimation,
            child: Stack(
              children: [

                Positioned(
                  top: (0.height(context) - 180) * 0.5,
                  child: CSImg(
                    name: 'cs_guide_tips_bg',
                    width: 0.width(context),
                    height: 180,
                  ),
                ),

                Positioned(
                  top: (0.height(context) - 180) * 0.5,
                  height: 180,
                  child: Column(
                    children: [
                      SizedBox(height: 42),
                      Row(
                        children: [
                          SizedBox(width: 32.w),
                          CSText(text: 'Payout Details Confirmed.', size: 20, color: '#F5F4D0'.color(), weight: FontWeight.w900),
                          SizedBox(width: 8.w),
                          CSImg(name: 'cs_dui_icons', width: 28, height: 28)
                        ],
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 20.w),
                        child: SizedBox(
                          width: 328,
                          height: 51,
                          child:
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'librefranklin',
                                  color: '#F5F4D0'.color()
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Scratch To Release Your ',
                                ),
                                TextSpan(
                                  text: '\$${CSNumberHelpers().gameModel!.card_range.first} ',
                                  style: TextStyle(color: '#FFE53B'.color(), fontSize: 24.0),
                                ),
                                TextSpan(
                                  text: 'Cash Out.',
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 今日超容易提现提示
class CSTXConfirm2Dialog extends StatefulWidget {
  const CSTXConfirm2Dialog({super.key});

  @override
  State<CSTXConfirm2Dialog> createState() => CSTXConfirm2DialogState();
}

class CSTXConfirm2DialogState extends State<CSTXConfirm2Dialog>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  late Route _route;

  @override
  void initState() {
    super.initState();

    /// 平移动画
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.2, 0), // 从屏幕右边外开始
      end: const Offset(0, 0), // 滑到偏左位置
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;

        final navigator = Navigator.of(context);

        // 当前 route 仍然在栈里才关闭
        if (_route.isCurrent) {
          navigator.pop(0);
        }
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _route = ModalRoute.of(context)!;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SlideTransition(
            position: _offsetAnimation,
            child: Stack(
              children: [

                Positioned(
                  top: (0.height(context) - 180) * 0.5,
                  child: CSImg(
                    name: 'cs_guide_tips_bg',
                    width: 0.width(context),
                    height: 180,
                  ),
                ),

                Positioned(
                  top: (0.height(context) - 180) * 0.5,
                  height: 180,
                  child: Column(
                    children: [
                      SizedBox(height: 56),
                      Row(
                        children: [
                          SizedBox(width: 65.w),
                          CSText(text: 'Keep Scratching!', size: 24, color: '#F5F4D0'.color(), weight: FontWeight.w900),
                        ],
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 16.w),
                        child: SizedBox(
                          width: 328,
                          height: 51,
                          child:
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'librefranklin',
                                  color: '#F5F4D0'.color()
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Toady Super Easy Cash Out ',
                                ),
                                TextSpan(
                                  text: '\$${CSNumberHelpers().gameModel!.card_range.first} ',
                                  style: TextStyle(color: '#FFE53B'.color(), fontSize: 24.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 挂卡随机出横幅
class CSCardhengDialog extends StatefulWidget {
  final String tips;
  const CSCardhengDialog({super.key, required this.tips});

  @override
  State<CSCardhengDialog> createState() => CSCardhengDialogState();
}

class CSCardhengDialogState extends State<CSCardhengDialog>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  late Route _route;

  @override
  void initState() {
    super.initState();

    /// 平移动画
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.2, 0), // 从屏幕右边外开始
      end: const Offset(0, 0), // 滑到偏左位置
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;

        final navigator = Navigator.of(context);

        // 当前 route 仍然在栈里才关闭
        if (_route.isCurrent) {
          navigator.pop(0);
        }
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _route = ModalRoute.of(context)!;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SlideTransition(
            position: _offsetAnimation,
            child: Stack(
              children: [

                Positioned(
                  top: (0.height(context) - 180) * 0.5,
                  child: CSImg(
                    name: 'cs_guide_tips_bg',
                    width: 0.width(context),
                    height: 180,
                  ),
                ),

                Positioned(
                  top: (0.height(context) - 180) * 0.5,
                  height: 180,
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .center,
                    children: [
                      SizedBox(height: 32),
                      SizedBox(
                        width: 0.width(context),
                        height: 80,
                        child: CSText(text: widget.tips, size: 24, color: '#F5F4D0'.color(), weight: FontWeight.w700, align: .center, maxLines: 3),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// 答题排行榜2
class CSQuizRankTwoDialog extends StatefulWidget {
  final int quiz_num;
  const CSQuizRankTwoDialog({super.key, required this.quiz_num});

  @override
  State<CSQuizRankTwoDialog> createState() => CSQuizRankTwoDialogState();
}

class CSQuizRankTwoDialogState extends State<CSQuizRankTwoDialog>
    with SingleTickerProviderStateMixin {

  static final Random _random = Random();

  final double cellHeight = 56;
  final double spacing = 8;

  bool showExtras = false;
  bool showBreath = false;

  late AnimationController _breathController;
  late Animation<double> _breathAnimation;

  late List<int> order; // ⭐ 直接用“真实顺序”

  late final List<String> avatars;
  late final List<String> names;

  @override
  void initState() {
    super.initState();

    cs_event_fire('process_rank_pop', {});

    avatars = List.generate(4, (_) => 'cs_jie_user_${random0to55()}');
    names = List.generate(4, (_) => '1****${random1000to9999()}.@gamial');

    avatars[3] = 'cs_h5_icon';
    names[3] = CSLocalProvider.instance.cs_account_id;

    // ⭐ 初始顺序（最后一个在最底）
    order = [0, 1, 2, 3];

    _breathController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _breathAnimation = Tween<double>(
      begin: 1.0,
      end: 1.12,
    ).animate(
      CurvedAnimation(
        parent: _breathController,
        curve: Curves.easeInOut,
      ),
    );

    _breathController.addListener(() {
      setState(() {});
    });

    _breathController.repeat(reverse: true);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      startClimbAnimation();
    });
  }

  @override
  void dispose() {
    _breathController.dispose();
    super.dispose();
  }

  static int random0to55() => _random.nextInt(21);
  static int random1000to9999() => 1000 + _random.nextInt(9000);

  // ===============================
  // ⭐ 核心：一步一步“爬楼梯”
  // ===============================
  Future<void> startClimbAnimation() async {

    Future<void> swap(int i1, int i2) async {
      setState(() {
        final tmp = order[i1];
        order[i1] = order[i2];
        order[i2] = tmp;
      });

      await Future.delayed(const Duration(milliseconds: 420));
    }

    // ⭐ 只动最后一个：一步一步往上换
    await swap(3, 2);
    await swap(2, 1);
    await swap(1, 0);

    setState(() {
      showExtras = true;
      showBreath = true;
    });
  }

  double yOffset(int visualIndex) =>
      visualIndex * (cellHeight + spacing);

  // ===============================
  // ⭐ 单个 cell
  // ===============================
  Widget buildCell(int positionIndex) {

    final int dataIndex = order[positionIndex];

    // ⭐ 第一名（当前视觉第0位）
    final bool isTop = positionIndex == 0;

    final bool isBreathing = showBreath && isTop;

    final int showNumber =
    dataIndex == 3 ? widget.quiz_num : widget.quiz_num - dataIndex - 1;

    Widget child = Padding(
      padding: EdgeInsets.only(
        left: 32.w,
        right: 32.w,
        bottom: 8,
        top: 88.h,
      ),
      child: Container(
        width: 288.w,
        height: 56.h,
        decoration: BoxDecoration(
          image: CSDImg('cs_rank_bg_n'),
        ),
        child: Row(
          children: [

            const SizedBox(width: 8),

            CSImg(
              name: isBreathing ? 'cs_h5_icon' : avatars[dataIndex],
              width: 40,
              height: 40,
            ),

            const SizedBox(width: 8),

            SizedBox(
              width: 114,
              child: CSText(
                text: isBreathing
                    ? CSLocalProvider.instance.cs_account_id
                    : names[dataIndex],
                size: 11,
                color: '#4F0011'.color(),
                weight: FontWeight.w500,
              ),
            ),

            const SizedBox(width: 4),

            CSText(
              text: 'Scratch',
              size: 12,
              color: '#4F0011'.color(),
              weight: FontWeight.w500,
            ),

            const SizedBox(width: 4),

            CSStrokeText(
              text: '$showNumber',
              size: 16,
              color: '#F10000'.color(),
              weight: FontWeight.w700,
              skWidth: 1,
              skColor: '#FFFFFF'.color(),
            ),

            const SizedBox(width: 4),

            CSImg(name: 'cs_rank_card', width: 24, height: 24),
          ],
        ),
      ),
    );

    // ⭐ 呼吸动画只给真正第一名
    if (isBreathing) {
      child = Transform.scale(
        scale: _breathAnimation.value,
        child: child,
      );
    }

    return AnimatedPositioned(
      key: ValueKey(dataIndex),
      left: 15,
      right: 15,
      top: yOffset(positionIndex) + 170.h,
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeInOut,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [

          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Center(
              child: Container(
                width: 312,
                height: 360,
                decoration: BoxDecoration(
                  image: CSDImg('cs_ranklist_bg'),
                ),
                child: Column(
                  children: [

                    const Spacer(),

                    if (showExtras)
                      ParticleButton(
                        child: Container(
                          width: 252,
                          height: 52,
                          decoration: BoxDecoration(
                            image: CSDImg('cs_green_b_btn'),
                          ),
                          child: Center(
                            child: CSStrokeText(
                              text: 'KEEP SCRATCH, SPEED CASH',
                              size: 14,
                              color: '#FFFFFF'.color(),
                              weight: FontWeight.w900,
                              skWidth: 2,
                              skColor: '#025C10'.color(),
                            ),
                          ),
                        ),
                        onTap: () {
                          cs_event_fire('process_rank_pop_c', {});
                          Navigator.pop(context, 1);
                        },
                      ),

                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          ),

          // ⭐ 按“位置渲染”
          for (int i = 0; i < order.length; i++)
            buildCell(i),

          Positioned(
            left: 46.w,
            top: 180.h,
            child: CSImg(name: 'cs_rank_top1', width: 284, height: 68),
          ),

          Positioned(
            right: 32.w,
            top: 80.h,
            child: ParticleButton(
              child: CSImg(name: 'cs_close_btn', width: 32, height: 32),
              onTap: () {
                cs_event_fire('process_rank_pop_close', {});
                Navigator.pop(context, 0);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// 快提现提醒1
class CSTXonlyDialog extends StatefulWidget {
  const CSTXonlyDialog({super.key});

  @override
  State<CSTXonlyDialog> createState() => CSTXonlyDialogState();
}

class CSTXonlyDialogState extends State<CSTXonlyDialog>
    with SingleTickerProviderStateMixin {

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
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: 0.width(context),
        height: 0.height(context),
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: .center,
                mainAxisAlignment: .center,
                children: [
                  SizedBox(height: 20.h),
                  CSImg(name: 'cs_only_title', width: 320, height: 108),
                  SizedBox(height: 14.h),
                  Container(
                    width: 320.w,
                    height: 336.h,
                    decoration: BoxDecoration(
                      image: CSDImg('cs_only_bg')
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 13.h),
                        CSGradientStrokeText(text: 'Pending Balance', gradientColors: ['#FFEA30'.color(), '#FF9113'.color()], width: 212, height: 40, fontSize: 20
                            , strokeColor: Colors.transparent),
                        SizedBox(height: 47.h),
                        CSImg(
                          name:
                          'cs_cash_list_${CSLocalProvider.instance.cs_account_seled_index}_s',
                          width: 200,
                          height: 72,
                        ),
                        SizedBox(height: 8.h),
                        CSGradientStrokeText(text: '\$${0.to2Double(CSLocalProvider.instance.cs_dollar_number)}', gradientColors: ['#FFFFFF'.color(), '#FFF189'.color()], width: 150, height: 48, fontSize: 36, strokeWidth: 1, strokeColor: '#983300'.color()),
                        SizedBox(height: 24.h),
                        ParticleButton(
                          child: Container(
                            width: 252,
                            height: 52,
                            decoration: BoxDecoration(
                              image: CSDImg('cs_green_b_btn'),
                            ),
                            child: Row(
                              mainAxisAlignment: .center,
                              children: [
                                CSStrokeText(text: 'ONLY ${0.to2Double(20 - CSLocalProvider.instance.cs_card_quicken_num)}', size: 18, color: '#FFFFFF'.color(), weight: FontWeight.w700, skWidth: 2, skColor: '#025C10'.color()),
                                SizedBox(width: 4),
                                CSImg(name: 'cs_jie_1_4', width: 24, height: 24),
                                SizedBox(width: 4),
                                CSStrokeText(text: 'LEFT', size: 18, color: '#FFFFFF'.color(), weight: FontWeight.w700, skWidth: 2, skColor: '#025C10'.color()),
                              ],
                            )
                          ),
                          onTap: () {
                            Navigator.pop(context, 1);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              right: 20.w,
              bottom: 150.h,
              width: 72.w,
              height: 72.h,
              child: ParticleButton(
                onTap: (){
                  Navigator.pop(context, 0);
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
            )
          ],
        ),
      ),
    );
  }
}


// 快提现提醒2
class CSTXonly2Dialog extends StatefulWidget {
  final int pro;

  const CSTXonly2Dialog({
    super.key,
    required this.pro,
  });

  @override
  State<CSTXonly2Dialog> createState() => CSTXonly2DialogState();
}

class CSTXonly2DialogState extends State<CSTXonly2Dialog>
    with SingleTickerProviderStateMixin {
  /// 倒计时
  Timer? _timer;
  int _countdown = 3;

  /// 进度动画
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    _initProgressAnimation();
    _startCountDown();
  }

  void _initProgressAnimation() {
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _progressAnimation = Tween<double>(
      begin: 0,
      end: widget.pro.toDouble(),
    ).animate(
      CurvedAnimation(
        parent: _progressController,
        curve: Curves.easeOutCubic,
      ),
    );

    _progressController.forward();
  }

  void _startCountDown() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (!mounted) return;

        if (_countdown <= 1) {
          timer.cancel();

          if (Navigator.canPop(context)) {
            Navigator.pop(context, 1);
          }
        } else {
          setState(() {
            _countdown--;
          });
        }
      },
    );
  }

  void _closeDialog() {
    _timer?.cancel();

    if (mounted && Navigator.canPop(context)) {
      Navigator.pop(context, 1);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double progressWidth = 272;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: 0.width(context),
        height: 0.height(context),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),

                  CSImg(
                    name: 'cs_only2_title',
                    width: 320,
                    height: 68,
                  ),

                  SizedBox(height: 14.h),

                  Container(
                    width: 320.w,
                    height: 456.h,
                    decoration: BoxDecoration(
                      image: CSDImg('cs_only2_bg'),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 13.h),

                        CSGradientStrokeText(
                          text: 'Advertiser Payment\nConfirmation',
                          gradientColors: [
                            '#FFEA30'.color(),
                            '#FF9113'.color(),
                          ],
                          width: 212,
                          height: 40,
                          fontSize: 16,
                          strokeColor: Colors.transparent,
                        ),

                        SizedBox(height: 47.h),

                        CSImg(
                          name:
                          'cs_cash_list_${CSLocalProvider.instance.cs_account_seled_index}_s',
                          width: 200,
                          height: 72,
                        ),

                        SizedBox(height: 8.h),

                        CSGradientStrokeText(
                          text:
                          '\$${0.to2Double(CSLocalProvider.instance.cs_dollar_number)}',
                          gradientColors: [
                            '#FFFFFF'.color(),
                            '#FFF189'.color(),
                          ],
                          width: 150,
                          height: 48,
                          fontSize: 36,
                          strokeWidth: 1,
                          strokeColor: '#983300'.color(),
                        ),

                        SizedBox(height: 8.h),

                        AnimatedBuilder(
                          animation: _progressAnimation,
                          builder: (_, __) {
                            return RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'librefranklin',
                                  color: '#FFFFFF'.color(),
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Current Review Process:',
                                  ),
                                  TextSpan(
                                    text:
                                    ' ${_progressAnimation.value.toInt()}%',
                                    style: TextStyle(
                                      color: '#FFD91D'.color(),
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                        SizedBox(height: 18.h),

                        AnimatedBuilder(
                          animation: _progressAnimation,
                          builder: (_, __) {
                            final progress =
                            _progressAnimation.value.clamp(0, 100);

                            return Container(
                              width: progressWidth.w,
                              height: 24.h,
                              decoration: BoxDecoration(
                                color: '#320707'.color(),
                                borderRadius:
                                BorderRadius.circular(12.h),
                              ),
                              child: Stack(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(
                                      milliseconds: 100,
                                    ),
                                    width:
                                    progressWidth.w *
                                        (progress / 100),
                                    height: 24.h,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          '#FFD74A'.color(),
                                          '#F39F0E'.color(),
                                        ],
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(12.h),
                                      boxShadow: [
                                        BoxShadow(
                                          color: '#FFB000'
                                              .color()
                                              .withOpacity(.6),
                                          blurRadius: 8,
                                        ),
                                      ],
                                    ),
                                  ),

                                  Center(
                                    child: CSStrokeText(
                                      text:
                                      '${progress.toInt()}%',
                                      size: 10,
                                      color: Colors.white,
                                      weight: FontWeight.w900,
                                      skWidth: 1,
                                      skColor: '#4D2D15'.color(),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                        SizedBox(height: 24.h),

                        CSText(
                          text:
                          'You’re close to unlocking withdrawal',
                          size: 12,
                          color: '#DF9797'.color(),
                          weight: FontWeight.w500,
                        ),

                        SizedBox(height: 24.h),

                        ParticleButton(
                          onTap: _closeDialog,
                          child: Container(
                            width: 252,
                            height: 52,
                            decoration: BoxDecoration(
                              image: CSDImg('cs_green_b_btn'),
                            ),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                CSStrokeText(
                                  text:
                                  'CONTINUE(${_countdown}S)',
                                  size: 18,
                                  color: Colors.white,
                                  weight: FontWeight.w700,
                                  skWidth: 2,
                                  skColor: '#025C10'.color(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// 快提现提醒3
class CSTXonly3Dialog extends StatefulWidget {
  const CSTXonly3Dialog({super.key});

  @override
  State<CSTXonly3Dialog> createState() => CSTXonly3DialogState();
}

class CSTXonly3DialogState extends State<CSTXonly3Dialog>
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
      body: SizedBox(
        width: 0.width(context),
        height: 0.height(context),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            SizedBox(height: 40.h),
            Row(
              children: [
                Spacer(),
                ParticleButton(child: CSImg(name: 'cs_close_btn', width: 32, height: 32), onTap: (){
                  Navigator.pop(context, 0);
                }),
                SizedBox(width: 16.h),
              ],
            ),
            SizedBox(height: 130.h),
            Container(
              width: 320.w,
              height: 376,
              decoration: BoxDecoration(
                  image: CSDImg('cs_only3_icon')
              ),
              child: Column(
                children: [
                  SizedBox(height: 13.h),
                  CSGradientStrokeText(text: 'Advertiser Payment\nConfirmation', gradientColors: ['#FFEA30'.color(), '#FF9113'.color()], width: 212, height: 40, fontSize: 16
                      , strokeColor: Colors.transparent),
                  SizedBox(height: 27.h),
                  Row(
                    children: [
                      SizedBox(width: 24.w),
                      CSStrokeText(text: 'Dear User', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#230000'.color()),
                      SizedBox(width: 4.w),
                      Container(
                        width: 164.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: '#5A2323'.color(),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Center(child: CSText(text: CSLocalProvider.instance.cs_account_id, size: 16, color: '#FFFFFF'.color(), weight: FontWeight.w500)),
                      )
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      SizedBox(width: 24.w),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'librefranklin',
                              color: '#FFFFFF'.color()
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Almost there! Just ',
                            ),
                            TextSpan(
                              text: '${0.to2Double(20 - CSLocalProvider.instance.cs_card_quicken_num)} Boost Card',
                              style: TextStyle(color: '#FFD91D'.color()),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 4.w),
                      CSImg(name: 'cs_only3_card', width: 24, height: 24,)
                    ],
                  ),
                  SizedBox(height: 6.h),
                  SizedBox(
                    width: 272,
                    height: 60,
                    child: RichText(
                      textAlign: TextAlign.left,
                      maxLines: 3,
                      text: TextSpan(
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'librefranklin',
                            color: '#FFFFFF'.color()
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'away from withdrawing ',
                          ),
                          TextSpan(
                            text: ' \$${CSNumberHelpers().gameModel!.card_range.first}',
                            style: TextStyle(color: '#FFD91D'.color()),
                          ),
                          TextSpan(
                            text: '.This payout is extra easy — keep scratching to finish it.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      CSText(text: 'ONLY ${0.to2Double(20 - CSLocalProvider.instance.cs_card_quicken_num)}', size: 18, color: '#FFFFFF'.color(), weight: FontWeight.w900),
                      SizedBox(width: 4.w),
                      CSImg(name: 'cs_jie_1_4', width: 24, height: 24,),
                      SizedBox(width: 4.w),
                      CSText(text: 'TO CASH OUT!!', size: 18, color: '#FFFFFF'.color(), weight: FontWeight.w900),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  ParticleButton(
                    child: Container(
                        width: 252,
                        height: 52,
                        decoration: BoxDecoration(
                          image: CSDImg('cs_green_b_btn'),
                        ),
                        child: Row(
                          mainAxisAlignment: .center,
                          children: [
                            CSStrokeText(text: 'CONTINUE', size: 24, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                          ],
                        )
                    ),
                    onTap: () {
                      Navigator.pop(context, 1);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 开宝箱
class CSBoxOpenDiaologWidget extends StatefulWidget {
  CSBoxOpenDiaologWidget({super.key});
  @override
  State<CSBoxOpenDiaologWidget> createState() => CSBoxOpenDiaologWidgetState();
}

class CSBoxOpenDiaologWidgetState extends State<CSBoxOpenDiaologWidget> with SingleTickerProviderStateMixin {

  var _showanimation = true;

  var _showBottom = false;

  var _openOne = false;

  var _openTwo = false;

  var _openThree = false;

  var _tap_index = 0;

  var doals_one = CSNumberHelpers().getPrizeWithBoxNum();

  var doals_two = CSNumberHelpers().getPrizeWithBoxNum();

  var doals_three = CSNumberHelpers().getPrizeWithBoxNum();

  var open_index = 0.0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateboxnumber();
    cs_event_fire('open_box_pop', {});

  }

  Future<void> updateboxnumber() async {
    CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_box_indexName, 0);
  }

  Future<void> playbgMUsic() async {
    // CSAudioUtils().playAward3Audio();
    // Future.delayed(Duration(milliseconds: 1500), () async {
    //   await CSAudioUtils().stopAllTempAudio();
    //   await CSAudioUtils().playBGM();
    // });
  }


  openBox() async {
    // await CSAudioUtils().playBoxAudio();
    setState(() {
      _showBottom = true;
      _showanimation = false;
    });
    Future.delayed(Duration(milliseconds: 1200), (){
      // CSAudioUtils().stopAllTempAudio();
      // CSAudioUtils().playBGM();
      if (!mounted)return;
      setState(() {
        if (!_openOne){
          _openOne = true;
        }
        if (!_openTwo){
          _openTwo = true;
        }
        if (!_openThree){
          _openThree = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.width(context),
      height: 0.height(context),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(child: SizedBox(
            width: 0.width(context),
            height: 0.height(context),
            child: Column(
              children: [
                SizedBox(height: 100.h,),
                CSImg(name: 'cs_box_open_title', width: 320, height: 60,),
                SizedBox(height: 12.h),
                CSText(text: 'Open the treasure chest, Win big prizes', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w500)
              ],
            ),
          )),
          Visibility(
            visible: _openOne && _tap_index == 0,
            child: Positioned(
              left: 8.w, top: 210.h,
              width: 180.0.w,
              height: 180.0.w,
              child: Lottie.asset(
                width: 180.w,
                height: 180.w,
                fit: BoxFit.fill,
                "guang.zip".files(),
                repeat: true,
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: Positioned(
              left: 20.w, top: 228.h,
              width: 150.0.w,
              height: 150.0.h,
              child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  onTap: (){
                    open_index = doals_one;
                    _openOne = true;
                    _tap_index = 0;
                    openBox();
                  },
                  child: Lottie.asset(
                    width: 150.w,
                    height: 150.w,
                    fit: BoxFit.fill,
                    _openOne ? "box_open.zip".files() : "box_dou.zip".files(),
                    repeat: true,
                  ),
              ),
            ),
          ),
          Visibility(
            visible: _openOne,
            child: Positioned(
              left: 62.w, top: 360.h,
              width: 150.0.w,
              height: 30.h,
              child: SizedBox(
                width: 120.0.w,
                height: 30.h,
                child: Row(
                  children: [
                    SizedBox(width: 0.w,),
                    CSGradientNumberRoller(
                      value: doals_one,
                      duration: 1000,
                      fontSize: 24.0.sp,
                      gradientColors: ['#FFE386'.color(), '#FFFFFF'.color()],
                      borderColor: '#601D09'.color(),
                      borderWidth: 1.0,
                      decimalPlaces: 2, // 动态调整小数位
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: _openTwo && _tap_index == 1,
            child: Positioned(
              right: 8.w, top: 210.h,
              width: 180.0.w,
              height: 180.0.h,
              child: Lottie.asset(
                width: 180.w,
                height: 180.w,
                fit: BoxFit.fill,
                "guang.zip".files(),
                repeat: true,
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: Positioned(
              right: 20.w, top: 228.h,
              width: 150.0.w,
              height: 150.0.h,
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                onTap: (){
                  open_index = doals_two;
                  _openTwo = true;
                  _tap_index = 1;
                  openBox();
                },
                child: Lottie.asset(
                  width: 150.w,
                  height: 150.w,
                  fit: BoxFit.fill,
                  _openTwo ? "box_open.zip".files() : "box_dou.zip".files(),
                  repeat: true,
                ),
              ),
            ),
          ),
          Visibility(
            visible: _openTwo,
            child: Positioned(
              right: 30.w, top: 360.h,
              width: 150.0.w,
              height: 30.h,
              child: SizedBox(
                width: 120.0.w,
                height: 30.h,
                child: Row(
                  children: [
                    SizedBox(width: 44.w,),
                    CSGradientNumberRoller(
                      value: doals_two,
                      duration: 1000,
                      fontSize: 24.0.sp,
                      gradientColors: ['#FFE386'.color(), '#FFFFFF'.color()],
                      borderColor: '#601D09'.color(),
                      borderWidth: 1.0,
                      decimalPlaces: 2, // 动态调整小数位
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: _openThree && _tap_index == 2,
            child: Positioned(
              right: (0.width(context) - 180.0.w) * 0.5, top: 390.h,
              width: 180.0.w,
              height: 180.0.h,
              child: Lottie.asset(
                width: 180.w,
                height: 180.w,
                fit: BoxFit.fill,
                "guang.zip".files(),
                repeat: true,
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: Positioned(
              right: (0.width(context) - 160.0.w) * 0.5, top: 410.h,
              width: 160.0.w,
              height: 160.0.h,
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                onTap: (){
                  open_index = doals_three;
                  _openThree = true;
                  _tap_index = 2;
                  openBox();
                },
                child: Lottie.asset(
                  width: 160.w,
                  height: 160.w,
                  fit: BoxFit.fill,
                  _openThree ? "box_open.zip".files() : "box_dou.zip".files(),
                  repeat: true,
                ),
              ),
            ),
          ),
          Visibility(
            visible: _openThree,
            child: Positioned(
              right: (0.width(context) - 188.w) * 0.5, top: 540.h,
              width: 150.0.w,
              height: 30.h,
              child: SizedBox(
                width: 120.0.w,
                height: 30.h,
                child: Row(
                  children: [
                    SizedBox(width: 20.w,),
                    CSGradientNumberRoller(
                      value: doals_three,
                      duration: 1000,
                      fontSize: 24.0.sp,
                      gradientColors: ['#FFE386'.color(), '#FFFFFF'.color()],
                      borderColor: '#601D09'.color(),
                      borderWidth: 1.0,
                      decimalPlaces: 2, // 动态调整小数位
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: _showanimation,
            child: Positioned(
                left: 52.w, top: 380.h,
                width: 88.0.w,
                height: 28.0.h,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  onTap: (){
                    open_index = doals_one;
                    _openOne = true;
                    _tap_index = 0;
                    openBox();
                  },
                  child: Container(decoration: BoxDecoration(
                      image: CSDImg('cs_box_open_btn')
                  ),
                    child: CSStrokeText(text: 'Claim', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#025C10'.color()),
                  ),
                )
            ),
          ),
          Visibility(
            visible: _showanimation,
            child: Positioned(
                right: 52.w, top: 380.h,
                width: 88.0.w,
                height: 28.0.h,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  onTap: (){
                    open_index = doals_two;
                    _openTwo = true;
                    _tap_index = 1;
                    openBox();
                  },
                  child: Container(decoration: BoxDecoration(
                      image: CSDImg('cs_box_open_btn')
                  ),
                    child: CSStrokeText(text: 'Claim', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#025C10'.color()),
                  ),
                )
            ),
          ),
          Visibility(
            visible: _showanimation,
            child: Positioned(
                right: (0.width(context) - 88.0.w) * 0.5, top: 570.h,
                width: 88.0.w,
                height: 28.0.h,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  onTap: (){
                    open_index = doals_three;
                    _openThree = true;
                    _tap_index = 2;
                    openBox();
                  },
                  child: Container(decoration: BoxDecoration(
                      image: CSDImg('cs_box_open_btn')
                  ),
                    child: CSStrokeText(text: 'Claim', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#025C10'.color()),
                  ),
                )
            ),
          ),
          Visibility(
            visible: _showBottom,
            child: Positioned(
                right: (0.width(context) - 252.w) * 0.5, top: 600.h,
                width: 252.0.w,
                height: 52.0.h,
                child: Container(
                  width: 252.0.w,
                  height: 52.0.h,
                  decoration: BoxDecoration(
                      image: CSDImg('cs_green_b_btn')
                  ),
                  child: InkWell(
                    onTap: () async {
                      cs_event_fire('open_box_pop_c', {});
                      CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_show_boxName,false);
                      CSCardAds().cs_showAd(context, 'rakwt_box_rv', onCacheResponse: (onCacheResponse){
                        if (!mounted)return;
                        Navigator.of(context).pop(0);
                        // SJScratchNextNotificationService.sendToDomandNumberNotification(0);
                      }, adDidClosed: (adDidClosed) async {
                        if (!context.mounted) return;
                        Navigator.pop(context, 0);
                        var value = doals_one + doals_two + doals_three;
                        CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, CSLocalProvider.instance.cs_dollar_number + value);
                        CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_box_indexName, 0);
                        playAwardmp3();
                        showThreeTxTask();
                        showFourTxTask();
                      });
                    },
                    child: Stack(
                      children: [
                        Center(
                          child: CSStrokeText(text: 'CLAIM ALL', size: 24, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                        )
                      ],
                    ),
                  ),
                )
            ),
          ),
          Visibility(
            visible: _showBottom,
            child: Positioned(
                right: (0.width(context) - 200) * 0.5, top: 660.h,
                width: 200.0,
                height: 52.0,
                child: CSUnderlineTextButton(text: 'CLAIM \$${open_index.toStringAsFixed(2)}', fontSize: 20.sp,gradientColors: ['#BE982A'.color(),'#FFE9A3'.color(),'#FFF6D7'.color(),'#FFF0B4'.color()], underlineColor: '#C5A213'.color(), onPressed: () async {
                  cs_event_fire('open_box_pop_close', {});
                  CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_show_boxName,false);
                  if (CSNumberHelpers().checkProbability()){
                    CSCardAds().cs_showAd(context, 'rakwt_box_int', onCacheResponse: (onCacheResponse){
                      if (!mounted)return;
                      Navigator.of(context).pop(0);
                      // SJScratchNextNotificationService.sendToDomandNumberNotification(0);
                    }, adDidClosed: (adDidClosed) async {
                      if (!mounted)return;
                      Navigator.of(context).pop(0);
                      var value = 0.0;
                      if (_openOne){
                        value = doals_one;
                      } else if (_openTwo){
                        value = doals_two;
                      } else {
                        value = doals_three;
                      }
                      CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_box_indexName, 0);
                      CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_box_indexName, 0);
                      CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, CSLocalProvider.instance.cs_dollar_number + value);
                      playAwardmp3();
                      showThreeTxTask();
                      showFourTxTask();
                    });
                  } else {
                    if (!mounted)return;
                    Navigator.of(context).pop(0);

                    var value = 0.0;
                    if (_openOne){
                      value = doals_one;
                    } else if (_openTwo){
                      value = doals_two;
                    } else {
                      value = doals_three;
                    }
                    CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_box_indexName, 0);
                    CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scratch_box_indexName, 0);
                    CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, CSLocalProvider.instance.cs_dollar_number + value);
                    playAwardmp3();
                    showThreeTxTask();
                    showFourTxTask();
                  }
                },)
            ),
          ),
          Visibility(
            visible: _showBottom,
            child: Positioned(
                right: 52.w, top: 593.h,
                width: 32,
                height: 32,
                child: CSImg(name: 'cs_ad_icon', width: 32, height: 32,)
            ),
          ),
        ],
      ),
    );
  }
  // 开启第三段和第四段任务
  Future<void> showThreeTxTask() async {

  }
  // 开启第三段和第四段任务
  Future<void> showFourTxTask() async {

  }

  void playAwardmp3(){
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await CSAudioUtils().playDolasAudio();
      Future.delayed(Duration(milliseconds: 1300), () async {
        // await CSAudioUtils().stopAllTempAudio();
        if (CSLocalProvider.instance.cs_bg_music){
          // await CSAudioUtils().playBGM();
        }
      });
    });
  }

}

// 刮开无奖励
class CSNotAwardDialog extends StatefulWidget {
  const CSNotAwardDialog({super.key});

  @override
  State<CSNotAwardDialog> createState() => CSNotAwardDialogState();
}

class CSNotAwardDialogState extends State<CSNotAwardDialog>
    with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();

   cs_event_fire('paly_failed_pop', {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: 0.width(context),
        height: 0.height(context),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            CSImg(name: 'cs_miss_icon', width: 188, height: 48),
            SizedBox(height: 152.h),
            CSImg(name: 'cs_not_icon', width: 180, height: 180),
            SizedBox(height: 112.h),
            ParticleButton(
              child: Container(
                  width: 252,
                  height: 52,
                  decoration: BoxDecoration(
                    image: CSDImg('cs_green_b_btn'),
                  ),
                  child: Row(
                    mainAxisAlignment: .center,
                    children: [
                      CSStrokeText(text: 'PLAY AGAIN', size: 24, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                    ],
                  )
              ),
              onTap: () {
                cs_event_fire('paly_failed_pop_c', {});
                Navigator.pop(context, 1);
                if (CSNumberHelpers().checkProbability()){
                  CSCardAds().cs_showAd(context, 'rakwt_close_int', onCacheResponse: (onCacheResponse){}, adDidClosed: (adDidClosed){

                  });
                }
              },
            ),
          ],
        )
      )
    );
  }
}

// 升级
class CSLevelDialog extends StatefulWidget {
  const CSLevelDialog({super.key});

  @override
  State<CSLevelDialog> createState() => CSLevelDialogState();
}

class CSLevelDialogState extends State<CSLevelDialog>
    with SingleTickerProviderStateMixin {

   double award = CSNumberHelpers().getPrizeWithBoxNum();

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
        body: SizedBox(
            width: 0.width(context),
            height: 0.height(context),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: .center,
                  children: [
                    Container(
                      width: 120, height: 120,
                      decoration: BoxDecoration(
                          image: CSDImg('cs_lev_num_bg')
                      ),
                      child: Center(
                        child: CSText(text: '${CSLocalProvider.instance.cs_Level_number}', size: 40, color: '#FEEF1D'.color(), weight: FontWeight.w900),
                      ),
                    ),
                    CSImg(name: 'cs_lev_title', width: 272, height: 84),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        CSImg(name: 'cs_lev_1', width: 88, height: 88),
                        SizedBox(width: 16.w),
                        CSImg(name: 'cs_lev_3', width: 72, height: 72),
                        SizedBox(width: 16.w),
                        CSImg(name: 'cs_lev_2', width: 88, height: 88),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        CSGradientStrokeText(text: '\$$award', gradientColors: ['#FFFFFF'.color(), '#FFF189'.color()], width: 100, height: 24, fontSize: 20, strokeWidth: 1, strokeColor: '#983300'.color()),
                        SizedBox(width: 116.w),
                        CSGradientStrokeText(text: '\$${(award * 2.0).toStringAsFixed(2)}', gradientColors: ['#FFFFFF'.color(), '#FFF189'.color()], width: 100, height: 24, fontSize: 20, strokeWidth: 1, strokeColor: '#983300'.color()),
                      ],
                    ),
                    SizedBox(height: 112.h),
                    ParticleButton(
                      child: Container(
                          width: 252,
                          height: 52,
                          decoration: BoxDecoration(
                            image: CSDImg('cs_green_b_btn'),
                          ),
                          child: Row(
                            mainAxisAlignment: .center,
                            children: [
                              CSStrokeText(text: 'CLAIM \$${(award * 2.0).toStringAsFixed(2)}', size: 24, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                              SizedBox(width: 8.w),
                              CSImg(name: 'cs_ad_icon', width: 24, height: 24)
                            ],
                          )
                      ),
                      onTap: () {
                        Navigator.pop(context, 1);
                        if (CSNumberHelpers().checkProbability()){
                          CSCardAds().cs_showAd(context, 'rakwt_close_int', onCacheResponse: (onCacheResponse){}, adDidClosed: (adDidClosed){
                          });
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    CSUnderlineTextButton(text: 'Continue', fontSize: 16,onPressed: (){
                      Navigator.pop(context, 0);
                      if (CSNumberHelpers().checkProbability()){
                        CSCardAds().cs_showAd(context, 'rakwt_close_int', onCacheResponse: (onCacheResponse){}, adDidClosed: (adDidClosed){
                        });
                      }
                    },)
                  ],
                ),
              ],
            )
        )
    );
  }
}

// bigwin
class CSBigWinLevelDialog extends StatefulWidget {
  final int type;
  final double award;
  final double qunm_award;
  const CSBigWinLevelDialog({super.key, required this.award, required this.type, required this.qunm_award});

  @override
  State<CSBigWinLevelDialog> createState() => CSBigWinLevelDialogState();
}

class CSBigWinLevelDialogState extends State<CSBigWinLevelDialog>
    with SingleTickerProviderStateMixin {

  late AnimationController _breathController;

  late Animation<double> _scaleAnimation;

  @override
  void initState() {

    super.initState();

    if (widget.type == 6){
      cs_event_fire('wheel_reward_pop', {});
    } else {
      cs_event_fire('bigwin_pop', {'source_from' : getTypeName(), 'card_from' : 'yes'});
    }

    /// 呼吸动画
    _breathController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 1.12,
    ).animate(
      CurvedAnimation(
        parent: _breathController,
        curve: Curves.easeInOut,
      ),
    );
    _breathController.repeat(reverse: true);

    if (CSLocalProvider.instance.cs_sound_music){
      CSAudioUtils().playBigwinAudio();
    }

    Future.delayed(Duration(seconds: 4),(){
      CSAudioUtils().stopAllTempAudio();
    });

  }

  String getTypeName(){
    if (widget.type == 0){
      return 'fruit';
    } else if (widget.type == 1){
      return 'number';
    } else if (widget.type == 2){
      return 'tigter';
    } else if (widget.type == 3){
      return 'card77';
    } else if (widget.type == 4){
      return 'emoji';
    } else if (widget.type == 5){
      return 'rich8';
    } else {
      return 'wheel';
    }
  }

  @override
  void dispose() {
    _breathController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
            width: 0.width(context),
            height: 0.height(context),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: .center,
                  children: [
                    Container(
                      width: 328.w,
                      height: 68.h,
                      decoration: BoxDecoration(
                          image: CSDImg('cs_top_tips_bgs')
                      ),
                      child: Stack(
                        children: [
                          Positioned(left: 44.w,top: 4.h,child: RichText(
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'librefranklin',
                                  color: '#FFFFFF'.color()
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Just ',
                                ),
                                TextSpan(
                                  text: '20 ',
                                  style: TextStyle(color: '#FFD91D'.color()),
                                ),
                                TextSpan(
                                  text: ' PayOut boost card to cash out!',
                                ),
                              ],
                            ),
                          ),),
                          Positioned(left: 28.w,bottom: 12.h,
                            child: Container(
                              width: 272.w,
                              height: 24.h,
                              decoration: BoxDecoration(
                                  color: '#4E0A0A'.color(),
                                  borderRadius: BorderRadius.circular(12.h)
                              ),
                              child: Stack(
                                children: [
                                  Positioned(left: 2, top: 2,
                                    child: Container(
                                      width: 268.w * (CSLocalProvider.instance.cs_card_quicken_num / 20),
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                        color: '#F39F0E'.color(),
                                        borderRadius: BorderRadius.circular(12.h),
                                      ),
                                    ),
                                  ),
                                  Positioned(top: 4.h,left: 90.w,child: CSStrokeText(text: '${0.to2Double(CSLocalProvider.instance.cs_card_quicken_num)}/20', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#4D2D15'.color()))
                                ],
                              ),
                            ),
                          ),
                          Positioned(left: 6.w,bottom: 4.h,child: CSImg(name: 'cs_crad_s_bg', width: 40, height: 40,)),
                          Positioned(right: 6.w,bottom: 8.h,child: Container(
                            width: 100.w,
                            height: 36.h,
                            decoration: BoxDecoration(
                                image: CSDImg('cs_cash_list_${CSLocalProvider.instance.cs_account_seled_index}_s')
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: 100.w,
                                  height: 36.h,
                                  decoration: BoxDecoration(
                                      color: '#000000'.color(opacity: 0.5),
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 2.w),
                                      CSImg(name: 'cs_lock_icons', width: 28, height: 28,)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        width: 304, height: 192,
                        decoration: BoxDecoration(
                            image: CSDImg('cs_bigwins_top')
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        CSImg(name: 'cs_lev_1', width: 88, height: 88),
                        SizedBox(width: 16.w),
                        CSImg(name: 'cs_bigwins_add', width: 72, height: 72),
                        SizedBox(width: 16.w),
                        CSImg(name: 'cs_bigwins_card', width: 88, height: 88),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        CSGradientStrokeText(text: '\$${0.to2Double(widget.award)}', gradientColors: ['#FFFFFF'.color(), '#FFF189'.color()], width: 100, height: 24, fontSize: 20, strokeWidth: 1, strokeColor: '#983300'.color()),
                        SizedBox(width: 116.w),
                        CSGradientStrokeText(text: 'x${widget.qunm_award}', gradientColors: ['#FFFFFF'.color(), '#FFF189'.color()], width: 100, height: 24, fontSize: 20, strokeWidth: 1, strokeColor: '#983300'.color()),
                      ],
                    ),
                    SizedBox(height: 112.h),
                    ParticleButton(
                      child: Container(
                          width: 252,
                          height: 52,
                          decoration: BoxDecoration(
                            image: CSDImg('cs_green_b_btn'),
                          ),
                          child: Row(
                            mainAxisAlignment: .center,
                            children: [
                              CSStrokeText(text: 'CLAIM DOUBLE', size: 24, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                              SizedBox(width: 8.w),
                              CSImg(name: 'cs_ad_icon', width: 24, height: 24)
                            ],
                          )
                      ),
                      onTap: () {
                        if (widget.type == 6){
                          cs_event_fire('wheel_reward_pop_c', {});
                        } else {
                          cs_event_fire('bigwin_pop_c', {'source_from' : getTypeName(), 'card_from' : 'yes'});
                        }
                        Navigator.pop(context, 1);
                        CSCardAds().cs_showAd(context, 'rakwt_boost_rv', onCacheResponse: (onCacheResponse){}, adDidClosed: (adDidClosed){
                          CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, CSLocalProvider.instance.cs_dollar_number + (widget.award * 2.0));
                          CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_card_quicken_numName, CSLocalProvider.instance.cs_card_quicken_num + (widget.qunm_award * 2.0));
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    CSUnderlineTextButton(text: 'Claim', fontSize: 16,onPressed: (){
                      if (widget.type == 6){
                        cs_event_fire('wheel_reward_pop_close', {});
                      } else {
                        cs_event_fire('bigwin_pop_close', {'source_from' : getTypeName(), 'card_from' : 'yes'});
                      }
                      Navigator.pop(context, 0);
                      if (CSNumberHelpers().checkProbability()){
                        CSCardAds().cs_showAd(context, 'rakwt_boost_int', onCacheResponse: (onCacheResponse){}, adDidClosed: (adDidClosed){
                          CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, CSLocalProvider.instance.cs_dollar_number + (widget.award * 1.0));
                          CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_card_quicken_numName, CSLocalProvider.instance.cs_card_quicken_num + (widget.qunm_award * 1.0));
                        });
                      } else {
                        CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, CSLocalProvider.instance.cs_dollar_number + (widget.award * 1.0));
                        CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_card_quicken_numName, CSLocalProvider.instance.cs_card_quicken_num + (widget.qunm_award * 1.0));

                      }
                    },)
                  ],
                ),
              ],
            )
        )
    );
  }
}

// cashwindouble
class CSCashwindoubleDialog extends StatefulWidget {
  final int type;
  final double award;
  final double qunm_award;
  const CSCashwindoubleDialog({super.key, required this.award, required this.type, required this.qunm_award});

  @override
  State<CSCashwindoubleDialog> createState() => CSCashwindoubleDialogState();
}

class CSCashwindoubleDialogState extends State<CSCashwindoubleDialog>
    with SingleTickerProviderStateMixin {

  late AnimationController _breathController;

  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    cs_event_fire('cashwin_pop', {'source_from' : getTypeName(), 'card_from' : 'yes'});

    /// 呼吸动画
    _breathController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 1.12,
    ).animate(
      CurvedAnimation(
        parent: _breathController,
        curve: Curves.easeInOut,
      ),
    );
    _breathController.repeat(reverse: true);

    if (CSLocalProvider.instance.cs_sound_music){
      CSAudioUtils().playCashAudio();
    }

    Future.delayed(Duration(seconds: 2),(){
      CSAudioUtils().stopAllTempAudio();
    });

  }

  String getTypeName(){
    if (widget.type == 0){
      return 'fruit';
    } else if (widget.type == 1){
      return 'number';
    } else if (widget.type == 2){
      return 'tigter';
    } else if (widget.type == 3){
      return 'card77';
    } else if (widget.type == 4){
      return 'emoji';
    } else if (widget.type == 5){
      return 'rich8';
    } else {
      return 'wheel';
    }
  }

  @override
  void dispose() {
    _breathController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
            width: 0.width(context),
            height: 0.height(context),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: .center,
                  children: [
                    Container(
                      width: 328.w,
                      height: 68.h,
                      decoration: BoxDecoration(
                          image: CSDImg('cs_top_tips_bgs')
                      ),
                      child: Stack(
                        children: [
                          Positioned(left: 44.w,top: 4.h,child: RichText(
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'librefranklin',
                                  color: '#FFFFFF'.color()
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Just ',
                                ),
                                TextSpan(
                                  text: '20 ',
                                  style: TextStyle(color: '#FFD91D'.color()),
                                ),
                                TextSpan(
                                  text: 'PayOut boost card to cash out!',
                                ),
                              ],
                            ),
                          ),),
                          Positioned(left: 28.w,bottom: 12.h,
                            child: Container(
                              width: 272.w,
                              height: 24.h,
                              decoration: BoxDecoration(
                                  color: '#4E0A0A'.color(),
                                  borderRadius: BorderRadius.circular(12.h)
                              ),
                              child: Stack(
                                children: [
                                  Positioned(left: 2, top: 2,
                                    child: Container(
                                      width: 268.w * (CSLocalProvider.instance.cs_card_quicken_num / 20),
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                        color: '#F39F0E'.color(),
                                        borderRadius: BorderRadius.circular(12.h),
                                      ),
                                    ),
                                  ),
                                  Positioned(top: 4.h,left: 90.w,child: CSStrokeText(text: '${0.to2Double(CSLocalProvider.instance.cs_card_quicken_num)}/20', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#4D2D15'.color()))
                                ],
                              ),
                            ),
                          ),
                          Positioned(left: 6.w,bottom: 4.h,child: CSImg(name: 'cs_crad_s_bg', width: 40, height: 40,)),
                          Positioned(right: 6.w,bottom: 8.h,child: Container(
                            width: 100.w,
                            height: 36.h,
                            decoration: BoxDecoration(
                                image: CSDImg('cs_cash_list_${CSLocalProvider.instance.cs_account_seled_index}_s')
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: 100.w,
                                  height: 36.h,
                                  decoration: BoxDecoration(
                                      color: '#000000'.color(opacity: 0.5),
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 2.w),
                                      CSImg(name: 'cs_lock_icons', width: 28, height: 28,)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        width: 304, height: 173,
                        decoration: BoxDecoration(
                            image: CSDImg('cs_cash_win_icon')
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        CSImg(name: 'cs_lev_1', width: 88, height: 88),
                        SizedBox(width: 16.w),
                        CSImg(name: 'cs_bigwins_add', width: 72, height: 72),
                        SizedBox(width: 16.w),
                        CSImg(name: 'cs_bigwins_card', width: 88, height: 88),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        CSGradientStrokeText(text: '\$${widget.award}', gradientColors: ['#FFFFFF'.color(), '#FFF189'.color()], width: 100, height: 24, fontSize: 20, strokeWidth: 1, strokeColor: '#983300'.color()),
                        SizedBox(width: 116.w),
                        CSGradientStrokeText(text: 'x${0.to2Double(widget.qunm_award)}', gradientColors: ['#FFFFFF'.color(), '#FFF189'.color()], width: 100, height: 24, fontSize: 20, strokeWidth: 1, strokeColor: '#983300'.color()),
                      ],
                    ),
                    SizedBox(height: 112.h),
                    ParticleButton(
                      child: Container(
                          width: 252,
                          height: 52,
                          decoration: BoxDecoration(
                            image: CSDImg('cs_green_b_btn'),
                          ),
                          child: Row(
                            mainAxisAlignment: .center,
                            children: [
                              CSStrokeText(text: 'CLAIM', size: 24, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                              SizedBox(width: 8.w),
                              CSImg(name: 'cs_ad_icon', width: 24, height: 24)
                            ],
                          )
                      ),
                      onTap: () {
                        cs_event_fire('cashwin_pop_c', {'source_from' : getTypeName(), 'card_from' : 'yes'});
                        Navigator.pop(context, 1);
                        CSCardAds().cs_showAd(context, 'rakwt_boost_rv', onCacheResponse: (onCacheResponse){}, adDidClosed: (adDidClosed){
                          CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, CSLocalProvider.instance.cs_dollar_number + widget.award);
                          CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_card_quicken_numName, CSLocalProvider.instance.cs_card_quicken_num + widget.qunm_award);
                        });
                      },
                    ),
                    // SizedBox(height: 20),
                    // CSUnderlineTextButton(text: 'Claim', fontSize: 16,onPressed: (){
                    //   Navigator.pop(context, 0);
                    // },)
                  ],
                ),
              ],
            )
        )
    );
  }
}


// mc
class CSMoreCardDialog extends StatefulWidget {
  final int card_index;
  const CSMoreCardDialog({super.key, required this.card_index});

  @override
  State<CSMoreCardDialog> createState() => CSMoreCardDialogState();
}

class CSMoreCardDialogState extends State<CSMoreCardDialog>
    with SingleTickerProviderStateMixin {

  double award = CSNumberHelpers().getPrizeWithBoxNum();

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
        body: SizedBox(
            width: 0.width(context),
            height: 0.height(context),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .center,
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          ParticleButton(child: CSImg(name: 'cs_close_btn', width: 32, height: 32), onTap: (){
                            Navigator.pop(context, 0);
                          }),
                          SizedBox(width: 32.h),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        width: 280, height: 60,
                        decoration: BoxDecoration(
                            image: CSDImg('cs_mc_card_title')
                        ),
                      ),
                      SizedBox(height: 92.h),
                      CSImg(name: 'cs_mc_card_icon', width: 140, height: 140),
                      SizedBox(height: 8.h),
                      CSGradientStrokeText(text: 'X5', gradientColors: ['#FFFFFF'.color(), '#FFF189'.color()], width: 100, height: 24, fontSize: 36, strokeWidth: 1, strokeColor: '#983300'.color()),
                      SizedBox(height: 112.h),
                      ParticleButton(
                        child: Container(
                            width: 252,
                            height: 52,
                            decoration: BoxDecoration(
                              image: CSDImg('cs_green_b_btn'),
                            ),
                            child: Row(
                              mainAxisAlignment: .center,
                              children: [
                                CSStrokeText(text: 'GET', size: 24, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                                SizedBox(width: 8.w),
                                CSImg(name: 'cs_ad_icon', width: 24, height: 24)
                              ],
                            )
                        ),
                        onTap: () {
                          Navigator.pop(context, 1);
                          CSCardAds().cs_showAd(context, 'more_card_rv', onCacheResponse: (onCacheResponse){}, adDidClosed: (adDidClosed){
                             if (widget.card_index == 0){
                               CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scrach_end_number_0Name,CSLocalProvider.instance.cs_scrach_end_number_0 < 5 ? 0 : CSLocalProvider.instance.cs_scrach_end_number_0 - 5);
                             } else if (widget.card_index == 1){
                               CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scrach_end_number_1Name, CSLocalProvider.instance.cs_scrach_end_number_1 < 5 ? 0 : CSLocalProvider.instance.cs_scrach_end_number_1 - 5);
                             } else if (widget.card_index == 2){
                               CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scrach_end_number_2Name, CSLocalProvider.instance.cs_scrach_end_number_2 < 5 ? 0 : CSLocalProvider.instance.cs_scrach_end_number_2 - 5);
                             } else if (widget.card_index == 3){
                               CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scrach_end_number_3Name, CSLocalProvider.instance.cs_scrach_end_number_3 < 5 ? 0 : CSLocalProvider.instance.cs_scrach_end_number_3 - 5);
                             } else if (widget.card_index == 4){
                               CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scrach_end_number_4Name, CSLocalProvider.instance.cs_scrach_end_number_4 < 5 ? 0 : CSLocalProvider.instance.cs_scrach_end_number_4 - 5);
                             } else if (widget.card_index == 5){
                               CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_scrach_end_number_5Name, CSLocalProvider.instance.cs_scrach_end_number_5 < 5 ? 0 : CSLocalProvider.instance.cs_scrach_end_number_5 - 5);
                             }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
        )
    );
  }
}

// 设置
class CSSettingDialog extends StatefulWidget {
  const CSSettingDialog({super.key});

  @override
  State<CSSettingDialog> createState() => CSSettingDialogState();
}

class CSSettingDialogState extends State<CSSettingDialog>
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
        body: SizedBox(
            width: 0.width(context),
            height: 0.height(context),
            child: Center(
              child: Container(
                width: 272.w, height: 296.h,
                decoration: BoxDecoration(
                    image: CSDImg('cs_set_0')
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: 16.h),
                          CSImg(name: 'cs_set_1', width: 172, height: 44),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: .center,
                            children: [
                              ParticleButton(child: CSImg(name: CSLocalProvider.instance.cs_sound_music ? 'cs_sound_s' : 'cs_sound_n', width: 68.w, height: 68.w), onTap: () async {
                                  await CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_sound_musicName, CSLocalProvider.instance.cs_sound_music ? false : true);
                                  setState(() {});
                              }),
                              SizedBox(width: 32.w),
                              ParticleButton(child: CSImg(name: CSLocalProvider.instance.cs_bg_music ? 'cs_music_s' : 'cs_music_n', width: 68.w, height: 68.w), onTap: () async {
                                if (!CSLocalProvider.instance.cs_bg_music){
                                  CSAudioUtils().playBGM();
                                } else {
                                  CSAudioUtils().pauseBGM();
                                }
                                await CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_bg_musicName, CSLocalProvider.instance.cs_bg_music ? false : true);
                                setState(() {});
                              }),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          ParticleButton(
                            onTap: (){
                              Navigator.pop(context, 0);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (builder) {
                                    return CSWebkitview(
                                      url: "https://sites.google.com/view/piggywallet-pp/home",
                                      title: 'Privacy Policy',
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              width: 200.w,
                              height: 44.h,
                              decoration: BoxDecoration(
                                image: CSDImg('cs_set_4')
                              ),
                              child: Row(
                                mainAxisAlignment: .center,
                                children: [
                                  CSImg(name: 'cs_set_3', width: 24, height: 24),
                                  SizedBox(width: 4.w),
                                  CSText(text: 'Privacy Policy', size: 16, color: '#FFFFFF'.color(), weight: FontWeight.w900)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          ParticleButton(
                            onTap: (){
                              Navigator.pop(context, 0);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (builder) {
                                    return CSWebkitview(
                                      url: "https://sites.google.com/view/piggywallet-pp/home",
                                      title: 'Privacy Policy',
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              width: 200.w,
                              height: 44.h,
                              decoration: BoxDecoration(
                                  image: CSDImg('cs_set_4')
                              ),
                              child: Row(
                                mainAxisAlignment: .center,
                                children: [
                                  CSImg(name: 'cs_set_3', width: 24, height: 24),
                                  SizedBox(width: 4.w),
                                  CSText(text: 'User Timer', size: 16, color: '#FFFFFF'.color(), weight: FontWeight.w900)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ParticleButton(child: Positioned(right: 0,child: CSImg(name: 'cs_close_btn', width: 32, height: 32)), onTap: (){
                      Navigator.pop(context, 0);
                    }),
                  ],
                ),
              ),
            ),
        )
    );
  }
}

// 加载失败
class CSAdLoadingDialog extends StatefulWidget {
  const CSAdLoadingDialog({super.key});

  @override
  State<CSAdLoadingDialog> createState() => CSAdLoadingDialogState();
}

class CSAdLoadingDialogState extends State<CSAdLoadingDialog>
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
        body: SizedBox(
          width: 0.width(context),
          height: 0.height(context),
          child: Center(
            child: Container(
              width: 320.w, height: 328.h,
              decoration: BoxDecoration(
                  image: CSDImg('cs_ad_type_bg')
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 13.h),
                        CSGradientStrokeText(text: 'Ad Loading Failed', gradientColors: ['#FFEA30'.color(), '#FF9113'.color()], width: 212, height: 40, fontSize: 20
                            , strokeColor: Colors.transparent),
                        SizedBox(height: 51.h),
                        CSImg(name: 'cs_ads_icon', width: 120, height: 120),
                        SizedBox(height: 18.h),
                        ParticleButton(child: Container(
                          width: 252,
                          height: 52,
                          decoration: BoxDecoration(
                              image: CSDImg('cs_green_b_btn')
                          ),
                          child: Center(
                            child: CSStrokeText(text: 'TRY AGAIN', size: 18, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                          ),
                        ), onTap: (){
                          Navigator.pop(context, 0);
                        }),
                      ],
                    ),
                  ),
                  ParticleButton(child: Positioned(right: 0,child: CSImg(name: 'cs_close_btn', width: 32, height: 32)), onTap: (){
                    Navigator.pop(context, 0);
                  }),
                ],
              ),
            ),
          ),
        )
    );
  }
}



// 加载失败
class CSNotWifiDialog extends StatefulWidget {
  const CSNotWifiDialog({super.key});

  @override
  State<CSNotWifiDialog> createState() => CSNotWifiDialogState();
}

class CSNotWifiDialogState extends State<CSNotWifiDialog>
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
        body: SizedBox(
          width: 0.width(context),
          height: 0.height(context),
          child: Center(
            child: Container(
              width: 320.w, height: 328.h,
              decoration: BoxDecoration(
                  image: CSDImg('cs_ad_type_bg')
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 13.h),
                        CSGradientStrokeText(text: 'No Network Currently', gradientColors: ['#FFEA30'.color(), '#FF9113'.color()], width: 212, height: 40, fontSize: 20
                            , strokeColor: Colors.transparent),
                        SizedBox(height: 51.h),
                        CSImg(name: 'cs_wifi_icon', width: 120, height: 120),
                        SizedBox(height: 18.h),
                        ParticleButton(child: Container(
                          width: 252,
                          height: 52,
                          decoration: BoxDecoration(
                              image: CSDImg('cs_green_b_btn')
                          ),
                          child: Center(
                            child: CSStrokeText(text: 'GOT IT', size: 18, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                          ),
                        ), onTap: (){
                          Navigator.pop(context, 0);
                        }),
                      ],
                    ),
                  ),
                  ParticleButton(child: Positioned(right: 0,child: CSImg(name: 'cs_close_btn', width: 32, height: 32)), onTap: (){
                    Navigator.pop(context, 0);
                  }),
                ],
              ),
            ),
          ),
        )
    );
  }
}


// 加载失败
class CSAdLimitDialog extends StatefulWidget {
  const CSAdLimitDialog({super.key});

  @override
  State<CSAdLimitDialog> createState() => CSAdLimitDialogState();
}

class CSAdLimitDialogState extends State<CSAdLimitDialog>
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
        body: SizedBox(
          width: 0.width(context),
          height: 0.height(context),
          child: Center(
            child: Container(
              width: 320.w, height: 380.h,
              decoration: BoxDecoration(
                  image: CSDImg('cs_ad_type_bg2')
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 13.h),
                        CSGradientStrokeText(text: 'Ad Limit Reached', gradientColors: ['#FFEA30'.color(), '#FF9113'.color()], width: 212, height: 40, fontSize: 20
                            , strokeColor: Colors.transparent),
                        SizedBox(height: 51.h),
                        CSImg(name: 'cs_ads_icon', width: 120, height: 120),
                        SizedBox(height: 12.h),
                        SizedBox(
                          width: 272,
                          height: 40,
                          child: CSText(text: 'You’ve watched all available ads for today. Try again tomorrow.', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w500, align: .center, maxLines: 2),
                        ),
                        SizedBox(height: 18.h),
                        ParticleButton(child: Container(
                          width: 252,
                          height: 52,
                          decoration: BoxDecoration(
                              image: CSDImg('cs_green_b_btn')
                          ),
                          child: Center(
                            child: CSStrokeText(text: 'GOT IT', size: 18, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                          ),
                        ), onTap: (){
                          Navigator.pop(context, 0);
                        }),
                      ],
                    ),
                  ),
                  ParticleButton(child: Positioned(right: 0,child: CSImg(name: 'cs_close_btn', width: 32, height: 32)), onTap: (){
                    Navigator.pop(context, 0);
                  }),
                ],
              ),
            ),
          ),
        )
    );
  }
}


// 二次召唤通知权限
class CSNoticeOpenDialog extends StatefulWidget {
  const CSNoticeOpenDialog({super.key});

  @override
  State<CSNoticeOpenDialog> createState() => CSNoticeOpenDialogState();
}

class CSNoticeOpenDialogState extends State<CSNoticeOpenDialog>
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
        body: SizedBox(
          width: 0.width(context),
          height: 0.height(context),
          child: Center(
            child: Container(
              width: 320.w, height: 380.h,
              decoration: BoxDecoration(
                  image: CSDImg('cs_ad_type_bg2')
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 13.h),
                        CSGradientStrokeText(text: 'Turn On Push Notifications', gradientColors: ['#FFEA30'.color(), '#FF9113'.color()], width: 212, height: 40, fontSize: 20
                            , strokeColor: Colors.transparent),
                        SizedBox(height: 51.h),
                        CSImg(name: 'cs_notice_icon', width: 120, height: 120),
                        SizedBox(height: 18.h),
                        SizedBox(
                          width: 272,
                          height: 20,
                          child: CSText(text: 'Open The Notification To Receive Cash', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w500, align: .center, maxLines: 2),
                        ),
                        SizedBox(height: 24.h),
                        ParticleButton(child: Container(
                          width: 252,
                          height: 52,
                          decoration: BoxDecoration(
                              image: CSDImg('cs_green_b_btn')
                          ),
                          child: Center(
                            child: CSStrokeText(text: 'GO AND OPEN', size: 18, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                          ),
                        ), onTap: (){
                          Navigator.pop(context, 0);
                        }),
                      ],
                    ),
                  ),
                  ParticleButton(child: Positioned(right: 0,child: CSImg(name: 'cs_close_btn', width: 32, height: 32)), onTap: (){
                    Navigator.pop(context, 0);
                  }),
                ],
              ),
            ),
          ),
        )
    );
  }
}

// 老用户流程弹窗
class CSOldGuideDialog extends StatefulWidget {
  const CSOldGuideDialog({super.key});

  @override
  State<CSOldGuideDialog> createState() => CSOldGuideDialogState();
}

class CSOldGuideDialogState extends State<CSOldGuideDialog>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    cs_event_fire('old_user_pop', {});
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
        body: SizedBox(
          width: 0.width(context),
          height: 0.height(context),
          child: Column(
            children: [
              SizedBox(height: 60.h),
              Row(
                children: [
                  Spacer(),
                  ParticleButton(child:CSImg(name: 'cs_close_btn', width: 32, height: 32), onTap: () async {
                    cs_event_fire('old_user_pop_close', {});
                    CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_old_guideName, true);
                    Navigator.pop(context, 0);
                  }),
                  SizedBox(width: 24.w)
                ],
              ),
              SizedBox(height: 60.h),
              CSImg(name: 'cs_daily_title', width: 288.w, height: 68.h),
              SizedBox(height: 12.h),
              CSText(text: 'Spin the wheel daily for prize!', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w500),
              SizedBox(
                width: 360.w,
                height: 360.w,
                child: Stack(
                  children: [
                    Lottie.asset(
                      fit: BoxFit.fill,
                      "guang.zip".files(),
                      repeat: true,
                    ),
                    Center(
                      child: CSImg(name: 'cs_luckyspin_icon', width: 140.w, height: 140.w),
                    )
                  ],
                ),
              ),
              ParticleButton(child: Container(
                width: 252,
                height: 52,
                decoration: BoxDecoration(
                    image: CSDImg('cs_green_b_btn')
                ),
                child: Center(
                  child: CSStrokeText(text: 'SPIN', size: 18, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                ),
              ), onTap: (){
                cs_event_fire('old_user_pop_c', {});
                Navigator.pop(context, 0);
                cs_event_fire('wheel_c', {'source_from' : 'old'});
                CashTabController.switchTo(1);
              }),
            ],
          )
        )
    );
  }
}

// 老用户转盘奖励弹窗
class CSOldAwardDialog extends StatefulWidget {
  final double award;
  const CSOldAwardDialog({super.key, required this.award});

  @override
  State<CSOldAwardDialog> createState() => CSOldAwardDialogState();
}

class CSOldAwardDialogState extends State<CSOldAwardDialog>
    with SingleTickerProviderStateMixin {

  double sigin_award = CSNumberHelpers().getPrizeWithSiginNum();

  @override
  void initState() {
    super.initState();
    cs_event_fire('old_reward_pop', {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
            width: 0.width(context),
            height: 0.height(context),
            child: Column(
              children: [
                SizedBox(height: 120.h),
                CSImg(name: 'cs_daily_title', width: 288.w, height: 68.h),
                SizedBox(height: 12.h),
                CSText(text: 'Come back tomorrow to claim the 5x reward', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w500),
                SizedBox(height: 100.h),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    SizedBox(
                      width: 120.w,
                      height: 120.w,
                      child: Stack(
                        children: [
                          Lottie.asset(
                            fit: BoxFit.fill,
                            "guang.zip".files(),
                            repeat: true,
                          ),
                          Center(
                            child: CSImg(name: 'cs_luckyspin_icon', width: 88.w, height: 88.w),
                          ),
                          Positioned(bottom: 0,left: 18.w,child: CSGradientStrokeText(text: '\$${widget.award}', gradientColors: ['#FFFFFF'.color(),'#FFF189'.color()], width: 88, height: 24, fontSize: 20, strokeWidth: 1, strokeColor: '#983300'.color()))
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    CSImg(name: 'cs_adds_icon', width: 56, height: 56),
                    SizedBox(width: 8.w),
                    SizedBox(
                      width: 120.w,
                      height: 120.w,
                      child: Stack(
                        children: [
                          Lottie.asset(
                            fit: BoxFit.fill,
                            "guang.zip".files(),
                            repeat: true,
                          ),
                          Center(
                            child: CSImg(name: 'cs_sigin_icon', width: 88.w, height: 88.w),
                          ),
                          Positioned(bottom: 0,left: 18.w,child: CSGradientStrokeText(text: '\$$sigin_award', gradientColors: ['#FFFFFF'.color(),'#FFF189'.color()], width: 88, height: 24, fontSize: 20, strokeWidth: 1, strokeColor: '#983300'.color()))
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 128.h),
                ParticleButton(child: Container(
                  width: 252,
                  height: 52,
                  decoration: BoxDecoration(
                      image: CSDImg('cs_green_b_btn')
                  ),
                  child: Row(
                    mainAxisAlignment: .center,
                    children: [
                      CSStrokeText(text: 'DOUBLE CLAIM', size: 18, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                      SizedBox(width: 8.w),
                      CSImg(name: 'cs_ad_icon', width: 32, height: 32)                    ],
                  ),
                ), onTap: (){

                  cs_event_fire('old_reward_pop_double', {});
                  CSCardAds().cs_showAd(context, 'rakwt_signin_wheel_rv', onCacheResponse: (onCacheResponse){}, adDidClosed: (adDidClosed){
                    Navigator.pop(context, 0);
                    CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, sigin_award + widget.award + CSLocalProvider.instance.cs_dollar_number);
                  });
                }),
                SizedBox(height: 18.h),
                CSUnderlineTextButton(text: 'Claim', underlineColor: '#FFFFFF'.color(),fontSize: 16,onPressed: (){
                  cs_event_fire('old_reward_pop_c', {});
                  Navigator.pop(context, 0);
                  CSCardAds().cs_showAd(context, 'rakwt_signin_wheel_int', onCacheResponse: (onCacheResponse){}, adDidClosed: (adDidClosed){
                  });
                })
              ],
            )
        )
    );
  }
}

// 宝箱引导
class CSBoxGuideDialog extends StatefulWidget {
  const CSBoxGuideDialog({super.key});

  @override
  State<CSBoxGuideDialog> createState() => CSBoxGuideDialogState();
}

class CSBoxGuideDialogState extends State<CSBoxGuideDialog>
    with SingleTickerProviderStateMixin {

  double sigin_award = CSNumberHelpers().getPrizeWithSiginNum();

  late Animation<double> _scaleAnimation;

  late AnimationController _controller;


  @override
  void initState() {
    super.initState();
    cs_event_fire('box_guide', {});
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
        backgroundColor: Colors.transparent,
        body: SizedBox(
            width: 0.width(context),
            height: 0.height(context),
            child: Stack(
              children: [
                Positioned(left: 12.w, top: 92.h,
                  child: ParticleButton(
                    onTap: (){
                      cs_event_fire('box_guide_c', {});
                      Navigator.pop(context, 0);
                      context.tipShow(CSBoxOpenDiaologWidget());
                    },
                    child: Container(
                      width: 68,
                      height: 68,
                      decoration: BoxDecoration(
                          image: CSDImg('cs_box_btn')
                      ),
                      child: Center(child: GradientCircleProgress(progress: 0.8)),
                      ),
                  )
                  ),
                /// 手指动画
                Positioned(
                  left: 56.w,
                  top: 142.h,
                  width: 72.w,
                  height: 72.h,
                  child: ParticleButton(
                    onTap: (){
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
                Positioned(
                  left: 100.w,
                  top: 90.h,
                  child: Container(
                    width: 224,
                    height: 56,
                    decoration: BoxDecoration(
                      image: CSDImg('cs_guide2_0'),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                        top: 10,
                        bottom: 8,
                      ),
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'librefranklin',
                            color: '#601E00'.color(),
                          ),
                          children: <TextSpan>[
                            const TextSpan(
                              text:
                              'Open A Treasure Chest Every 5 Scratches',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 94.w,
                  top: 100.h,
                  child: CSImg(
                    name: 'cs_guide1_0',
                    width: 7,
                    height: 16,
                  ),
                ),
              ],
            )
        )
    );
  }
}

// 余额不足
class CSNotCashDialog extends StatefulWidget {
  final int row;
  const CSNotCashDialog({super.key, required this.row});

  @override
  State<CSNotCashDialog> createState() => CSNotCashDialogState();
}

class CSNotCashDialogState extends State<CSNotCashDialog>
    with SingleTickerProviderStateMixin {

  double sigin_award = CSNumberHelpers().getPrizeWithSiginNum();

  @override
  void initState() {
    super.initState();
    cs_event_fire('cash_not_pop', {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
            width: 0.width(context),
            height: 0.height(context),
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                Container(
                  width: 328.w,
                  height: 368.h,
                  decoration: BoxDecoration(
                    image: CSDImg('cs_not_cash_bg')
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 13.h),
                      CSGradientStrokeText(
                        text: 'Insufficient Balance',
                        gradientColors: [
                          '#FFEA30'.color(),
                          '#FF9113'.color(),
                        ],
                        width: 212,
                        height: 40,
                        fontSize: 20,
                        strokeColor: Colors.transparent,
                      ),
                      SizedBox(height: 49.h),
                      CSImg(name: 'cs_not_cash_icon', width: 120, height: 120),
                      SizedBox(height: 16.h),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'librefranklin',
                            color: '#FFFFFF'.color(),
                          ),
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Only ',
                            ),
                            TextSpan(
                              text: '\$${0.to2Double(CSNumberHelpers().gameModel!.card_range[widget.row] - CSLocalProvider.instance.cs_dollar_number)}',
                              style: TextStyle(color: '#FFD91D'.color()),
                            ),
                            const TextSpan(
                              text: ' Left To Withdraw',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),
                      ParticleButton(child: Container(
                        width: 252,
                        height: 52,
                        decoration: BoxDecoration(
                            image: CSDImg('cs_green_b_btn')
                        ),
                        child: Row(
                          mainAxisAlignment: .center,
                          children: [
                            CSStrokeText(text: 'KEEP EARNING', size: 24, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                          ],
                        ),
                      ), onTap: (){
                        Navigator.pop(context, 0);
                        cs_event_fire('cash_not_pop_c', {});
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
                      }),
                    ],
                  ),
                )
              ],
            )
        )
    );
  }
}