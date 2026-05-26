import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../CSMainVC/CSScratchCardVC.dart';
import '../CSTool/CSTBAEventTool.dart';
import '../CSTool/cs_GradientNumber.dart';
import '../CSTool/cs_extension_help.dart';
import '../CSTool/cs_img.dart';
import '../CSTool/cs_stroke_text.dart';
import '../CSTool/cs_text.dart';

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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CSScratchCardVC(type: 0),
            ),
          );
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