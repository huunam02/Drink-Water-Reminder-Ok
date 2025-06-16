import '/screen/splash/splash.dart';
import '/config/global_const.dart';
import '/screen/languege/controller/languege_controller.dart';
import '/util/language_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dependecy_injection.dart' as dependecy_injection;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'service/notification.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependecy_injection.init();
  _hideSystemUI();
  var permissionNoti = await Permission.notification.status;
  if (permissionNoti.isGranted) {
    await NotificationService.init();
  }
  tz.initializeTimeZones();
  runApp(const MyApp());
}

void _hideSystemUI() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      systemStatusBarContrastEnforced: true,
    ),
  );
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  SystemChrome.setSystemUIChangeCallback((systemOverlaysAreVisible) async {
    if (systemOverlaysAreVisible) {
      await Future.delayed(const Duration(seconds: 3));
      SystemChrome.restoreSystemUIOverlays();
    }
  });
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final languageCtl = Get.find<LanguageController>();
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          translations: LanguageUtils(),
          locale: Locale(languageCtl.currentLang.value),
          fallbackLocale: const Locale('en'),
          debugShowCheckedModeBanner: false,
          title: GlobalConst.kAppName,
          supportedLocales: GlobalConst.supportedLocales,
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          home: SplashScreen(),
        );
      },
    );
  }
}
