import '../../../export.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Obx(
                () => ListView(
                  children: [
                    SizedBox(
                      width: Get.width,
                      height: Get.height * 0.3,
                      child: Stack(
                        children: [
                          Container(
                            width: Get.width,
                            height: Get.height * 0.3,
                            margin: EdgeInsets.only(top: Get.height * 0.07),
                            padding: EdgeInsets.fromLTRB(
                                10, 10, Get.width * 0.4, 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              gradient: RadialGradient(colors: [
                                const Color.fromARGB(255, 161, 83, 212),
                                Colors.blue.shade200,
                              ], center: Alignment.topLeft, radius: 2.5),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Employee\nDashboard",
                                    style: TextStyle(
                                      height: 1.2,
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  RichText(
                                    text: TextSpan(
                                        text: controller.totalMember.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        children: const [
                                          TextSpan(
                                            text: " active employee",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset(
                                "assets/images/data_icon.png",
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Your Employee Database",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    controller.isLoading.isFalse
                        ? SizedBox(
                            width: Get.width,
                            height: (Get.height * 0.252) *
                                (controller.allUser.length / 2).ceil(),
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                crossAxisSpacing: 8.0,
                                mainAxisSpacing: 8.0,
                              ),
                              itemCount: controller.allUser.length,
                              itemBuilder: (context, index) {
                                return UserCard(
                                    user: controller.allUser[index]);
                              },
                            ),
                          )
                        : SizedBox(
                            width: Get.width,
                            height: (Get.height * 0.252) * 3,
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                crossAxisSpacing: 8.0,
                                mainAxisSpacing: 8.0,
                              ),
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return const LoadingCard();
                              },
                            ),
                          ),
                    const SizedBox(height: 10),
                    (controller.totalPage > 1)
                        ? Center(
                            child: Pagination(),
                          )
                        : const SizedBox(),
                    const SizedBox(height: 30)
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () => controller.showInputDialog(context),
                child: Container(
                  margin: const EdgeInsets.all(30),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: primaryColor.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 4,
                        offset: const Offset(1, 2)),
                  ], color: primaryColor, shape: BoxShape.circle),
                  child: Icon(
                    Icons.person_add_alt_1,
                    size: 24,
                    color: Colors.grey.shade100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
