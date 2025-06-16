library permission;

//import 'package:amazic_ads_flutter/admob_ads_flutter.dart';
import '/config/global_color.dart';
import '/config/global_text_style.dart';
import '/screen/base/lifecycle_state.dart';
import '/screen/daily_goal/daily_goal_screen.dart';
import '/util/ads_manager.dart';
import '/widget/body_background.dart';

import '/screen/permission/permission_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_switch/flutter_switch.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => PermissionScreenState();
}

class PermissionScreenState extends LifecycleState<PermissionScreen> {
  @override
  void initState() {
    super.initState();
    permissionCtl.checkPermission(false);
  }

  final permissionCtl = Get.find<PermissionController>();

  @override
  Widget build(BuildContext context) {
    return BodyCustom(
      isShowBgImages: false,
      child: Column(
        children: [
          const SizedBox(
            height: 16.0,
          ),
          Text("Permission",
              textAlign: TextAlign.center,
              style: GlobalTextStyles.font20w600ColorWhite),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 30),
                  Image.asset(
                    "assets/images/permission.png",
                    width: 121.7,
                    height: 160,
                  ),
                  SizedBox(height: 7),
                  Text("This app needs permissions belowto work properly",
                      textAlign: TextAlign.center,
                      style: GlobalTextStyles.font14w400ColorWhite),
                  SizedBox(height: 16),
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: GlobalColors.container1,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Allow Access",
                              style: GlobalTextStyles.font14w600ColorWhite),
                          Obx(
                            () => FlutterSwitch(
                              activeColor: GlobalColors.colorLastLinear,
                              inactiveColor: const Color(0xFF8E8E93),
                              width: 48.0,
                              height: 24.0,
                              valueFontSize: 20.0,
                              toggleSize: 20.0,
                              value: permissionCtl.isToggled.value,
                              //disabled: !isClickEnableSwitch,
                              borderRadius: 30.0,
                              padding: 4,
                              onToggle: (val) {
                                //   EventLog.logEvent("allow_per_click", null);
                                permissionCtl.requestAllPermission();
                                // checkAllowPermission();
                                // widget.onTapSwitch?.call();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GestureDetector(
                      onTap: () {
                        // EventLog.logEvent("continue_click", null);

                        Get.offAll(const DailyGoalScreen());
                      },
                      child: Center(
                        child: Text("Continue",
                            style: GlobalTextStyles.font16w600ColorWhite),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SizedBox(
            height: AdsManager.largeNativeAdHeight,
          )
          // NativeAds(
          //   factoryId: "native_welcome",
          //   listId: NetworkRequest.instance.getListIDByName("native_welcome"),
          //   height: AdsManager.largeNativeAdHeight,
          //   config: RemoteConfig.configs[RemoteConfigKey.native_welcome.name],
          //   visibilityDetectorKey: "native_welcome",
          // ),
        ],
      ),
    );
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onKeyboardHint() {
    // TODO: implement onKeyboardHint
  }

  @override
  void onKeyboardShow() {
    // TODO: implement onKeyboardShow
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    permissionCtl.checkPermission(true);
  }
}
