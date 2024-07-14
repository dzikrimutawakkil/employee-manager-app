import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../export.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color(0xfff8ade8),
                  Color(0xffeeedf2),
                  Color(0xff94b6f5),
                ],
                center: Alignment.topLeft,
                radius: 2.1,
              ),
            ),
          ),
          const Center(
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                ),
                Image(
                  image: AssetImage("assets/images/app_logo.png"),
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  height: 75,
                ),
                SpinKitDualRing(
                  color: Colors.black87,
                  size: 50,
                ),
                Spacer(),
                Text(
                  "v1.0.0",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
