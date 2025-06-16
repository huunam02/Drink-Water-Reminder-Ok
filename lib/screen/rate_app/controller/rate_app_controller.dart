part of '../rate_app.dart';

class RateAppController extends GetxController implements GetxService {
  var countRate = 5.obs;
  final InAppReview inAppReview = InAppReview.instance;

  void rate(int index) {
    countRate.value = index + 1;
  }

  void onSubmit() {
    PreferencesUtil.saveCanRate();
    if (countRate.value >= 4) {
      showInAppReview();
      Get.back();
    } else {
      Fluttertoast.showToast(
          msg: L.thankYouRate.tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
      Get.back();
    }
    //EventLog.logEvent("rate_submit", parameters: {
    //  "rate_star": "${countRate.value}_star",
 //   });
  }

  void showInAppReview() async {
    const url =
        "https://play.google.com/store/apps/details?id=${GlobalConst.kPackageName}";
    if (await inAppReview.isAvailable()) {
      await inAppReview.requestReview();
    } else {
      if (await canLaunchUrlString(url)) {
        //     AdmobAds.instance.appLifecycleReactor?.setIsExcludeScreen(true);
        await launchUrlString(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
