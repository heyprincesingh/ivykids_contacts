import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ivykids_contacts/view/contactsScreen/contactsScreen.dart';
import 'package:ivykids_contacts/view/logIn_signup/logInDetail.dart';
import 'package:ivykids_contacts/view/splashScreen/splashScreen.dart';
import 'exceptions/signup_email_password_failure.dart';

class authentication_repo extends GetxController {
  static authentication_repo get instance => Get.put(authentication_repo());

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;
  String Uid = '';

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(logIn())
        : {Uid = _auth.currentUser!.uid, Get.offAll(splashScreen())};
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? {Uid = _auth.currentUser!.uid, Get.offAll(contactsScreen())}
          : Get.offAll(() => logIn());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('Firebase Auth Exception - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('Exception - ${ex.message}');
      throw ex;
    }
  }

  Future<void> logInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Uid = _auth.currentUser!.uid;
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> googleSignIn() async{
    final userCredential = await authentication_repo.instance.signInWithGoogle();
    if (userCredential.user != null) {
      final user = userCredential.user!;
      final displayName = user.displayName ?? '';
      final email = user.email ?? '';
      final newUser = {
        'userId': user.uid,
        'name': displayName,
        'email': email,
        'details': [],
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(newUser);

      Uid = _auth.currentUser!.uid;
      Get.offAll(() => contactsScreen());
    } else {
      Get.snackbar("Google Sign-In Failed", "Please try again",
          // backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> logout() async => await _auth.signOut();

}
