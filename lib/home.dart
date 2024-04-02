import 'dart:math';

import 'package:code/Swatch.dart';
import 'package:code/apio/api0.dart';
import 'package:code/apio/api1.dart';
import 'package:code/apio/apierepo.dart';
import 'package:code/apio/tabapi.dart';
import 'package:code/audiopaly.dart';
import 'package:code/const.dart';
import 'package:code/image.dart';
import 'package:code/localnoti.dart';
import 'package:code/setting.dart';
import 'package:code/todo/all.dart';
import 'package:code/video.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List buttonlist =[
    Swatch(),
    toDolist(),
    Sapi(),
    MyApp(),
    Api1(),
    Tabapi(),
    Notify(),
    Imagepick(),
    Vide(),
    audiplay(),

    // Impic(),
  ];
  List<IconData> _iconlist = <IconData>[
Icons.watch_later_outlined,
Icons.list,
Icons.api_rounded,
Icons.ac_unit_rounded,
Icons.album,
Icons.three_g_mobiledata,
Icons.notifications,
Icons.image,
Icons.videocam_rounded,
Icons.audiotrack,
// Icons.image,
  ];
   getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }
@override
  void initState() {
    getRandomColor();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
           actions: [
          IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Setting(),));
          }, icon: Icon(Icons.settings))
        ],
      ),
       body:GridView.builder(
        itemCount: buttonlist.length,
        padding: EdgeInsets.all(10),
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(getRandomColor()),
                elevation: MaterialStatePropertyAll(5),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
              ),
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => buttonlist.elementAt(index),)); 
            }, child:Icon(_iconlist[index],
            color: Colors.white,
            )
            ),
          );
        },)
      
    );
  }
}