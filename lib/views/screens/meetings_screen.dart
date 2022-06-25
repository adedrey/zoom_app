import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_app/controllers/jitsi_meet_controller.dart';
import 'package:zoom_app/views/screens/video_call_screen.dart';
import 'package:zoom_app/views/widgets/reusable_icon.dart';

class MeetingsScreen extends StatelessWidget {
  final JitsiMeetController _jitsiMeetController = JitsiMeetController();
  // Create a Meeting
  createNewMeetings() {
    var generateRandomRoomName =
        (Random().nextInt(10000000) + 10000000).toString();
    _jitsiMeetController.createMeetings(
      roomName: generateRandomRoomName,
      isAudioMuted: true,
      isVideoMuted: true,
    );
  }

  // Join a meeting
  joinMeeting(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoCallScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ReusableIcon(
                icon: Icons.videocam,
                text: "New Meeting",
                onPressed: createNewMeetings,
              ),
              ReusableIcon(
                icon: Icons.add_box_rounded,
                text: "Join Meeting",
                onPressed: () {
                  joinMeeting(context);
                },
              ),
              ReusableIcon(
                icon: Icons.calendar_today,
                text: "Schedule",
                onPressed: () {},
              ),
              ReusableIcon(
                icon: Icons.arrow_upward,
                text: "Share Screen",
                onPressed: () {},
              ),
            ],
          ),
          const Expanded(
            child: Center(
              child: Text(
                "Create/Join Meetings with just a click",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
