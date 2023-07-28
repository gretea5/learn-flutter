import 'package:flutter/material.dart';
import 'package:responsive_lec2/responsive/desktop_body.dart';
import 'package:responsive_lec2/responsive/mobile_body.dart';
import 'package:responsive_lec2/responsive/responsive_layout.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileBody(),
        desktopBody: DesktopBody(),
      ),
    );
  }
}
