import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_app/controllers/jitsi_meet_controller.dart';
import 'package:zoom_app/views/widgets/reusable_icon.dart';

class MeetingsScreen extends StatelessWidget {
  final JitsiMeetController _jitsiMeetController = JitsiMeetController();
  // Create a Meeting
  createNewMeetings() async {
    var generateRandomRoomName =
        (Random().nextInt(10000000) + 10000000).toString();
    await _jitsiMeetController.createMeetings(
      roomName: generateRandomRoomName,
      isAudioMuted: true,
      isVideoMuted: true,
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
                onPressed: () {},
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
