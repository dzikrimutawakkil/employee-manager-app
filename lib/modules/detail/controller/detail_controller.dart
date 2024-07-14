import 'dart:developer';

import 'package:employee_manager_app/export.dart';

class DetailController extends GetxController {
  late User user;
  RxBool isLoading = false.obs;
  RxList<User> get allUser => Get.find<HomeController>().allUser;
  RxInt get totalUser => Get.find<HomeController>().totalMember;
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxInt edited = 1.obs;

  @override
  void onInit() {
    getArguments();
    super.onInit();
  }

  void getArguments() {
    if (Get.arguments != null) user = Get.arguments as User;
  }

  void deleteUser() async {
    ApiResponse response = ApiResponse();
    isLoading.value = true;
    response = await UserServices().deleteUser(user.id);
    if (response.isResponseSuccess()) {
      int indexDelete = allUser.indexWhere((u) => u.id == user.id);
      allUser.removeAt(indexDelete);
      log('response success');
      log(response.data!.toString());
      MySnackbar.success(
          message: "Success to delete ${user.firstName} ${user.lastName}");
      totalUser.value--;
      await Future.delayed(const Duration(seconds: 2));
      Get.back();
    } else {
      log("error : ${response.error!}");
      MySnackbar.failed(
          message: "Failed to delete ${user.firstName} ${user.lastName}");
    }
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
  }

  void editUser(User editedUser) async {
    ApiResponse response = ApiResponse();
    isLoading.value = true;
    response = await UserServices().editUser(editedUser);
    if (response.isResponseSuccess()) {
      int indexEdit = allUser.indexWhere((u) => u.id == user.id);
      allUser[indexEdit] = editedUser;
      user = editedUser;
      edited++;
      log('response success');
      log(response.data!.toString());
      MySnackbar.success(
          message: "Success to edit ${user.firstName} ${user.lastName}");
      await Future.delayed(const Duration(seconds: 2));
    } else {
      log("error : ${response.error!}");
      MySnackbar.failed(
          message: "Failed to edit ${user.firstName} ${user.lastName}");
    }
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
  }

  void showInputDialog(BuildContext context) {
    User dummyUser = user;
    firstName.text = user.firstName;
    lastName.text = user.lastName;
    email.text = user.email;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditDialog(
          formKey: formKey,
          firstName: firstName,
          lastName: lastName,
          email: email,
          onSubmit: () {
            if (formKey.currentState!.validate()) {
              dummyUser.firstName = firstName.text;
              dummyUser.lastName = lastName.text;
              dummyUser.email = email.text;
              editUser(dummyUser);
              Get.back();
            }
          },
        );
      },
    );
  }
}
