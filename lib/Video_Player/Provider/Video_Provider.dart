import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/Video_Player/Model/video_model.dart';

class VideoProvider extends ChangeNotifier {
  List videoList = [
    "assets/video/baarish.mp4",
    "assets/video/Mehabooba.mp4",
    "assets/video/Menu_tu_leja.mp4",
    "assets/video/baarish.mp4",
    "assets/video/Mehabooba.mp4",
    "assets/video/Menu_tu_leja.mp4",
  ];

  List<VideoModel> NameList = [
    VideoModel(name: "Baarish", img: "assets/images/v1.jpg"),
    VideoModel(name: "Mehabooba", img: "assets/images/v2.jpg"),
    VideoModel(name: "Menu tu leja kithe dur", img: "assets/images/v3.jpg"),
    VideoModel(name: "Baarish", img: "assets/images/v1.jpg"),
    VideoModel(name: "Mehabooba", img: "assets/images/v2.jpg"),
    VideoModel(name: "Menu tu leja kithe dur", img: "assets/images/v3.jpg"),
  ];

  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  void loadvideo(int index) {
    videoPlayerController = VideoPlayerController.asset("${videoList[index]}",
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: false));
    videoPlayerController!.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: true,
      // allowedScreenSleep: true
      // allowPlaybackSpeedChanging: true
      // looping: true
      // progressIndicatorDelay: Duration(seconds: 10)
      useRootNavigator: true,
      showOptions: true
    );
  }

  void disposevideo() {
    videoPlayerController!.dispose();
  }
}
