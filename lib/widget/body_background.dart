import '/config/global_color.dart';
import 'package:flutter/material.dart';

class BodyCustom extends StatelessWidget {
  const BodyCustom(
      {super.key,
      required this.child,
      this.edgeInsetsPadding,
      required this.isShowBgImages,
      this.appbar,
      this.bottomNavigationBar});
  final Widget child;
  final EdgeInsets? edgeInsetsPadding;
  final bool isShowBgImages;
  final PreferredSizeWidget? appbar;
  final Widget? bottomNavigationBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      appBar: appbar,
      backgroundColor: isShowBgImages ? Colors.transparent : GlobalColors.bg1,
      body: Container(
          padding: edgeInsetsPadding,
          height: double.infinity,
          width: double.infinity,
          decoration: isShowBgImages
              ? const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg.png"),
                      fit: BoxFit.cover))
              : null,
          child: child),
    );
  }
}
