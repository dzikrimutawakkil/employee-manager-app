import '../../export.dart';

class MySnackbar {
  static void success({
    String? title,
    required String message,
  }) {
    _showSnackbar(
      title: "Success",
      message: message,
      icon: Icons.check,
      backgroundColor: Colors.green,
    );
  }

  static void failed({
    String? title,
    required String message,
  }) {
    _showSnackbar(
      title: "Error",
      message: message,
      icon: Icons.close,
      backgroundColor: Colors.red,
    );
  }

  static _showSnackbar({
    required String title,
    required String message,
    IconData? icon,
    Color? backgroundColor,
  }) {
    Get.closeAllSnackbars();
    return Get.snackbar(
      title,
      message,
      icon: Icon(icon, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
