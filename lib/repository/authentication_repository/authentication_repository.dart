import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ientrance/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:ientrance/screens/HomeScreen.dart';
import 'package:ientrance/screens/LoginScreen.dart';
import 'package:ientrance/screens/OnboardingScreen.dart';
import 'package:ientrance/screens/SignupScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variable realted to firebase
// firbase Authentication
//user
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  Future<void> _setInitialScreen(User? user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool cameFromHomeScreen = prefs.getBool('cameFromHomeScreen') ?? false;

    if (user == null) {
      // User is null, check if coming from home screen
      if (cameFromHomeScreen) {
        Get.offAll(() => LoginScreen());
      } else {
        Get.offAll(() => SignupScreen());
      }
    } else {
      // User is not null, set cameFromHomeScreen to true and go to home screen
      Get.offAll(() => HomeScreen(title: "Welcome"));
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => HomeScreen(title: "Welcome"))
          : Get.to(() => SignupScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> signInUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => HomeScreen(title: "Welcome"))
          : Get.to(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> logOut() async => await _auth.signOut();
}
