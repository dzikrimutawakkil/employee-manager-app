import 'dart:developer';

import 'package:employee_manager_app/modules/home/widget/edit_dialog.dart';

import '../../../export.dart';

class HomeController extends GetxController {
  RxInt page = 1.obs;
  RxList<User> allUser = <User>[].obs;
  RxBool isLoading = true.obs;
  RxInt totalPage = 1.obs;
  RxInt totalMember = 0.obs;

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  void getUser() async {
    ApiResponse response = ApiResponse();
    isLoading.value = true;
    response = await UserServices().getUserByPage(page.value);
    if (response.isResponseSuccess()) {
      log('response success');
      log(response.data!.toString());
      allUser.clear();
      ListUsers data =
          ListUsers.fromJson(response.data as Map<String, dynamic>);
      totalMember.value = data.total;
      totalPage.value = data.totalPages;
      for (User element in data.users) {
        allUser.add(element);
      }
      await Future.delayed(const Duration(seconds: 2));
      isLoading.value = false;
    } else {
      log(response.error!);
      MySnackbar.failed(message: "Failed to Load Data");
      await Future.delayed(const Duration(seconds: 5));
      getUser();
    }
  }

  void addUser(User user) async {
    getUser();
    ApiResponse response = ApiResponse();
    isLoading.value = true;
    response = await UserServices().createUser(user);
    if (response.isResponseSuccess()) {
      log("response success : ${response.data!}");
      allUser.insert(0, user);
      totalMember.value++;
      clearAll();
      MySnackbar.success(
          message: "Success Added ${'${user.firstName} ${user.lastName}'}");
    } else {
      log(response.error!);
      MySnackbar.failed(message: "Failed to Add User");
    }
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
  }

  void showInputDialog(BuildContext context) {
    User dummyUser = User(
      id: 0,
      email: "",
      firstName: "",
      lastName: "",
      avatar: "https://reqres.in/img/faces/11-image.jpg",
    );
    log("asli : ${allUser[0].firstName}");
    log("dummy : ${dummyUser.firstName}");
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddDialog(
          formKey: formKey,
          firstName: firstName,
          lastName: lastName,
          email: email,
          onSubmit: () {
            if (formKey.currentState!.validate()) {
              dummyUser.firstName = firstName.text;
              dummyUser.lastName = lastName.text;
              dummyUser.email = email.text;
              addUser(dummyUser);
              Get.back();
            }
          },
        );
      },
    );
  }

  void clearAll() {
    firstName.clear();
    lastName.clear();
    email.clear();
  }
}
