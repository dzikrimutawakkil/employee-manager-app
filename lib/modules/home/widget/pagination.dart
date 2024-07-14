import 'dart:developer';
import 'dart:ui';

import '../../../export.dart';

// ignore: use_key_in_widget_constructors
class Pagination extends StatelessWidget {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        // height: Get.height * 0.05,
        height: 30,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: controller.totalPage.value,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                controller.page.value = index + 1;
                controller.getUser();
                log(controller.page.value.toString());
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.2, sigmaY: 0.2),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: controller.page.value == index + 1
                          ? primaryColor
                          : Colors.white.withOpacity(0.6),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: controller.page.value == index + 1
                              ? Colors.white
                              : primaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
