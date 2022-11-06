import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  /// register with new email and password
  Future<void> signUp({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('password_too_weak'.tr());
      } else if (e.code == 'email-already-in-use') {
        throw Exception('email_already_exists'.tr());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// signIn to firebase by email and password
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('no_user_found'.tr());
      } else if (e.code == 'wrong-password') {
        throw Exception('wrong_password_provided'.tr());
      }
    }
  }

  /// signOut from firebase
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }
}
