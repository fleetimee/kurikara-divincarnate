import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseDataSource {
  final FirebaseAuth auth;
  FirebaseDataSource({
    required this.auth,
  });

  Future<Either<String, String>> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      return Right(userCredential.user!.uid);
    } else {
      return const Left('failed');
    }
  }

  // Future<Either<String, String>> loginWithFacebook() async {
  //   try {
  //     final LoginResult loginResult = await FacebookAuth.instance.login(
  //       loginBehavior: LoginBehavior.webOnly,
  //     );
  //     if (loginResult.accessToken != null) {
  //       return Right(loginResult.accessToken!.userId);
  //     } else {
  //       return const Left('failed');
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     return Left('failed: ${e.stackTrace}');
  //   }
  // }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<Either<String, String>> loginWithAppleId() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      if (appleCredential.userIdentifier != null) {
        return Right(appleCredential.userIdentifier!);
      } else {
        return const Left('failed');
      }
    } on FirebaseAuthException catch (e) {
      return Left('failed: ${e.stackTrace}');
    }
  }
}
