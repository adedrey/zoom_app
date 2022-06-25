import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_app/controllers/auth_controller.dart';
import 'package:zoom_app/controllers/firestore_controller.dart';

class JitsiMeetController {
  final AuthController _authController = AuthController();
  final FireStoreController _fireStoreController = FireStoreController();
  createMeetings({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String userName = "",
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p
      String name;
      // Check if username is empty
      if (userName.isEmpty) {
        name = _authController.user.displayName!;
      } else {
        name = userName;
      }
      // Setting Meeting Options
      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = name
        ..userEmail = _authController.user.email
        ..userAvatarURL = _authController.user.photoURL
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;
      // Store Meeting on fireSTore
      _fireStoreController.addMeetingToFirestore(roomName);
      // Save meeting options
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      // ...
      print(error);
    }
  }
}
