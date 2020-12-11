import 'package:firebase_auth/firebase_auth.dart';
import 'package:orderac/information/about_user.dart';
import 'package:orderac/services/database_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String errorMessage;

  AboutUser _returnUserUid(User user) {
    return (user == null) ? null : AboutUser(uid: user.uid);
  }

  Stream<AboutUser> get user {
    return _auth.authStateChanges().map(_returnUserUid);
  }

  Future registerWithEmailAndPasswordWithFirebase(email, password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;

      await DatabaseService(uid: user.uid).updateUserDetails('New User');

      return _returnUserUid(user);
    } catch (e) {
      return e.code;
    }
  }

  Future signInWithEmailAndPasswordWithFirebase(email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = userCredential.user;
      return _returnUserUid(user);
    } catch (e) {
      return e.code;
    }
  }

  Future signOutWithFirebase() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return e.code;
    }
  }
}
