library firebase_auth_service;

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'utilities/index.dart';

/// firebase auth service provider
final fbAuthProvider = Provider((_) => FirebaseAuthService());

final fbAuthUserStreamProvider = AutoDisposeStreamProvider((ref) {
  final auth = ref.read(fbAuthProvider);

  return auth.authStateChanges();
});

/// general auth service, returns [CustomException] on exception
class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AppFbUser get currentUser =>
      AppFbUser.fromFirebaseUser(_firebaseAuth.currentUser!);

  User? get checkCurrentUser => _firebaseAuth.currentUser;

  Stream<AppFbUser?> authStateChanges() {
    return _firebaseAuth
        .authStateChanges()
        .map((user) => user == null ? null : AppFbUser.fromFirebaseUser(user));
  }

  
  Future<AppFbUser> _signInAnonymously() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    return AppFbUser.fromFirebaseUser(userCredential.user!);
  }

  /// returns [AppFbUser] on success else [CustomException]
  Future signInWithEmailAndPassword(String email, String password,
      {bool isValidStudentEmail = true}) async {
    try {
      if (isValidStudentEmail) {
        final userCredential = await _firebaseAuth.signInWithCredential(
          EmailAuthProvider.credential(
            email: email,
            password: password,
          ),
        );

        await userCredential.user?.reload();

        final currentUser = await _firebaseAuth.authStateChanges().first;

        // check if email is verified
        if (currentUser!.emailVerified) {
          return AppFbUser.fromFirebaseUser(userCredential.user!);
        }

        //
        else {
          await currentUser.sendEmailVerification();

          return CustomException(
            message:
                'Email provided not verified. A verification link has been sent to your email, check your email to complete process',
          );
        }
      }

      // not uni email
      else {
        return CustomException(
          message: 'Email provided not a valid student email!',
        );
      }
    }

    // fb err
    on FirebaseAuthException catch (e) {
      log(e.message!);

      return CustomException(message: e.message);
    }

    // err
    catch (e) {
      log(e.toString(), level: 3);
      return CustomException(message: e.toString());
    }
  }

  Future registerNewUser(String email, String password,
      {bool isValidStudentEmail = true}) async {
    try {
      if (isValidStudentEmail) {
        final userCredential = await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        return AppFbUser.fromFirebaseUser(userCredential.user!);
      }

      // not uni email
      else {
        return CustomException(
          message: 'Email provided not a valid student email!',
        );
      }
    }

    // fb err
    on FirebaseAuthException catch (e) {
      log(e.message!);

      return CustomException(message: e.message);
    }

    // err
    catch (e) {
      log(e.toString(), level: 3);
      return CustomException(message: e.toString());
    }
  }

  Future sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    }

    // fb err
    on FirebaseAuthException catch (e) {
      log(e.message!);

      return CustomException(message: e.message);
    }

    // err
    catch (e) {
      log(e.toString(), level: 3);
      return CustomException(message: e.toString());
    }
  }

  Future signOut() async {
    return _firebaseAuth.signOut();
  }
}
