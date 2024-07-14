import 'dart:ui';

import 'package:url_launcher/url_launcher.dart';
import 'package:employee_manager_app/export.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            SizedBox(
              width: Get.width,
              height: Get.height,
              child: Image.asset(
                'assets/images/background.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Obx(
              () => controller.edited > 0
                  ? ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => Get.back(),
                                child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: primaryColor,
                                  size: 24,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Detail Employee",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 24,
                              )
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(28),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8),
                            child: Container(
                              width: Get.width,
                              height: Get.width,
                              padding: const EdgeInsets.all(20.0),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(28.0),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        gradient: RadialGradient(
                                          colors: [
                                            const Color.fromARGB(
                                                    255, 100, 100, 100)
                                                .withOpacity(1),
                                            const Color.fromARGB(
                                                    255, 100, 100, 100)
                                                .withOpacity(0),
                                          ],
                                          center: Alignment.center,
                                        ),
                                        shape: BoxShape.circle),
                                    padding: const EdgeInsets.all(12),
                                    child: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(controller.user.avatar),
                                      radius: Get.width * 0.2,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    "${controller.user.firstName} ${controller.user.lastName}",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: primaryColor,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    controller.user.email,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: secondaryColor,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      actionButton(() async {
                                        final Uri emailUri = Uri(
                                          scheme: 'mailto',
                                          path: controller.user.email,
                                          queryParameters: {
                                            'subject': 'Your Subject'
                                          },
                                        );

                                        launchUrl(emailUri);

                                        if (!await launchUrl(emailUri)) {
                                          const GetSnackBar(
                                            title: "Error",
                                            message: "Can't open mail",
                                            backgroundColor: Colors.red,
                                          );
                                          throw Exception(
                                              'Could not launch $emailUri');
                                        }
                                      }, Icons.email_outlined),
                                      const SizedBox(width: 12),
                                      actionButton(
                                          () => controller
                                              .showInputDialog(context),
                                          Icons.edit_outlined),
                                      const SizedBox(width: 12),
                                      actionButton(
                                          () => controller.deleteUser(),
                                          Icons.delete_outline),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget actionButton(void Function() onPress, IconData icon) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[50]!.withOpacity(0.6),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: Get.width * 0.08,
          // color: Color.fromARGB(221, 53, 53, 53),
          color: primaryColor,
        ),
      ),
    );
  }
}
