import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(milliseconds: 3000), () {
      Get.offAllNamed("/login");
    });
  }
}