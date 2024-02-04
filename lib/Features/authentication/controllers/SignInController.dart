import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  //Calling this from the design rest will be done by it
  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .signInUserWithEmailAndPassword(email, password);
  }
}
