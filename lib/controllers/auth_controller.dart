import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // User Details
  User? get user => _auth.currentUser;
  // Sign In with Google
  signInWithGoogle() async {
    // SIgn In
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Check if the user is logged in or not
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    // Get access to User Credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Store Data in FirebaseAuth
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    // Get user details
    User? user = userCredential.user;
    // Check if user details exist
    if (user != null) {
      // Check if user is a new user
      // Add user details to firestore
      if (userCredential.additionalUserInfo!.isNewUser) {
        _firestore.collection("users").doc(user.uid).set({
          "username": user.displayName,
          "uid": user.uid,
          "profilePhoto": user.photoURL,
        });
      }
    }
  }
}
