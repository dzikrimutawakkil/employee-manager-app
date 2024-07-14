import 'dart:convert';
import 'models.dart';

class ListUsers {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<User> users;

  ListUsers({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.users,
  });

  factory ListUsers.fromRawJson(String str) =>
      ListUsers.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListUsers.fromJson(Map<String, dynamic> json) => ListUsers(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        users: List<User>.from(json["data"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}
