import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learning_app/models/user.dart';
import 'package:flutter/material.dart';

class AuthService {
  //TODO's Sign in with mail has error it does not check the validation
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // User from firebase
  UserModel _userFromFirebase(User user) {
    return user != null
        ? UserModel(
            uid: user.uid,
            email: user.email,
          )
        : null;
  }

  // stream to know if signed in or not
  Stream<UserModel> get user {
    return _firebaseAuth.authStateChanges().map((user) => _userFromFirebase(user));
  }

  // sign in anon
  Future signInAnon(BuildContext context) async {
    try {
      var user = (await _firebaseAuth.signInAnonymously()).user;
      return _userFromFirebase(user);
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException');
      _showSnackBar(context, e.message);
    } catch (e) {
      print(e.toString());
      _showSnackBar(context, e.message);
      return null;
    }
  }

// sign in email&&pass
  Future signInMail(BuildContext context, String email, String password) async {
    try {
      var user = (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user;
      return user;
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException');
      _showSnackBar(context, e.message);
    } catch (e) {
      print(e.toString());
      _showSnackBar(context, e.message);
      return null;
    }
  }

  void _showSnackBar(BuildContext context, String text) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

// register in email&&pass
   Future signUp(BuildContext context, String email, String password) async {
     try {
       var user = (await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user;
       return user;
     } on FirebaseAuthException catch (e) {
       print('FirebaseAuthException');
       _showSnackBar(context, e.message);
     } catch (e) {
       print(e.toString());
       return null;
     }
   }

  // sign out
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
