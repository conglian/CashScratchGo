import 'package:cashscratchgo/CSTool/cs_extension_help.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../CSBasic/CSTabBar.dart';
import '../CSMainVC/CSScratchCardVC.dart';
import '../CSTool/CSNumberHelpers.dart';
import 'CSGuideDialog.dart';

class CSGuideManager {
  static const String _stepKey = "guide_step";
  static const String _finishedKey = "guide_finished";
  static const String _versionKey = "guide_version";

  static const int totalSteps = 9;
  static const int currentVersion = 1;


  /// 获取当前状态
  static Future<GuideState> getState() async {
    final prefs = await SharedPreferences.getInstance();

    final savedVersion = prefs.getInt(_versionKey) ?? 0;

    // 👉 如果版本变了，重置引导
    if (savedVersion != currentVersion) {
      await reset();
      await prefs.setInt(_versionKey, currentVersion);
    }

    final step = prefs.getInt(_stepKey) ?? 0;
    final finished = prefs.getBool(_finishedKey) ?? false;

    return GuideState(
      currentStep: step,
      finished: finished,
    );
  }

  // 外部调用显示引导
  static Future<void> showStep(BuildContext contexts,{double award = 0.0}) async {
    final state = await getState();
    int step = state.currentStep;
    'step=$step'.log();
    switch (step) {
      case 0:
        contexts.tipShow2(CSGuideNew1Dialog());
        break;
      case 1:
        Navigator.push(
          contexts,
          MaterialPageRoute(
            builder: (_) => CSScratchCardVC(type: 0),
          ),
        );
        contexts.tipShow2(CSGuideNew2Dialog());
        break;
      case 2:
        bool isRootPage = ModalRoute.of(contexts)?.isFirst ?? false;
        if (isRootPage) {
          Navigator.push(
            contexts,
            MaterialPageRoute(
              builder: (_) => CSScratchCardVC(type: 0),
            ),
          );
          contexts.tipShow2(CSBigwinDialog(award: 0.to2Double(CSNumberHelpers().gameModel!.new_prize), isGuide: true));
        } else {
          contexts.tipShow2(CSBigwinDialog(award: 0.to2Double(CSNumberHelpers().gameModel!.new_prize), isGuide: true));
        }
        break;
      case 3:
        bool isRootPage = ModalRoute.of(contexts)?.isFirst ?? false;
        if (isRootPage) {
          Navigator.push(
            contexts,
            MaterialPageRoute(
              builder: (_) => CSScratchCardVC(type: 0),
            ),
          );
          contexts.tipShow2(CSGuideNew4Dialog(contextStr: 'Congrats! You’ve Won Your First\nSponsored Reward 🎉', isGuide: true));
        } else {
          contexts.tipShow2(CSGuideNew4Dialog(contextStr: 'Congrats! You’ve Won Your First\nSponsored Reward 🎉', isGuide: true));
        }
        break;
      case 4:
        bool isRootPage = ModalRoute.of(contexts)?.isFirst ?? false;
        if (isRootPage) {
          Navigator.push(
            contexts,
            MaterialPageRoute(
              builder: (_) => CSScratchCardVC(type: 0),
            ),
          );
          contexts.tipShow2(CSGuideNew5Dialog());
        } else {
          contexts.tipShow2(CSGuideNew5Dialog());
        }
        break;
      case 5:
        bool isRootPage = ModalRoute.of(contexts)?.isFirst ?? false;
        if (isRootPage) {
          CashTabController.switchTo(2);
          contexts.tipShow2(CSGuideNew7Dialog());
        } else {
          contexts.tipShow2(CSGuideNew7Dialog());
        }
        break;
      case 6:
        bool isRootPage = ModalRoute.of(contexts)?.isFirst ?? false;
        if (isRootPage) {
          CashTabController.switchTo(2);
          contexts.tipShow2(CSGuideNew8Dialog());
        } else {
          contexts.tipShow2(CSGuideNew8Dialog());
        }
        break;
      case 7:
        bool isRootPage = ModalRoute.of(contexts)?.isFirst ?? false;
        if (isRootPage) {
          CashTabController.switchTo(2);
          contexts.tipShow2(CSGuideNew9Dialog());
        } else {
          contexts.tipShow2(CSGuideNew9Dialog());
        }
        break;
      case 8:
        break;
      case 9:
        break;
      case 10:
        break;
      case 11:
        break;
      default:
        return;
    }
  }

  /// 下一步
  static Future<void> nextStep(BuildContext contexts, {double award = 0.0}) async {
    final prefs = await SharedPreferences.getInstance();
    int step = prefs.getInt(_stepKey) ?? 0;

    step++;

    if (step >= totalSteps) {
      await finishGuide();
    } else {
      await prefs.setInt(_stepKey, step);
    }
    await showStep(contexts, award: award);
  }

  /// 完成引导
  static Future<void> finishGuide() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_finishedKey, true);
    await prefs.remove(_stepKey);
  }

  /// 跳过
  static Future<void> skip() async {
    await finishGuide();
  }

  /// 重置（调试用）
  static Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_stepKey);
    await prefs.remove(_finishedKey);
  }
}


class GuideState {
  final int currentStep;
  final bool finished;

  GuideState({
    required this.currentStep,
    required this.finished,
  });
}