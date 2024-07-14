import 'package:employee_manager_app/export.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    _loadImage();
    await Future.delayed(const Duration(seconds: 3));
    Get.toNamed(RouteName.home);
    super.onInit();
  }

  Future<void> _loadImage() async {
    await precacheImage(
        const AssetImage('assets/images/app_logo.png'), Get.context!);
    await precacheImage(
        const AssetImage('assets/images/background.jpg'), Get.context!);
    await precacheImage(
        const AssetImage('assets/images/data_icon.png'), Get.context!);
  }
}
