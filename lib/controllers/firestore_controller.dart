import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zoom_app/controllers/auth_controller.dart';

class FireStoreController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void addMeetingToFirestore(String meetingName) async {
    try {
      await _firestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection("meetings")
          .add({
        'meetingName': meetingName,
        'createdAt': DateTime.now(),
      }); // For firebase to specify collection id

    } catch (err) {
      // ...
      print(err);
    }
  }
}
