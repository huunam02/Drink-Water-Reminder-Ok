library;

import '/config/global_color.dart';
import '/config/global_const.dart';
import '/config/global_text_style.dart';
import '/lang/l.dart';
import '/util/preferences_util.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher_string.dart';
part "controller/rate_app_controller.dart";
part 'widget/custom_shape.dart';

class SettingsRate extends GetWidget<RateAppController> {
  const SettingsRate({super.key});

  @override
  Widget build(BuildContext context) {
    controller.countRate.value = 5;
    Widget buildAction() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(8),
          ),
        ),
        child: SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (PreferencesUtil.getCanRate())
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                      //EventLog.logEvent("rate_not_now");
                    },
                    child: Text(
                      L.notNow.tr,
                      textAlign: TextAlign.center,
                      style: GlobalTextStyles.font14w600ColorWhiteOp60,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => controller.onSubmit(),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        GlobalColors.colorLastLinear),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Text(
                    L.submit.tr,
                    textAlign: TextAlign.center,
                    style: GlobalTextStyles.font14w600ColorWhite,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Dialog(
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
            color: GlobalColors.container2,
            borderRadius: BorderRadius.circular(8.0)),
        padding: const EdgeInsets.symmetric(horizontal: 7),
        width: 266,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 110,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomClipPath(),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/images/img_rate.png",
                      width: 98.0,
                      height: 98.0,
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  child: Column(
                    children: [
                      Text(
                        L.rateTitle.tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(L.rateDesc.tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => controller.rate(index),
                          child: Obx(
                            () => Icon(
                              controller.countRate.value > index
                                  ? Icons.star
                                  : Icons.star_border_outlined,
                              color: controller.countRate.value > index
                                  ? const Color(0xFFFFB400)
                                  : null,
                              size: 24,
                            ),
                          ),
                        ),
                        itemCount: 5,
                      ),
                    ],
                  ),
                ),
                buildAction(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
