import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_study_app/firebase_ref/references.dart';
import 'package:flutter_study_app/screens/home/home_screen.dart';
import 'package:flutter_study_app/screens/login/login_screen.dart';
import 'package:flutter_study_app/widgets/dialogs/dialog_widget.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChange;

  void initAuth() async {
    await Future.delayed(Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChange = _auth.authStateChanges();
    _authStateChange.listen((User? user) {
      _user.value = user;
    });

    navigateToIntroduction();
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _authAccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
            idToken: _authAccount.idToken,
            accessToken: _authAccount.accessToken);

        await _auth.signInWithCredential(_credential);
        await saveUser(account);
        navigateToHomePage();
      }
      // _googleSignIn.signIn();
    } on Exception catch (error) {
      // AppLogger.e(error);
      print(error);
    }
  }

  User? getUser(){
    _user.value = _auth.currentUser;
    return _user.value;
  }

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      'email':account.email,
      'name':account.displayName,
      'profilepic':account.photoUrl
    });
  }

  Future <void> signOut() async{
    print('sign out');
    try{
      await _auth.signOut();
      navigateToHomePage();
    } on FirebaseAuthException catch(e){
      print(e);
    }
  }

  void navigateToIntroduction() {
    Get.offAllNamed('/introduction');
  }

  navigateToHomePage(){
   Get.offAllNamed(HomeScreen.routeName);
  }

  void showLoginAlertDialog(){
    Get.dialog(DiaLogs.questionStartDialog(onTap: (){
      Get.back();
      navigateToLoginPage();
    }
    ),
      barrierDismissible: false
    );
  }

  void navigateToLoginPage(){
    Get.toNamed(LoginScreen.routeName);
  }

  bool isLoggedIn(){
    return _auth.currentUser !=null;
  }
}
