import 'package:cashscratchgo/CSTool/CSTBAEventTool.dart';
import 'package:cashscratchgo/CSTool/cs_LocalProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../CSMainVC/CSCashListVC.dart';
import '../CSMainVC/CSHomeListVC.dart';
import '../CSMainVC/CSLuckySpineVC.dart';
import '../CSTool/cs_extension_help.dart';
import '../CSTool/cs_stroke_text.dart';

class CashTabController {
  CashTabController._();

  /// 当前选中的 tab
  static final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  /// 外部切换
  static void switchTo(int index) {
    currentIndex.value = index;
  }
}
final GlobalKey<_CashBottomExampleState> homeKey = GlobalKey<_CashBottomExampleState>();

class CashBottomExample extends StatefulWidget {
  const CashBottomExample({Key? key}) : super(key: key);

  @override
  State<CashBottomExample> createState() => _CashBottomExampleState();
}

class _CashBottomExampleState extends State<CashBottomExample> {
  /// ✅ 不再自己维护 int
  final ValueNotifier<int> _indexNotifier = CashTabController.currentIndex;

  // final List<Widget> _screens = const [(), (), ()];

  final List<Widget> _screenbs = const [CSHomeListVC(), CSLuckySpineVC(), CSCashListVC()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CSLuckyWheelNotificationService.stream.listen((value) async {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      /// ✅ 只监听 index
      body: ValueListenableBuilder<int>(
        valueListenable: _indexNotifier,
        builder: (_, index, __) {
          return IndexedStack(index: index, children: _screenbs);
        },
      ),

      /// ✅ 底部栏也监听
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _indexNotifier,
        builder: (_, index, __) {
          return CustomNavBarWidget(
            [
              PersistentBottomNavBarItem(
                icon: Image.asset('cs_card_n'.image()),
                inactiveIcon: Image.asset('cs_card_s'.image()),
                title: 'CARDS',
                activeColorPrimary: Colors.transparent,
                inactiveColorPrimary: Colors.transparent,
              ),
              PersistentBottomNavBarItem(
                icon: Image.asset(CSLocalProvider.instance.cs_wheel_number <= 0 ? 'cs_wheel_lock_icon'.image() : 'cs_wheel_n'.image()),
                inactiveIcon: Image.asset('cs_wheel_s'.image()),
                title: 'LUCKY SPIN',
                activeColorPrimary: Colors.transparent,
                inactiveColorPrimary: Colors.transparent,
              ),
              PersistentBottomNavBarItem(
                icon: Image.asset('cs_tabbar_cash_n'.image()),
                inactiveIcon: Image.asset('cs_tabbar_cash_s'.image()),
                title: 'LUCKY SPIN',
                activeColorPrimary: Colors.transparent,
                inactiveColorPrimary: Colors.transparent,
              ),
            ],
            selectedIndex: index,

            /// ✅ 不再 setState
            onItemSelected: (i) {
              if (i == 1){
                cs_event_fire('wheel_c', {'source_from' : 'home'});
              } else if (i == 2){
                cs_event_fire('cash_page', {'page_from' : 'tab'});
              }
              CashTabController.switchTo(i);
            },
          );
          return CustomNavBarWidget(
            [
              PersistentBottomNavBarItem(
                icon: Image.asset('ps_home_icon'.image()),
                inactiveIcon: Image.asset('ps_home_icon'.image()),
                title: 'Piggy',
                activeColorPrimary: Colors.transparent,
                inactiveColorPrimary: Colors.transparent,
              ),
              PersistentBottomNavBarItem(
                icon: Image.asset('ps_quiz_icon'.image()),
                inactiveIcon: Image.asset('ps_quiz_icon'.image()),
                title: 'Quiz',
                activeColorPrimary: Colors.transparent,
                inactiveColorPrimary: Colors.transparent,
              ),
              PersistentBottomNavBarItem(
                icon: Image.asset('ps_wheel_icon'.image()),
                inactiveIcon: Image.asset('ps_wheel_icon'.image()),
                title: 'Wheel',
                activeColorPrimary: Colors.transparent,
                inactiveColorPrimary: Colors.transparent,
              ),
            ],
            selectedIndex: index,

            /// ✅ 不再 setState
            onItemSelected: (i) {
               CashTabController.switchTo(i);
            },
          );
        },
      ),
    );
  }
}

class CustomNavBarWidget extends StatefulWidget {
  const CustomNavBarWidget(
      this.items, {
        required this.selectedIndex,
        required this.onItemSelected,
        Key? key,
      }) : super(key: key);

  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  @override
  State<CustomNavBarWidget> createState() => _CustomNavBarWidgetState();
}

class _CustomNavBarWidgetState extends State<CustomNavBarWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('cs_tabbar_bg'.image()),
          fit: BoxFit.fill,
        ),
        color: Color.fromARGB(60, 200, 20, 82)
      ),
      child: SizedBox(
        width: double.infinity,
        height: 81,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(widget.items.length, (index) {
            final item = widget.items[index];
            final bool isSelected = widget.selectedIndex == index;
            return Expanded(
              child: ParticleButton(
                onTap: () => widget.onItemSelected(index),
                child: _buildItem(item, isSelected),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return SizedBox(
      height: 81,
      child: Stack(
        clipBehavior: Clip.none, // 👈 关键
        alignment: Alignment.center,
        children: [
          /// 图标
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
            top: isSelected ? -8 : 14, // 👈 关键点
            child: AnimatedScale(
              scale: isSelected ? 1.45 : 1.0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.elasticOut,
              child: SizedBox(
                width: 44,
                height: 44,
                child: isSelected ? item.inactiveIcon : item.icon,
              ),
            ),
          ),

          /// 文字
          Positioned(
            bottom: 18,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: isSelected ? 1 : 0,
              child: CSStrokeText(
                text: item.title ?? '',
                size: 10,
                color: '#FFFAB6'.color(),
                weight: FontWeight.w400,
                skWidth: 2,
                skColor: '#FFF12E'.color(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
