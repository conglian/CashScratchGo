import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:cashscratchgo/CSBasic/CSTabBar.dart';
import 'package:cashscratchgo/CSTool/cs_GradientNumber.dart';
import 'package:cashscratchgo/CSTool/cs_extension_help.dart';
import 'package:cashscratchgo/CSTool/cs_img.dart';
import 'package:cashscratchgo/CSTool/cs_stroke_text.dart';
import 'package:cashscratchgo/CSTool/cs_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../CSDialog/CSGuideManager.dart';
import '../CSTool/cs_LocalProvider.dart';
import 'CSScratchCardVC.dart';

class CSHomeListVC extends StatefulWidget {
  const CSHomeListVC({super.key});

  @override
  State<CSHomeListVC> createState() => _CSHomeListVCState();
}

class _CSHomeListVCState extends State<CSHomeListVC> with SingleTickerProviderStateMixin {

  bool is_tap_wheel = false;

  final list = [
    "cs_scratch_list_0",
    "cs_scratch_list_1",
    "cs_scratch_list_2",
    "cs_scratch_list_3",
    "cs_scratch_list_4",
    "cs_scratch_list_5",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CSGuideManager.showStep(context);
    });
  }

  @override
  void dispose() {
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
              image: CSDImg('cs_home_bg'),
            ),
            child: Column(
              children: [
                CSNavBarWidget(),
                SizedBox(
                  width: 0.width(context),
                  height: 610,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 24.h),
                        Row(
                          mainAxisAlignment: .center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                _card(list[0], 0),
                                SizedBox(height: 8.h),
                                _card(list[1], 1),
                              ],
                            ),
                            SizedBox(width: 36.w),
                            _card(list[2], 2),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: .center,
                          children: [
                            _card(list[3], 3),
                            SizedBox(width: 8.h),
                            _card(list[4], 4),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        _card(list[5], 5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _card(String image, int row, {double height = 132}) {
    return SizedBox(
      width: row == 5 ? 328.w : row == 2 ? 132.w : 160.w, // 加宽度
      height: row == 2 ? 272.h : 132.h,
      child: _item(image, row),
    );
  }

  Widget _item(String image, int row) {
    return ParticleButton(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CSScratchCardVC(type: row),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CSImg(name: '$image', height: row == 2 ? 272 : 132, width: row == 5 ? 328.w : row == 2 ? 132.w : 160.w),
            /// 角标
            Positioned(
              top: 6,
              left: 6,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "3/10",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            /// pt标签
            Positioned(
              right: 8,
              top: 50,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "60pt",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CSNavBarWidget extends StatefulWidget {
  const CSNavBarWidget({super.key});

  @override
  State<CSNavBarWidget> createState() => _CSNavBarWidgetState();
}

class _CSNavBarWidgetState extends State<CSNavBarWidget> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {

    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

   return Consumer<CSLocalProvider>(
        builder: (context, provider, child) {
          return Container(
            width: 0.width(context),
            height: 88,
            decoration: BoxDecoration(
                image: CSDImg('cs_navbar_bg')
            ),
            child: Column(
              children: [
                SizedBox(height: 40),
                Row(
                  children: [
                    SizedBox(width: 16.w),
                    ParticleButton(child: CSImg(name: 'cs_h5_icon', width: 36, height: 36), onTap: (){

                    }),
                    SizedBox(width: 8.w),
                    ParticleButton(
                      onTap: (){
                        CashTabController.switchTo(2);
                      },
                      child: Container(
                        width: 112,
                        height: 32,
                        decoration: BoxDecoration(
                            color: '#360B09'.color(),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                width: 1,
                                color: '#5E1309'.color()
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CSImg(name: 'cs_dollar_icon', width: 28, height: 28),
                            SizedBox(width: 4),
                            CSGradientNumberRoller(
                              value: provider.cs_dolas_number,
                              duration: 1800,
                              fontSize: 16.0,
                              gradientColors: ['#FFFFFF'.color(), '#FFFFFF'.color()],
                              borderColor: Colors.transparent,
                              borderWidth: 0.0,
                              decimalPlaces: 2,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    ParticleButton(
                      onTap: (){

                      }, child: Container(
                      width: 92,
                      height: 32,
                      decoration: BoxDecoration(
                          color: '#360B09'.color(),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              width: 1,
                              color: '#5E1309'.color()
                          )
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 2, top: 2,
                            child: Container(
                              width: 86 * 0.5,
                              height: 26,
                              decoration: BoxDecoration(
                                color: '#E07000'.color(),
                                borderRadius: BorderRadius.circular(12)
                              ),
                            ),
                          ),
                          Container(
                            width: 28, height: 28,
                            decoration: BoxDecoration(
                                image: CSDImg('cs_lev_bg')
                            ),
                            child: Center(
                              child: CSText(text: '${provider.cs_Level_number}', size: 12, color: '#FFFCFA'.color(), weight: FontWeight.w700),
                            ),
                          ),
                          Positioned(
                            left: 2, top: 2,
                            child: SizedBox(
                              width: 86,
                              height: 26,
                              child: Center(
                                child: CSStrokeText(text: 'LV${provider.cs_Level_number}', size: 16, color: '#FFFFFF'.color(), weight: FontWeight.w700, skWidth: 2, skColor: '#8B4600'.color()),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                    Spacer(),
                    ParticleButton(child: CSImg(name: 'cs_setting_icon', width: 32, height: 32), onTap: (){

                    }),
                    SizedBox(width: 16.w)
                  ],
                )
              ],
            ),
          );
        }
    );
  }
}
