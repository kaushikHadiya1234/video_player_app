import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player_app/Video_Player/Provider/Video_Provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  VideoProvider? pt;
  VideoProvider? pf;

  @override
  Widget build(BuildContext contpext) {
    pf = Provider.of<VideoProvider>(context,listen: false);
    pt = Provider.of<VideoProvider>(context,listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Video Player",style: TextStyle(fontSize: 20,color: Colors.black),),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: ListView.builder(itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              pf!.loadvideo(index);
              Navigator.pushNamed(context, 'play',arguments: index);
            },
            child: Container(
              height: 30.h,
              width: 90.w,
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                image: DecorationImage(
                  image: AssetImage("${pf!.NameList[index].img}"),fit: BoxFit.fill
                ),
                borderRadius: BorderRadius.circular(20)
              ),
            ),
          );
        },
          itemCount:pf!.videoList.length,
        ),
      ),
    );
  }
}
