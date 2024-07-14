import 'package:employee_manager_app/export.dart';

class UserServices extends MyCustomHttpRequest {
  Future<ApiResponse> getUserByPage(int page) {
    return sendRequest(
      url: "https://reqres.in/api/users?page=$page",
      method: ReqMethod.getMethod,
    );
  }

  Future<ApiResponse> editUser(User user) {
    return sendRequest(
        url: "https://reqres.in/api/users/${user.id}",
        method: ReqMethod.putMethod,
        body: {
          "first_name": user.firstName,
          "last_name": user.lastName,
          "email": user.email
        });
  }

  Future<ApiResponse> deleteUser(int id) {
    return sendRequest(
      url: "https://reqres.in/api/users/$id",
      method: ReqMethod.deleteMethod,
    );
  }

  Future<ApiResponse> createUser(User user) {
    return sendRequest(
      url: "https://reqres.in/api/users",
      method: ReqMethod.postMethod,
      body: {
        "first_name": user.firstName,
        "last_name": user.lastName,
        "email": user.email,
        "avatar": user.avatar
      },
    );
  }
}
