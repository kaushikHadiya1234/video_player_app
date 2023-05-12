import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player_app/Video_Player/Provider/Video_Provider.dart';

class PlayVideo extends StatefulWidget {
  const PlayVideo({Key? key}) : super(key: key);

  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {

  VideoProvider? pt;
  VideoProvider? pf;


  @override
  Widget build(BuildContext context) {
    pf = Provider.of<VideoProvider>(context,listen: false);
    pt = Provider.of<VideoProvider>(context,listen: true);
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_outlined)),
          title: Text("${pf!.NameList[index].name}"),
          backgroundColor: Colors.black,
        ),
        body: Center(
            child: Chewie(
              controller: pt!.chewieController!,
            ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    pf!.disposevideo();
  }
}
