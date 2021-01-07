import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<AuthResult> login(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<FirebaseUser> getCurrentUser() {
    return _auth.currentUser();
  }

  Future<void> signOut() {
    return _auth.signOut();
  }

  Future<AuthResult> createUser(String email, String password) {
    return _auth.createUserWithEmailAndPassword(email: email, password: password);
  }
}
