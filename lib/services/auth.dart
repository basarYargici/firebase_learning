import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learning_app/models/user.dart';

class AuthService {
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
  Future<UserModel> signInAnon() async {
    try {
      var user = (await _firebaseAuth.signInAnonymously()).user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in email&&pass
  Future<UserModel> signInMail(String email, String password) async {
    try {
      //var user = (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user;
      //return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
// register in email&&pass

// sign out
}
