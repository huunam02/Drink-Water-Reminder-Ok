import 'package:get/get.dart';

class CreateDrinkController {
  RxDouble waterLevel = 0.12.obs;

  void setWaterLevel(double val) {
    waterLevel.value = val;
  }

  
}
