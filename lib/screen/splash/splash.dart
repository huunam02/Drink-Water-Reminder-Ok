import 'dart:async';
import '/screen/navbar/navbar.dart';
import '/util/preferences_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/config/global_color.dart';
import 'package:flutter/material.dart';
import '/config/global_text_style.dart';
import '/screen/languege/language.dart';
import '/widget/body_background.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //EventLog.logEvent("splash_open");
    Future.delayed(
      2.seconds,
      () => handleNavigateLanguage(),
    );
  }

  void handleNavigateLanguage() {
    if (PreferencesUtil.getFirstTime() == false) {
      Get.offAll(const NavbarScreen());
      return;
    }

    Get.offAll(const LanguageScreen(
      isSetting: false,
    ));
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: false,
      child: BodyCustom(
        isShowBgImages: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 160.w,
                    height: 160.w,
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  30.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Drink Water Reminder",
                      style: GlobalTextStyles.font32w700ColorWhite
                          .copyWith(fontSize: 24, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment(0, 0.94),
              child: Container(
                width: w * 0.66,
                height: 60.w,
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(63.0),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    color: GlobalColors.linearPrimary2.colors.last,
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
