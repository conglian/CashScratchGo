import 'dart:async';
import 'dart:math';
import 'package:cashscratchgo/CSTool/CSNumberHelpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../CSBasic/CSTabBar.dart';
import 'CSTBAEventTool.dart';
import 'CS_extension_help.dart';
import 'cs_img.dart';
import 'cs_text.dart';

class PSInAppNotification {
  static final PSInAppNotification _instance = PSInAppNotification._internal();
  factory PSInAppNotification() => _instance;
  PSInAppNotification._internal();

  OverlayEntry? _overlayEntry;
  Timer? _timer;
  bool _isShowing = false;
  final Random _random = Random();

  // 可随机金额列表
  final List<int> _amounts = [1000, 1200, 1500, 2000];

  // 文案模板列表，使用 {amount} 占位符
  final List<Map<String, String>> _messages = [
    {'title': '🎉 PayPal Payout Success', 'content': 'Mary received \${amount} via PayPal successfully 💰'},
    {'title': '💸 Cash Out Completed', 'content': 'James just cashed out \${amount} to PayPal ✅'},
    {'title': '🎯 Another Winner Paid', 'content': 'Linda received \${amount} in her PayPal account'},
    {'title': '💰 Big Payout Alert', 'content': 'Robert successfully withdrew \${amount} via PayPal'},
    {'title': '🎉 Withdrawal Sent', 'content': 'Sarah just received \${amount} {amount} through PayPal'},
    {'title': '💸 PayPal Transfer Done', 'content': 'Michael cashed out \${amount} {amount} successfully'},
    {'title': '🎯 Cash Out Success', 'content': 'Emily received \${amount} via PayPal'},
    {'title': '💰 Winner Notification', 'content': 'David just withdrew \${amount}  to PayPal'},
    {'title': '🎉 Payout Completed', 'content': 'Jessica received \${amount}  in her PayPal wallet'},
    {'title': '💸 Real Cash Paid', 'content': 'Chris successfully cashed out \${amount}  via PayPal'},
    {'title': '🎯 PayPal Reward Sent', 'content': 'Amanda received \${amount} successfully'},
    {'title': '💰 Cash Out Confirmed', 'content': 'Daniel just received \${amount}  via PayPal'},
    {'title': '🎉 Lucky Player Paid', 'content': 'Laura cashed out \${amount}  successfully'},
    {'title': '💸 Withdrawal Success', 'content': 'Kevin received \${amount}  through PayPal'},
    {'title': '🎯 Another PayPal Payout', 'content': 'Nicole just withdrew \${amount}'},
    {'title': '💰 Big Win Delivered', 'content': 'Brian received \${amount}  via PayPal 🎰'},
    {'title': '🎉 Cash Out Alert', 'content': 'Rachel successfully received \${amount}'},
    {'title': '💸 Reward Sent', 'content': 'Jason cashed out \${amount} 0 via PayPal'},
    {'title': '🎯 Payout Completed', 'content': 'Olivia received \${amount}  successfully'},
    {'title': '💰 PayPal Cash Out', 'content': 'Andrew just received \${amount} in PayPal'},
  ];

  int _currentIndex = 0;

  /// 初始化计时器
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('first_launch') ?? true;

    if (isFirstLaunch) {
      prefs.setBool('first_launch', false);
      _startTimer(_random.nextInt(2) + 1); // 测试用 1~2 分钟
    } else {
      _startTimer(_random.nextInt(6) + 5); // 5~10 分钟
    }
  }

  void _startTimer(int minutes) {
    _timer?.cancel();
    _timer = Timer(Duration(minutes: minutes), () {
      final msg = _messages[_currentIndex];

      // 随机金额替换 {amount} 占位符
      final amount = _amounts[_random.nextInt(_amounts.length)];
      final content = msg['content']!.replaceAll('{amount}', amount.toString());

      _showNotification(msg['title']!, content);

      // 下一个索引循环
      _currentIndex = (_currentIndex + 1) % _messages.length;

      // 下一条 5~10 分钟
      _startTimer(_random.nextInt(6) + 5);
    });
  }

  void dispose() {
    _timer?.cancel();
    _overlayEntry?.remove();
  }

  void _showNotification(String title, String content) {
    cs_event_fire('push_appin_p', {});

    if (_isShowing) return;
    _isShowing = true;
    Random random = Random();
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return _NotificationWidget(
          title: title,
          content: content,
          row: random.nextInt(20),
          onComplete: () {
            _overlayEntry?.remove();
            _overlayEntry = null;
            _isShowing = false;
          },
        );
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = homeKey.currentContext;
      if (context != null) {
        Overlay.of(context)?.insert(_overlayEntry!);
      } else {
        _isShowing = false;
      }
    });
  }
}

// --- Notification Widget ---

class _NotificationWidget extends StatefulWidget {
  final String title;
  final String content;
  final int row;
  final VoidCallback onComplete;
  const _NotificationWidget({required this.title, required this.content, required this.onComplete, required this.row});

  @override
  State<_NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<_NotificationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _animation = Tween<double>(begin: -104, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) _controller.reverse();
        });
      } else if (status == AnimationStatus.dismissed) {
        widget.onComplete();
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
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _animation.value),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 104,
              child: Stack(
                children: [
                  Positioned(
                    top: 28.h,
                    left: (0.width(context) - 328) * 0.5,
                    width: 328,
                    height: 84,
                    child: Container(
                      width: 328,
                      height: 84,
                      decoration: BoxDecoration(
                        color: '#FFFFFF'.color(),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 12.w),
                          CSImg(
                            name: 'cs_jie_user_${widget.row}',
                            width: 60,
                            height: 60,
                          ),
                          SizedBox(width: 8.w),
                          SizedBox(
                            width: 236,
                            height: 84,
                            child: Column(
                              children: [
                                SizedBox(height: 12),
                                CSText(
                                  text: widget.title,
                                  size: 16,
                                  color: '#000000'.color(),
                                  weight: FontWeight.w900,
                                  align: TextAlign.left,
                                ),
                                SizedBox(height: 4),
                                CSText(
                                  text: widget.content,
                                  size: 12,
                                  color: '#4A4A4A'.color(),
                                  weight: FontWeight.w500,
                                  maxLines: 3,
                                  align: TextAlign.left,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}