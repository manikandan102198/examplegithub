import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../utilis/app_exception.dart';

class FireAuthProvider {
  final _auth = FirebaseAuth.instance;

  Future<Either<AppException, UserCredential>> singInGitHub() async {
    final githubProvider = GithubAuthProvider();
    try {
      final res = await _auth.signInWithProvider(githubProvider);
      log('res $res');
      return Right(res);
    } on FirebaseAuthException catch (e) {
      debugPrint('e $e');
      return Left(AppException(errorMsg: e.message!, statusCode: e.code));
    }
  }

  Future signOut()async => await _auth.signOut();
}
