import 'dart:io';

class User {
  String firstName;
  String lastName;
  String email;
  String nationalID;
  String phone;
  String password;
  String confirmPassword;
  String city;
  String gender;
  String address;
  File? frontNationalID;  // ✅ تغييرها إلى File?
  File? backNationalID;   // ✅ تغييرها إلى File?

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.nationalID,
    required this.phone,
    required this.password,
    required this.confirmPassword,
    required this.city,
    required this.gender,
    required this.address,
    this.frontNationalID,
    this.backNationalID,
  });

  /// 🔹 تحويل كائن `User` إلى `Map<String, dynamic>` (لإرساله إلى API)
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'nationalID': nationalID,
      'phone': phone,
      'password': password,
      'confirmPassword': confirmPassword,
      'city': city,
      'gender': gender,
      'address': address,
      'frontNationalID': frontNationalID?.path,  // ✅ إرسال مسار الصورة بدلاً من الملف
      'backNationalID': backNationalID?.path,    // ✅ إرسال مسار الصورة بدلاً من الملف
    };
  }

  /// 🔹 تحويل `Map<String, dynamic>` إلى `User`
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      nationalID: json['nationalID'],
      phone: json['phone'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
      city: json['city'],
      gender: json['gender'],
      address: json['address'],
      frontNationalID: json['frontNationalID'] != null ? File(json['frontNationalID']) : null,
      backNationalID: json['backNationalID'] != null ? File(json['backNationalID']) : null,
    );
  }
}
