import 'dart:async';
import 'dart:convert';
import 'package:cashscratchgo/CSTool/CS_LocalProvider.dart';
import 'package:cashscratchgo/CSTool/cs_GradientText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../CSBasic/CSTabBar.dart';
import '../CSMainVC/CSScratchCardVC.dart';
import '../CSTool/CSLocalImageScratchCard.dart';
import '../CSTool/CSTBAEventTool.dart';
import '../CSTool/cs_GradientNumber.dart';
import '../CSTool/cs_extension_help.dart';
import '../CSTool/cs_img.dart';
import '../CSTool/cs_stroke_text.dart';
import '../CSTool/cs_text.dart';
import 'CSGuideManager.dart';

class CSGuideNew1Dialog extends StatefulWidget {
  const CSGuideNew1Dialog({super.key});

  @override
  State<CSGuideNew1Dialog> createState() => CSGuideNew1DialogState();
}

class CSGuideNew1DialogState extends State<CSGuideNew1Dialog>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    cs_event_fire('new_guide_one', {});

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
      body: ParticleButton(
        onTap: (){
          Navigator.pop(context, 0);
          CSGuideManager.nextStep(context);
        },
        child: Stack(
          children: [
            Positioned(
              left: 25.w,
              top: 115.h,
              child: CSImg(
                name: 'cs_scratch_list_0',
                width: 160.w,
                height: 132.h,
              ),
            ),

            /// 手指动画
            Positioned(
              left: 138.w,
              top: 220.h,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: CSImg(
                  name: 'cs_finger_icon',
                  width: 72.w,
                  height: 72.h,
                ),
              ),
            ),

            Positioned(
              left: 20.w,
              top: 395.h,
              child: CSImg(
                name: 'cs_laba_icon',
                width: 64.w,
                height: 64.h,
              ),
            ),

            Positioned(
              left: 100.w,
              top: 395.h,
              child: Container(
                width: 224,
                height: 99,
                decoration: BoxDecoration(
                  image: CSDImg('cs_guide1_1'),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    top: 16,
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
                          'Advertiser-Sponsored Scratch Rewards\n Share Up To ',
                        ),
                        TextSpan(
                          text: '\$50 ',
                          style: TextStyle(
                            color: '#F10000'.color(),
                          ),
                        ),
                        const TextSpan(
                          text:
                          'From Today’s Reward Pool',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 94.w,
              top: 410.h,
              child: CSImg(
                name: 'cs_guide1_0',
                width: 7,
                height: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CSGuideNew2Dialog extends StatefulWidget {
  const CSGuideNew2Dialog({super.key});

  @override
  State<CSGuideNew2Dialog> createState() => CSGuideNew2DialogState();
}

class CSGuideNew2DialogState extends State<CSGuideNew2Dialog>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    cs_event_fire('new_guide_two', {});

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

            Positioned(
              left: 20.w,
              top: 195.h,
              child: CSImg(
                name: 'cs_laba_icon',
                width: 64.w,
                height: 64.h,
              ),
            ),

            Positioned(
              left: 100.w,
              top: 195.h,
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
                    top: 12,
                    bottom: 8,
                  ),
                  child: CSText(text: 'Your First Sponsored Reward Is Inside!!', size: 14, color: '#601E00'.color(), weight: FontWeight.w500, maxLines: 2,)
                ),
              ),
            ),
            Positioned(
              left: 94.w,
              top: 210.h,
              child: CSImg(
                name: 'cs_guide1_0',
                width: 7,
                height: 16,
              ),
            ),
            Positioned(top: 338.h,child: SizedBox(
              width: 0.width(context),
              height: 251,
              child: Column(
                children: [
                  SizedBox(height: 11),
                  SizedBox(
                    width: 328.w,
                    height: 240,
                    child: CSLocalImageScratchCard(coverImagePath:'cs_card_top_0'.image(), contentW: 328.w, contentH: 240, child: Container(
                      width: 328.w,
                      height: 240,
                      decoration: BoxDecoration(
                          image: CSDImg('cs_card_bg_0')
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
                         Navigator.pop(context);
                         CSGuideManager.nextStep(context, award: 20.00);
                    },),
                  )

                ],
              ),
            ))
          ],
        ),
    );
  }
}

class CSBigwinDialog extends StatefulWidget {
  final bool isGuide;
  final double award;
  const CSBigwinDialog({
    super.key,
    required this.award, required this.isGuide,
  });

  @override
  State<CSBigwinDialog> createState() => CSBigwinDialogState();
}

class CSBigwinDialogState extends State<CSBigwinDialog>
    with TickerProviderStateMixin {

  late AnimationController _rotateController;
  late AnimationController _breathController;

  late Animation<double> _scaleAnimation;

  late Animation<double> _scaleAnimation2;

  @override
  void initState() {
    super.initState();

    cs_event_fire('new_guide_three', {});

    /// 光圈旋转动画
    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

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

    _scaleAnimation2 = Tween<double>(
      begin: 1,
      end: 1.12,
    ).animate(
      CurvedAnimation(
        parent: _breathController,
        curve: Curves.easeInOut,
      ),
    );

    _breathController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _rotateController.dispose();
    _breathController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 144.h),
              Container(
                width: 0.width(context),
                height: 360.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    /// cs_guang_icon 旋转动画
                    RotationTransition(
                      turns: _rotateController,
                      child: Container(
                        width: 0.width(context),
                        height: 360.h,
                        decoration: BoxDecoration(
                          image: CSDImg('cs_guang_icon'),
                        ),
                      ),
                    ),

                    /// cs_bigwin_bg 呼吸动画
                    Positioned(
                      left: (0.width(context) - 304.w) * 0.5,
                      bottom: 84 + 48,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: CSImg(
                          name: 'cs_bigwin_bg',
                          width: 304.w,
                          height: 180,
                        ),
                      ),
                    ),

                    Positioned(
                      left: (0.width(context) - 320) * 0.5,
                      bottom: 40,
                      child: CSImg(
                        name: 'cs_award_bg',
                        width: 320,
                        height: 84,
                      ),
                    ),

                    Positioned(
                      left: (0.width(context) - 320) * 0.5,
                      bottom: 40,
                      child: ScaleTransition(
                        scale: _scaleAnimation2,
                        child: SizedBox(
                          child: Center(
                            child: CSGradientStrokeText(
                              text:
                              '\$${widget.award.toStringAsFixed(2)}',
                              gradientColors: [
                                '#FFFFFF'.color(),
                                '#FFF189'.color(),
                              ],
                              width: 320,
                              height: 84,
                              fontSize: 52,
                              strokeWidth: 1,
                              strokeColor: '#983300'.color(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50.h),
              Row(
                children: [
                  Spacer(),
                  Container(
                    width: 180,
                    height: 32,
                    decoration: BoxDecoration(
                      color: '#FFFFFF'.color(),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 2),
                        CSImg(name: 'cs_ad_icon', width: 32, height: 32),
                        CSText(text: 'One Ad To Secure Reward', size: 11, color: '#000000'.color(), weight: FontWeight.w500)
                      ],
                    ),
                  ),
                  SizedBox(width: 16.w)
                ],
              ),
              ParticleButton(
                onTap: () {
                  Navigator.pop(context, 1);
                  if (widget.isGuide){
                    CSGuideManager.nextStep(context);
                    CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, widget.award * 2);
                  }
                },
                child: Container(
                  width: 252.w,
                  height: 52.h,
                  decoration: BoxDecoration(
                    image: CSDImg('cs_green_btn_bg'),
                  ),
                  child: Center(
                    child: CSStrokeText(
                      text:
                      'CLAIM\$${(widget.award * 2).toStringAsFixed(2)}',
                      size: 24,
                      color: '#FFFFFF'.color(),
                      weight: FontWeight.w900,
                      skWidth: 2,
                      skColor: '#025C10'.color(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              ParticleButton(
                onTap: () {
                  Navigator.pop(context, 0);
                  if (widget.isGuide){
                    CSGuideManager.nextStep(context);
                    CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, widget.award);
                  }
                },
                child: SizedBox(
                  width: 252.w,
                  height: 52.h,
                  child: Center(
                    child: CSUnderlineTextButton(
                      text:
                      '\$${(widget.award).toStringAsFixed(2)}',
                      textColor: '#FFFFFF'.color(),
                      underlineColor: '#FFFFFF'.color(),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CSGuideNew4Dialog extends StatefulWidget {
  const CSGuideNew4Dialog({super.key});

  @override
  State<CSGuideNew4Dialog> createState() => CSGuideNew4DialogState();
}

class CSGuideNew4DialogState extends State<CSGuideNew4Dialog>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    cs_event_fire('new_guide_four', {});

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
        Navigator.pop(context, 0);
        CSGuideManager.nextStep(context);
      });
    });
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
                      const SizedBox(height: 42),

                      Padding(
                        padding: EdgeInsets.only(left: 44.w),
                        child: CSText(
                          text:
                          'Congrats! You’ve Won Your First\nSponsored Reward 🎉',
                          size: 18,
                          color: '#F5F4D0'.color(),
                          weight: FontWeight.w700,
                          maxLines: 2,
                          align: TextAlign.center,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Padding(
                        padding: EdgeInsets.only(left: 44.w),
                        child: CSText(
                          text: '+\$134.00',
                          size: 32,
                          color: '#F5F4D0'.color(),
                          weight: FontWeight.w700,
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
// cash 引导
class CSGuideNew5Dialog extends StatefulWidget {
  const CSGuideNew5Dialog({super.key});

  @override
  State<CSGuideNew5Dialog> createState() => CSGuideNew5DialogState();
}

class CSGuideNew5DialogState extends State<CSGuideNew5Dialog>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    cs_event_fire('new_guide_one', {});

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
      body: ParticleButton(
        onTap: (){
          Navigator.pop(context, 0);
          CSGuideManager.nextStep(context);
        },
        child: Stack(
          children: [

            Positioned(
              left: 20.w,
              top: 525.h,
              child: CSImg(
                name: 'cs_laba_icon',
                width: 64.w,
                height: 64.h,
              ),
            ),

            Positioned(
              left: 100.w,
              top: 525.h,
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
                    top: 12,
                    bottom: 8,
                  ),
                  child: CSText(text: 'Your First Advertiser Share Is Ready — Check Your Wallet', size: 14, color: '#601E00'.color(), weight: FontWeight.w500, maxLines: 2,)
                ),
              ),
            ),

            Positioned(
              left: 94.w,
              top: 540.h,
              child: CSImg(
                name: 'cs_guide1_0',
                width: 7,
                height: 16,
              ),
            ),

            Positioned(right: 16.w,bottom: 26.h,child: ParticleButton(
              onTap: (){
                  Navigator.pop(context);
                  Navigator.pop(context);
                  CashTabController.switchTo(2);
                  CSGuideManager.nextStep(context);
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
            ),),

            /// 手指动画
            Positioned(
              right: 48.w,
              bottom: 60.h,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: CSImg(
                  name: 'cs_shou_2',
                  width: 72.w,
                  height: 72.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CSCashWinDialog extends StatefulWidget {
  final bool isGuide;
  final double award;
  const CSCashWinDialog({
    super.key,
    required this.award, required this.isGuide,
  });

  @override
  State<CSCashWinDialog> createState() => CSCashWinDialogState();
}

class CSCashWinDialogState extends State<CSCashWinDialog>
    with TickerProviderStateMixin {

  late AnimationController _rotateController;
  late AnimationController _breathController;

  late Animation<double> _scaleAnimation;

  late Animation<double> _scaleAnimation2;

  @override
  void initState() {
    super.initState();

    cs_event_fire('new_guide_three', {});

    /// 光圈旋转动画
    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

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

    _scaleAnimation2 = Tween<double>(
      begin: 1,
      end: 1.12,
    ).animate(
      CurvedAnimation(
        parent: _breathController,
        curve: Curves.easeInOut,
      ),
    );

    _breathController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _rotateController.dispose();
    _breathController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 144.h),
              Container(
                width: 0.width(context),
                height: 360.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    /// cs_guang_icon 旋转动画
                    RotationTransition(
                      turns: _rotateController,
                      child: Container(
                        width: 0.width(context),
                        height: 360.h,
                        decoration: BoxDecoration(
                          image: CSDImg('cs_guang_icon'),
                        ),
                      ),
                    ),

                    /// cs_bigwin_bg 呼吸动画
                    Positioned(
                      left: (0.width(context) - 304.w) * 0.5,
                      bottom: 84 + 48,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: CSImg(
                          name: 'cs_cash_bg',
                          width: 304.w,
                          height: 180,
                        ),
                      ),
                    ),

                    Positioned(
                      left: (0.width(context) - 320) * 0.5,
                      bottom: 40,
                      child: CSImg(
                        name: 'cs_award_bg',
                        width: 320,
                        height: 84,
                      ),
                    ),

                    Positioned(
                      left: (0.width(context) - 320) * 0.5,
                      bottom: 40,
                      child: ScaleTransition(
                        scale: _scaleAnimation2,
                        child: SizedBox(
                          child: Center(
                            child: CSGradientStrokeText(
                              text:
                              '\$${widget.award.toStringAsFixed(2)}',
                              gradientColors: [
                                '#FFFFFF'.color(),
                                '#FFF189'.color(),
                              ],
                              width: 320,
                              height: 84,
                              fontSize: 52,
                              strokeWidth: 1,
                              strokeColor: '#983300'.color(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.h),
              // Row(
              //   children: [
              //     Spacer(),
              //     Container(
              //       width: 180,
              //       height: 32,
              //       decoration: BoxDecoration(
              //           color: '#FFFFFF'.color(),
              //           borderRadius: BorderRadius.circular(8)
              //       ),
              //       child: Row(
              //         children: [
              //           SizedBox(width: 2),
              //           CSImg(name: 'cs_ad_icon', width: 32, height: 32),
              //           CSText(text: 'One Ad To Secure Reward', size: 11, color: '#000000'.color(), weight: FontWeight.w500)
              //         ],
              //       ),
              //     ),
              //     SizedBox(width: 16.w)
              //   ],
              // ),
              ParticleButton(
                onTap: () {
                  Navigator.pop(context, 1);
                  CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, widget.award * 2);
                },
                child: Container(
                  width: 252.w,
                  height: 52.h,
                  decoration: BoxDecoration(
                    image: CSDImg('cs_green_btn_bg'),
                  ),
                  child: Center(
                    child: CSStrokeText(
                      text:
                      'CLAIM\$${(widget.award * 2).toStringAsFixed(2)}',
                      size: 24,
                      color: '#FFFFFF'.color(),
                      weight: FontWeight.w900,
                      skWidth: 2,
                      skColor: '#025C10'.color(),
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 10.h),
              // ParticleButton(
              //   onTap: () {
              //     Navigator.pop(context, 0);
              //     CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, widget.award);
              //   },
              //   child: SizedBox(
              //     width: 252.w,
              //     height: 52.h,
              //     child: Center(
              //       child: CSUnderlineTextButton(
              //         text:
              //         '\$${(widget.award).toStringAsFixed(2)}',
              //         textColor: '#FFFFFF'.color(),
              //         underlineColor: '#FFFFFF'.color(),
              //         fontSize: 16,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
// 转盘引导
class CSGuideNew6Dialog extends StatefulWidget {
  const CSGuideNew6Dialog({super.key});

  @override
  State<CSGuideNew6Dialog> createState() => CSGuideNew6DialogState();
}

class CSGuideNew6DialogState extends State<CSGuideNew6Dialog>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    cs_event_fire('new_guide_one', {});

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
      body: ParticleButton(
        onTap: (){
          Navigator.pop(context, 0);
          Navigator.pop(context, 0);
          CashTabController.switchTo(1);
        },
        child: Stack(
          children: [

            Positioned(left: 16.w,bottom: 88.h,child: ParticleButton(
              onTap: (){
                Navigator.pop(context);
                Navigator.pop(context);
                CashTabController.switchTo(2);
                CSGuideManager.nextStep(context);
              },
              child: Container(
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
              ),
            ),),

            /// 手指动画
            Positioned(
              left: 38.w,
              bottom: 130.h,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: CSImg(
                  name: 'cs_shou_3',
                  width: 72.w,
                  height: 72.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}