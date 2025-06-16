import '/config/global_color.dart';
import '/widget/appbar_base.dart';
import '/widget/gradient_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/widget/body_background.dart';
import '/base/lifecycle_state.dart';
import '/config/global_text_style.dart';
import '/lang/l.dart';
import '/model/languege.dart';
import '/screen/languege/controller/languege_controller.dart';
import '/screen/languege/widget/item_languege.dart';
import '/screen/oboarding/onboarding.dart';
import '/util/preferences_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key, required this.isSetting});
  final bool isSetting;
  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends LifecycleState<LanguageScreen> {
  final langCtl = Get.find<LanguageController>();
  // final navtiveKeyAd = GlobalKey<NativeAdsState>();
  @override
  void initState() {
    super.initState();
    //EventLog.logEvent("language_fo_open");
    langCtl.checkLanguege();
  }

  @override
  Widget build(BuildContext context) {
    return BodyCustom(
      isShowBgImages: false,
      appbar: AppbarBase(
        title: _buildTitle(),
        leading: _buildLeadingButton(),
        actions: _buildAction,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
              child: Obx(
            () => ListView.builder(
              itemCount: langCtl.listLanguege.length,
              itemBuilder: (context, index) {
                Languege languege = langCtl.listLanguege[index];
                return Obx(
                  () => ItemLanguege(
                    onTap: () {
                      //.     navtiveKeyAd.currentState?.reloadNativeNow();
                      langCtl.isClickLang.value = true;
                      langCtl.selectLanguage(index);
                    },
                    language: languege.name,
                    imagePath: languege.image,
                    isSelected: (langCtl.isClickLang.value ||
                                PreferencesUtil.isSelectFirstLanguage()) &&
                            langCtl.selectedLanguageIndex.value == index
                        ? true
                        : false,
                  ),
                );
              },
            ),
          )),
          // widget.isSetting
          //     ? BannerAds(
          //         reloadResume: true,
          //         type: AdsBannerType.adaptive,
          //         config:
          //             RemoteConfig.configs[RemoteConfigKey.banner_all.name],
          //         listId:
          //             NetworkRequest.instance.getListIDByName('banner_all'),
          //         visibilityDetectorKey: 'banner_all',
          //       )
          //     : NativeAds(
          //         reloadResume: true,
          //         key: navtiveKeyAd,
          //         factoryId: "native_language",
          //         listId: NetworkRequest.instance
          //             .getListIDByName('native_language'),
          //         height: AdsManager.largeNativeAdHeight,
          //         config: RemoteConfig
          //             .configs[RemoteConfigKey.native_lang.name],
          //         visibilityDetectorKey: 'native_language',
          //         onAdFailedToLoad:
          //             (adNetwork, adUnitType, data, errorMessage) {
          //           debugPrint("onAdFailedToLoad $errorMessage");
          //         },
          //       )
        ],
      ),
    );
  }

  List<Widget> get _buildAction {
    return [
      GestureDetector(
        onTap: () {
          if (langCtl.isClickLang.value ||
              PreferencesUtil.isSelectFirstLanguage()) {
            if (widget.isSetting) {
              Get.back();
              langCtl.saveLanguage();
            } else {
              // EventLog.logEvent("language_fo_save_click",
              //     parameters: {
              //       "language_name": langCtl.currentLang.value
              //     });
              langCtl.saveLanguage();
              Get.offAll(() => const OnboardingScreen());
            }
          }
        },
        child: Obx(
          () => SvgPicture.asset(
            "assets/icons/ic_check.svg",
            width: 28.0,
            height: 28.0,
            color: langCtl.isClickLang.value ||
                    PreferencesUtil.isSelectFirstLanguage()
                ? null
                : Colors.white.withOpacity(0),
          ),
        ),
      ),
      16.horizontalSpace
    ];
  }

  GradientText _buildTitle() {
    return GradientText(
      L.language.tr,
      style: GlobalTextStyles.font18w700ColorBlack,
      gradient: GlobalColors.linearPrimary2,
    );
  }

  Center _buildLeadingButton() {
    return Center(
      child: SizedBox(
        height: 24.0,
        width: 24.0,
        child: widget.isSetting
            ? GestureDetector(
                onTap: () => Get.back(),
                child: SvgPicture.asset(
                  "assets/icons/back.svg",
                  fit: BoxFit.cover,
                  color: Colors.black,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {
    //   langCtl.checkLanguege();
    //navtiveKeyAd.currentState?.reloadNativeNow();
  }

  @override
  void onKeyboardHint() {}

  @override
  void onKeyboardShow() {}
}
