import 'package:dio/dio.dart';

class SignupRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final String image;

  SignupRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.image,
  });

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'password': password,
      'image': await MultipartFile.fromFile(
        image,
        filename: image.split('/').last,
      ),
    });
  }
}
