import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player_app/Video_Player/Provider/Video_Provider.dart';
import 'package:video_player_app/Video_Player/View/Home_Screen.dart';
import 'package:video_player_app/Video_Player/View/play_video.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => VideoProvider(),
      child: Sizer(
        builder: (context, orientation, deviceType) =>
            MaterialApp(
              debugShowCheckedModeBanner: false,
              routes: {
                '/': (context) => HomeScreen(),
                'play': (context) => PlayVideo(),
              },
            ),
      ),
    ),
  );
}