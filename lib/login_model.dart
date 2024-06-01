// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    String id;
    String firstName;
    String secondName;
    String email;
    String studentid;
    String password;
    String createdBy;

    LoginModel({
        required this.id,
        required this.firstName,
        required this.secondName,
        required this.email,
        required this.studentid,
        required this.password,
        required this.createdBy,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json["Id"],
        firstName: json["FirstName"],
        secondName: json["SecondName"],
        email: json["Email"],
        studentid: json["Studentid"],
        password: json["password"],
        createdBy: json["created_by"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "FirstName": firstName,
        "SecondName": secondName,
        "Email": email,
        "Studentid": studentid,
        "password": password,
        "created_by": createdBy,
    };
}
