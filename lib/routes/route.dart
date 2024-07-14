import '../export.dart';

class AppPages {
  static const initial = RouteName.splash;
  static final pages = [
    GetPage(
      name: RouteName.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RouteName.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RouteName.detail,
      page: () => const DetailPage(),
      binding: DetailBinding(),
    ),
  ];
}
