import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Vide extends StatefulWidget {
  const Vide({super.key});

  @override
  State<Vide> createState() => _VideState();
  
}

class _VideState extends State<Vide> {



  bool isvisbi = true;
  late VideoPlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playVideo();
  }


void playVideo(){
  try{
_controller = VideoPlayerController.asset('asset/video/sample-5s.mp4');
_controller.addListener(() {
  setState(() {});
});
  _controller.setLooping(false);
  _controller.initialize().then((_) => setState((){}));
  _controller.play();
  isvisbi=false;
  }catch(e){
    debugPrint('Error $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(

),
body:GestureDetector(
  onTap: () {
    setState(() {
      isvisbi=!isvisbi;
    });
  },
  child: AspectRatio(
    aspectRatio: _controller.value.aspectRatio,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          color: _controller.value.isPlaying?Colors.transparent:Colors.black,
          child: Opacity(
            opacity: _controller.value.isPlaying?1:0.3,
            child: VideoPlayer(_controller),
            ),
        ),
        Visibility(
          child: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: (){
                    setState(() {
                      Duration currentPosition = _controller.value.position;
                      Duration targetPosition = currentPosition + const Duration(seconds: -5);
                      _controller.seekTo(targetPosition);
                      _controller.value.isPlaying?false:_controller.play();
                      isvisbi=false;
                    });
                  },
                 icon: Icon(Icons.fast_rewind,
                 size: 50,
                 color: Colors.white,
                 ),
                 ),
                 SizedBox(width: 30,),
                 IconButton(
                  onPressed: (){
                    setState(() {
                      
                      if(_controller.value.isPlaying){
                        _controller.pause();
                      }else{
                        _controller.play();
                        isvisbi=false;
                      }
                    });
                  }, 
                  icon:Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 50,
                  color: Colors.white,
                  ),
                   ),
                   SizedBox(width: 30,),
                   IconButton(onPressed: (){
setState(() {
  Duration currentPosition = _controller.value.position;
  Duration targetPosition = currentPosition + Duration(seconds: 5);
  _controller.seekTo(targetPosition);
  _controller.value.isPlaying?false:_controller.play();
  isvisbi=false;
});
                   }, icon: Icon(
                    Icons.fast_forward,
                    size: 50,
                    color: Colors.white,
                   )),
              ],
            ),
          )
        ),
        VideoProgressIndicator(_controller, allowScrubbing:true ),
      ],
    ),
  ),
)
    );
  }
}