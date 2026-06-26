import 'dart:async';
import 'dart:convert';
import 'package:cashscratchgo/CSTool/CSNumberHelpers.dart';
import 'package:cashscratchgo/CSTool/cs_LocalProvider.dart';
import 'package:cashscratchgo/CSTool/cs_GradientText.dart';
import 'package:cashscratchgo/CSTool/cs_ad_manger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
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
      body: ParticleButton(
        onTap: (){
          Navigator.pop(context, 0);
          CSGuideManager.nextStep(context);
        },
        child: Stack(
          children: [
            Positioned(
              left: 25.w,
              top: 102.h,
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

  List<int> award_index = [0, 1,2,3,3,3,2,1,2];

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
              bottom: 380.h,
              child: CSImg(
                name: 'cs_guide1_0',
                width: 7,
                height: 16,
              ),
            ),
            Positioned(top: 338.h,child: SizedBox(
              width: 0.width(context),
              height: 252.h,
              child: Column(
                children: [
                  SizedBox(height: 11),
                  SizedBox(
                    width: 328.w,
                    height: 240.h,
                    child: CSLocalImageScratchCard(coverImagePath:'cs_card_top_0'.image(), contentW: 328.w, contentH: 240.h, child: Container(
                      width: 328.w,
                      height: 240.h,
                      decoration: BoxDecoration(
                          image: CSDImg('cs_card_bg_0')
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: .spaceAround,
                            children: [
                              CSStrokeText(text: '\$${CSNumberHelpers().gameModel!.new_prize}', size: 20, color: '#FFE733'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#C50000'.color()),
                              CSStrokeText(text: '\$${CSNumberHelpers().gameModel!.new_prize}', size: 20, color: '#FFE733'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#C50000'.color()),
                              CSStrokeText(text: '\$${CSNumberHelpers().gameModel!.new_prize}', size: 20, color: '#FFE733'.color(), weight: FontWeight.w900, skWidth: 1, skColor: '#C50000'.color()),
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
                                    width: 88.w,
                                    height: 88,
                                    child: Stack(
                                        children: [
                                          Positioned(top: 10.h,left: 0.w,child: Row(
                                            children: [
                                              CSBouncyImage(imagePath: 'cs_card1_icon_${award_index[index]}', width: 64, height: 64, enableAnimation: index == 3 || index == 4 || index == 5)
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
                         Future.delayed(Duration(milliseconds: 2000),() async {
                           Navigator.pop(context);
                           CSGuideManager.nextStep(homeKey.currentState!.context, award: 0.to2Double(CSNumberHelpers().gameModel!.new_prize));
                         });
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
              SizedBox(
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
                  if (widget.isGuide){
                    CSCardAds().cs_showAd(context, '_rv', onCacheResponse: (onCacheResponse) async {
                      Navigator.pop(context, 1);
                      await CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, CSLocalProvider.instance.cs_dollar_number + widget.award);
                      CSGuideManager.nextStep(context);
                    }, adDidClosed: (adDidClosed) async {
                      Navigator.pop(context, 1);
                      await CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, (widget.award * 2) + CSLocalProvider.instance.cs_dollar_number);
                      CSGuideManager.nextStep(context);
                    });
                  } else {
                    CSCardAds().cs_showAd(context, 'rv', onCacheResponse: (onCacheResponse){
                      Navigator.pop(context, 1);
                    }, adDidClosed: (adDidClosed) async {
                      Navigator.pop(context, 1);
                      await CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, (widget.award * 2) + CSLocalProvider.instance.cs_dollar_number);
                    });
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
                onTap: () async {
                  if (widget.isGuide){
                    Navigator.pop(context, 0);
                    await CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, widget.award + CSLocalProvider.instance.cs_dollar_number);
                    CSGuideManager.nextStep(context);
                  } else {
                    if (CSNumberHelpers().checkProbability()){
                      CSCardAds().cs_showAd(context, '_int', onCacheResponse: (onCacheResponse){
                        Navigator.pop(context, 0);
                      }, adDidClosed: (adDidClosed) async {
                        Navigator.pop(context, 0);
                        await CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, widget.award + CSLocalProvider.instance.cs_dollar_number);
                      });
                    } else {
                      Navigator.pop(context, 0);
                      await CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, widget.award + CSLocalProvider.instance.cs_dollar_number);
                    }
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
  final String contextStr;
  final bool isGuide;
  const CSGuideNew4Dialog({super.key, required this.contextStr, required this.isGuide});

  @override
  State<CSGuideNew4Dialog> createState() => CSGuideNew4DialogState();
}

class CSGuideNew4DialogState extends State<CSGuideNew4Dialog>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  late Route _route;

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
        if (!mounted) return;

        final navigator = Navigator.of(context);

        // 当前 route 仍然在栈里才关闭
        if (_route.isCurrent) {
          navigator.pop(0);
        }
        if (widget.isGuide){
          CSGuideManager.nextStep(context);
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
                      const SizedBox(height: 42),

                      Padding(
                        padding: EdgeInsets.only(left: 44.w),
                        child: CSText(
                          text:
                          widget.contextStr,
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
                          text: '+\$${0.to2Double(CSLocalProvider.instance.cs_dollar_number)}',
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
                  'CSLocalProvider.instance.cs_dolas_number=${CSLocalProvider.instance.cs_dollar_number}'.log();
                  CSCardAds().cs_showAd(context, '_rv', onCacheResponse: (onCacheResponse){}, adDidClosed: (adDidClosed) async {
                   await CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, (widget.award * 2) + CSLocalProvider.instance.cs_dollar_number);
                  });
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
                  if (CSNumberHelpers().checkProbability()){
                    CSCardAds().cs_showAd(context, '_int', onCacheResponse: (onCacheResponse){}, adDidClosed: (adDidClosed){
                      CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, widget.award + CSLocalProvider.instance.cs_dollar_number);
                    });
                  } else {
                    CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_dolas_numberName, widget.award + CSLocalProvider.instance.cs_dollar_number);
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

// 提现引导第一步
class CSGuideNew7Dialog extends StatefulWidget {
  const CSGuideNew7Dialog({super.key});

  @override
  State<CSGuideNew7Dialog> createState() => CSGuideNew7DialogState();
}

class CSGuideNew7DialogState extends State<CSGuideNew7Dialog>
    with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();

    cs_event_fire('new_guide_one', {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ParticleButton(
        onTap: (){
          Navigator.pop(context, 1);
          CSGuideManager.nextStep(context);
        },
        child: Stack(
          children: [
            Positioned(
              top: 158.h,
              right: 24.w,
              child: Container(
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
                      value: CSLocalProvider.instance.cs_dollar_number,
                      duration: 1800,
                      fontSize: 32.0,
                      gradientColors: ['#FFFFFF'.color(), '#FFF189'.color()],
                      borderColor: '#983300'.color(),
                      borderWidth: 1,
                      decimalPlaces: 2,
                    ),),
                    Positioned(right: 12.w,bottom: 12.w,child: ParticleButton(child: Container(
                      width: 88,
                      height: 28,
                      decoration: BoxDecoration(
                          image: CSDImg('cs_cash_green')
                      ),
                      child: Center(
                        child: CSStrokeText(text: 'Cash Out', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w700, skWidth: 1, skColor: '#025C10'.color()),
                      ),
                    ), onTap: (){
                      Navigator.pop(context, 1);
                      CSGuideManager.nextStep(context);

                    })),
                    Positioned(right: 4.w,top: 4.w,child: CSImg(name: 'cs_cash_home_${CSLocalProvider.instance.cs_account_seled_index}', width: 60, height: 60)),
                  ],
                ),
              ),
            ),
            Positioned(right: 64.w,top: 264.w,child: CSImg(name: 'cs_guide_7_0', width: 16, height: 7)),
            Positioned(right: 28.w,top: 270.w,child: Container(
              width: 224,
              height: 56,
              decoration: BoxDecoration(
                image: CSDImg('cs_guide_7_1')
              ),
              child: Center(
                child: Padding(padding: EdgeInsetsGeometry.only(left: 20),child: CSText(text: 'Tap “Cash Out” To See How Cashout Works!!', size: 14, color: '#601E00'.color(), weight: FontWeight.w500, maxLines: 2)),
              ),
            )),
          ],
        )
      ),
    );
  }
}



// 提现引导第二步
class CSGuideNew8Dialog extends StatefulWidget {
  const CSGuideNew8Dialog({super.key});

  @override
  State<CSGuideNew8Dialog> createState() => CSGuideNew8DialogState();
}

class CSGuideNew8DialogState extends State<CSGuideNew8Dialog>
    with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();

    cs_event_fire('new_guide_one', {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ParticleButton(
          onTap: (){

          },
          child: Stack(
            children: [

              Positioned(
                right: 16.w,
                top: 40.h,
                child: ParticleButton(child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      image: CSDImg('cs_close_btn')
                  ),
                ), onTap: (){
                  Navigator.pop(context, 1);
                  CSGuideManager.nextStep(context);

                }),
              ),
              Positioned(right: (0.width(context) - 239) * 0.5.w,top: 100.h,child: CSGradientStrokeText(text: 'How Cashout Works', gradientColors: ['#FFEA30'.color(), '#FF9113'.color()], width: 239, height: 36, fontSize: 24, strokeWidth: 1, strokeColor: '#983300'.color())),
              Positioned(right: 0.w,top: 144.h,width: 0.width(context),child: CSText(text: 'Real rewards powered by our sponsors.', size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w700, align: .center,)),
              Positioned(right: (0.width(context) - 200) * 0.5.w,top: 236.h,child: Container(
                width: 200,
                height: 48,
                decoration: BoxDecoration(
                  color: '#610A0A'.color(),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    width: 2,
                    color: '#FF8809'.color()
                  )
                ),
                child: Center(
                  child: CSText(text: 'Advertiser Pays', size: 16, color: '#FFFFFF'.color(), weight: FontWeight.w700),
                ),
              )),
              Positioned(right: (0.width(context) - 52) * 0.5.w,top: 288.h,child: CSImg(name: 'cs_jie_2', width: 52, height: 52)),
              Positioned(right: (0.width(context) - 200) * 0.5.w,top: 400.h,child: Container(
                width: 200,
                height: 48,
                decoration: BoxDecoration(
                    color: '#610A0A'.color(),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                        width: 2,
                        color: '#FF8809'.color()
                    )
                ),
                child: Center(
                  child: CSText(text: 'More Scratch', size: 16, color: '#FFFFFF'.color(), weight: FontWeight.w700),
                ),
              )),
              Positioned(right: (0.width(context) - 68) * 0.5.w,top: 344.h,child: CSImg(name: 'cs_jie_1', width: 68, height: 68)),
              Positioned(right: (0.width(context) - 52) * 0.5.w,top: 452.h,child: CSImg(name: 'cs_jie_2', width: 52, height: 52)),
              Positioned(right: (0.width(context) - 68) * 0.5.w,top: 180.h,child: CSImg(name: 'cs_jie_0', width: 68, height: 68)),
              Positioned(right: (0.width(context) - 200) * 0.5.w,top: 564.h,child: Container(
                width: 200,
                height: 48,
                decoration: BoxDecoration(
                    color: '#610A0A'.color(),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                        width: 2,
                        color: '#FF8809'.color()
                    )
                ),
                child: Center(
                  child: CSText(text: 'Earn Real Cash', size: 16, color: '#FFFFFF'.color(), weight: FontWeight.w700),
                ),
              )),
              Positioned(right: (0.width(context) - 68) * 0.5.w,top: 508.h,child: CSImg(name: 'cs_jie_3', width: 68, height: 68)),
              Positioned(
                left: (0.width(context) - 252) * 0.5,
                top: 636.h,
                child: ParticleButton(child: Container(
                  width: 252,
                  height: 52,
                  decoration: BoxDecoration(
                      image: CSDImg('cs_green_b_btn')
                  ),
                  child: Center(
                    child: CSStrokeText(text: 'GOT IT', size: 24, color: '#FFFFFF'.color(), weight: FontWeight.w900, skWidth: 2, skColor: '#025C10'.color()),
                  ),
                ), onTap: (){
                  Navigator.pop(context, 1);
                  CSGuideManager.nextStep(context);

                }),
              ),
            ],
          )
      ),
    );
  }
}

class CSGuideNew9Dialog extends StatefulWidget {
  const CSGuideNew9Dialog({super.key});

  @override
  State<CSGuideNew9Dialog> createState() => CSGuideNew9DialogState();
}

class CSGuideNew9DialogState extends State<CSGuideNew9Dialog> {
  final PageController _pageController = PageController(initialPage: 0);
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    cs_event_fire('new_guide_one', {});
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int index) {
    if (!_pageController.hasClients) return;

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );

    setState(() {
      _pageIndex = index;
    });
  }

  Widget _buildPage(int index) {
    return Stack(
      children: [
        Positioned(
          left: (0.width(context) - 232) * 0.5,
          top: 60.h,
          child: Container(
            width: 232,
            height: 260,
            decoration: BoxDecoration(
              image: CSDImg('cs_jie_1_0'),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 8,
                  top: 8,
                  child: CSImg(
                    name: 'cs_jie_1_4',
                    width: 28,
                    height: 28,
                  ),
                ),
                Positioned(
                  left: 48,
                  top: 50,
                  child: CSText(
                    text: 'Proof Of Payouts',
                    size: 16,
                    color: '#FFFFFF'.color(),
                    weight: FontWeight.w700,
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 76,
                  child: Container(
                    width: 192,
                    height: 172,
                    decoration: BoxDecoration(
                      image: CSDImg('cs_jie_1_2'),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        CSGradientStrokeText(
                          text:
                          '\$${CSNumberHelpers().gameModel!.card_range.first}',
                          gradientColors: [
                            '#FFFFFF'.color(),
                            '#FFF189'.color()
                          ],
                          width: 140,
                          height: 48,
                          fontSize: 36,
                        ),
                        SizedBox(height: 8),
                        CSText(
                          text: 'Received Via Paypal',
                          size: 16,
                          color: '#000000'.color(),
                          weight: FontWeight.w700,
                        ),
                        SizedBox(height: 28),
                        CSText(
                          text: 'Anna · California · USA',
                          size: 12,
                          color: '#4A4A4A'.color(),
                          weight: FontWeight.w500,
                        ),
                        SizedBox(height: 4),
                        CSText(
                          text: '2 Hours Ago',
                          size: 11,
                          color: '#888888'.color(),
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        Positioned(
          left: (0.width(context) - 120) * 0.5,
          top: 0.h,
          child: SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              children: [
                Lottie.asset(
                  width: 120,
                  height: 120,
                  fit: BoxFit.fill,
                  "guang.zip".files(),
                  repeat: true,
                ),
                Center(
                  child: CSImg(
                    name: 'cs_jie_user_${_pageIndex + 1}',
                    width: 64,
                    height: 64,
                  ),
                ),
              ],
            )
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // ================= CLOSE =================
          Positioned(
            right: 16.w,
            top: 40.h,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context, 1);
                CSGuideManager.nextStep(context);
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  image: CSDImg('cs_close_btn'),
                ),
              ),
            ),
          ),

          // ================= TOP PANEL =================
          Positioned(
            right: (0.width(context) - 321) * 0.5.w,
            top: 112.h,
            child: Container(
              width: 321,
              height: 96,
              decoration: BoxDecoration(
                image: CSDImg('cs_jie_1_1'),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'librefranklin',
                        color: '#FFFFFF'.color(),
                      ),
                      children: [
                        const TextSpan(
                          text: 'You Can Withdraw Once Your Balance Reach ',
                        ),
                        TextSpan(
                          text: '\$1000 ',
                          style: TextStyle(
                            color: '#FFD91D'.color(),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ================= PAGEVIEW =================
          Positioned(
            top: 212.h,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 320.h,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (i) {
                  setState(() => _pageIndex = i);
                },
                itemBuilder: (context, index) {
                  return _buildPage(index);
                },
              ),
            ),
          ),

          // ================= LEFT BUTTON =================
          Positioned(
            left: 18.w,
            top: 392.h,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (_pageIndex > 0) {
                  _goToPage(_pageIndex - 1);
                }
              },
              child: SizedBox(
                width: 32,
                height: 32,
                child: Center(
                  child: CSImg(
                    name: 'cs_jie_1_5',
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),
          ),

          // ================= RIGHT BUTTON =================
          Positioned(
            right: 18.w,
            top: 392.h,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (_pageIndex < 2) {
                  _goToPage(_pageIndex + 1);
                }
              },
              child: SizedBox(
                width: 32,
                height: 32,
                child: Center(
                  child: CSImg(
                    name: 'cs_jie_1_6',
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),
          ),

          // ================= KEEP EARNING =================
          Positioned(
            left: (0.width(context) - 252) * 0.5,
            bottom: 92.h,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context, 1);
                CSGuideManager.nextStep(context);
              },
              child: Container(
                width: 252,
                height: 52,
                decoration: BoxDecoration(
                  image: CSDImg('cs_green_b_btn'),
                ),
                child: Center(
                  child: CSStrokeText(
                    text: 'KEEP EARNING',
                    size: 24,
                    color: '#FFFFFF'.color(),
                    weight: FontWeight.w900,
                    skWidth: 2,
                    skColor: '#025C10'.color(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}