import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'CSMainVC/CSLuanchVC.dart';
import 'CSTool/CSAudioUtils.dart';
import 'CSTool/CSFKManger.dart';
import 'CSTool/CSInAppNotification.dart';
import 'CSTool/CSNumberHelpers.dart';
import 'CSTool/CS_extension_help.dart';
import 'CSTool/cs_LocalProvider.dart';
import 'CSTool/cs_init_sdk.dart';
import 'package:cashScarchGoFK/cashScarchGoFK.dart';

final trigger = CSThresholdTrigger();


Future<void> main() async {
  // 初始化Flutter绑定（确保async操作在runApp前执行）
  WidgetsFlutterBinding.ensureInitialized();
  // 只允许竖屏
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // 状态栏背景透明
      statusBarIconBrightness: Brightness.dark, // 安卓图标白色
      statusBarBrightness: Brightness.light, // iOS 用
    ),
  );

  await Firebase.initializeApp();

  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // 捕获 Flutter 框架错误
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // 捕获 async / isolate 全局错误
  PlatformDispatcher.instance.onError = (error, stack) {
    bool isFatal = false;
    // 严重错误：fatal
    if (error is OutOfMemoryError ||
        error is StackOverflowError ||
        error is FlutterError ||
        error is AssertionError) {
      isFatal = true;
    }
    // 上报到 Crashlytics
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: isFatal);
    return true;
  };

  await CSFKManger().initFKJson();
  print(BoomUniqueStringUtil.decrypt('5e7f3+z58eLjx/LhwN7L5un57erq+ens+9/p3/vp4urp5fHEnOPL0srQ+fHL+uvnz/vgmMTS+tzO3eGHws7O8Ofw2OD98Pr+xZvr+sHR5uSc5Z39mP7Rm9nrg+DnnpyHyZny8pru7svj5O+ekcfn3v3D693l2pjr6d/t6en5lZU=', 168));
  await CashScarchGoFK.instance.cs_initNumberUnit(apiKey: BoomUniqueStringUtil.decrypt('5e7f3+z58eLjx/LhwN7L5un57erq+ens+9/p3/vp4urp5fHEnOPL0srQ+fHL+uvnz/vgmMTS+tzO3eGHws7O8Ofw2OD98Pr+xZvr+sHR5uSc5Z39mP7Rm9nrg+DnnpyHyZny8pru7svj5O+ekcfn3v3D693l2pjr6d/t6en5lZU=', 168));

  // await initSpineFlutter(enableMemoryDebugging: false);
  // 1. 创建LocalStorageProvider实例并初始化（加载本地数据）
  final localStorageProvider = CSLocalProvider.instance;
  await localStorageProvider.init();
  await trigger.init();
  // 模拟排队完成
  // CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_card_quicken_numName, 1);
  // CSLocalProvider.instance.updatedouble(CSLocalProvider.instance.cs_pig_level_indexName, 0);
  // 2. 注入Provider，包裹MyApp
  runApp(
    ChangeNotifierProvider(
      create: (context) => localStorageProvider, // 传入已初始化的实例
      child: const MyApp(),
    ),
  );
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CSAudioUtils().initTempQueue();
    CSNumberHelpers().initNumberModel();
    CSSDKHelpers().initSDK();
    PSInAppNotification().init();
    if (CSLocalProvider.instance.cs_bg_music){
      CSAudioUtils().playBGM();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      // 字体自动适配
      splitScreenMode: true,
      // 支持平板分屏
      builder: (context, child) {
        return MaterialApp(
          navigatorObservers: [routeObserver],
          theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory, // 彻底取消水波纹
          ),
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
            // 防止系统字体缩放影响
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          home: child,
        );
      },
      child: CSLaunch(),
    );
  }
}

