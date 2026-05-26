import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CSCashListVC extends StatefulWidget {
  const CSCashListVC({super.key});

  @override
  State<CSCashListVC> createState() => _CSCashListVCState();
}

class _CSCashListVCState extends State<CSCashListVC> with SingleTickerProviderStateMixin {
  bool is_tap_wheel = false;

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
      body: Stack(
        children: [
          Container(

          ),
        ],
      ),
    );
  }
}
