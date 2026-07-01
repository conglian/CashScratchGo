import 'dart:math';
import 'package:cashscratchgo/CSTool/cs_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../CSBasic/CSTabBar.dart';
import '../CSTool/CSNoticeHelp.dart';
import '../CSTool/CSTBAEventTool.dart';
import '../CSTool/cs_LocalProvider.dart';
import '../CSTool/cs_ad_manger.dart';
import '../CSTool/cs_extension_help.dart';
import '../CSTool/cs_img.dart';
import '../CSTool/cs_stroke_text.dart';


class CSLaunch extends StatefulWidget {
  CSLaunch({super.key});

  @override
  State<CSLaunch> createState() => CSLaunchState();
}

class CSLaunchState extends State<CSLaunch>
    with SingleTickerProviderStateMixin {

  var _daydateString = '';

  @override
  void initState() {
    super.initState();
    _setConfigDateInfoData();
    CSNoticeHelp().setNoticeStatus();
    Future.delayed(Duration(milliseconds: 1),(){
      cs_getUserCloakConfig();
    });
    cs_event_fire('launch_page', {'source_from' : 'icon'});
    
    WidgetsBinding.instance.addPostFrameCallback((_) {

    });

  }

  void cs_getUserCloakConfig() async {
    try {
      var responseData = await CSRequestHelpers().getCloak();
      print('cashscratchGo Config Result: $responseData');
      cs_event_fire("cloak_req", {});
      cs_event_fire("cloak_suc", {
        "cloak_user": responseData.toString() == "impolite" ? 1 : 0,
      });
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getBool('sp_install_status') == null){
        prefs.setBool('sp_install_status', true);
      }
      CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_cloak_statusName, responseData.toString() == "impolite" ? true : false);
    } catch (e) {
      print('cashscratchGo Request Error: $e');
      Future.delayed(Duration(seconds: 1), () {
        cs_getUserCloakConfig();
      });
    }
  }

  Future<void> _setConfigDateInfoData() async {
    // text
    CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_login_statusName, true);
    CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_old_guideName, true);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _daydateString = prefs.getString('cs_day_date') ?? '';
    DateTime today = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(today);
    prefs.setBool('cs_old_guide', true);
    if (_daydateString == '') {
      prefs.setString('cs_day_date', formattedDate);
      // 首次
      prefs.setBool('cs_first_instll', true);
    } else {
      if (_daydateString != formattedDate) {
        CSLocalProvider.instance.updateint(CSLocalProvider.instance.cs_ad_show_indexName, 0);
        CSLocalProvider.instance.updateBool(CSLocalProvider.instance.cs_old_guideName, false);
        // 隔天
        prefs.setString('cs_day_date', formattedDate);
        prefs.setBool('cs_old_guide', false);
      }
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
        fit: StackFit.expand,
        children: [
          CSImg(
            name: 'cs_luanch_bg',
            width: 0.width(context),
            height: 0.height(context),
          ),
          Column(
            children: [
              SizedBox(height: 160.h),
              SizedBox(
                width: 100.w, height: 100.h,
                child: CSImg(name: 'cs_logo_icon'),
              ),
              SizedBox(height: 15.25.h,),
              CSText(text: 'CashScratchGo', size: 16, color: '#000000'.color(), weight: FontWeight.w500),
              CSStrokeText(text: "", size: 14, color: '#000000'.color(), weight: FontWeight.w500, skWidth: 0, skColor: '#4C0E0E'.color()),
              Spacer(),
              CSStrokeText(text: "Loading...", size: 14, color: '#FFFFFF'.color(), weight: FontWeight.w500, skWidth: 1, skColor: '#4C0E0E'.color()),
              SizedBox(height: 12.h),
              SJGradientProgressBar(
                onCompleted: () {
                  if (CSLocalProvider.instance.cs_first_show_home == false){
                    pushToGuide();
                  } else {
                    if (!CSCardAds().is_showAd){
                      CSCardAds().cs_showAd(context, 'rakwt_launch_cold',showDialog: false, onCacheResponse: (onCacheResponse){
                        pushToGuide();
                      }, adDidClosed: (adDidClosed){
                        pushToGuide();
                      });
                    } else {
                      pushToGuide();
                    }
                  }
                },
              ),
              SizedBox(height: 120.h),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> pushToGuide() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => CashBottomExample(key: homeKey),
      ),
    );
  }
}

class SJGradientProgressBar extends StatefulWidget {
  final VoidCallback? onCompleted; // ✅ 动画完成后的回调

  const SJGradientProgressBar({super.key, this.onCompleted});

  @override
  State<SJGradientProgressBar> createState() => _SJGradientProgressBarState();
}

class _SJGradientProgressBarState extends State<SJGradientProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final double barWidth = 248.w;
  final double barHeight = 24;
  final double progressHeight = 16;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: kDebugMode ? 3 : 12),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // ✅ 动画完成回调
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && widget.onCompleted != null) {
        widget.onCompleted!();
      }
    });

    // 启动动画
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: barWidth,
      height: barHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 背景图片
          Positioned.fill(child: CSImg(name: 'cs_luanch_pro')),
          // 进度条
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              final progressWidth = barWidth * _animation.value;
              final progressPercent = (_animation.value * 100)
                  .clamp(0, 100)
                  .toInt();
              return Stack(
                alignment: Alignment.center,
                children: [
                  // 渐变进度条
                  Positioned(
                    left: 4,
                    top: 4,
                    child: Container(
                      width: max(0, progressWidth - 8),
                      height: progressHeight,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            '#FFC940'.color(),
                            '#FFB60C'.color(),
                            '#E07000'.color(),
                            '#FF8A1D'.color(),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                  ),
                  // ✅ 居中显示百分比文字
                  Center(
                    child: Text(
                      '$progressPercent%',
                      style: TextStyle(
                        fontFamily: '',
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        shadows: [
                          Shadow(
                            blurRadius: 2,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 进度前端跟随图片
                  // Positioned(
                  //   left: (progressWidth - 20).clamp(0, barWidth - 20),
                  //   top: -3,
                  //   child: PSImg(name: 'cs_luach_xing', width: 30, height: 30),
                  // ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
