import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField controllers to get the data from TextFields
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  // calling this function from the design and
  //Rest will be done by the this
  void registerUser(String email, String password) {}
}
