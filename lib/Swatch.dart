import 'dart:async';
import 'package:flutter/material.dart';
import 'const.dart';

class Swatch extends StatefulWidget {
  const Swatch({super.key});

  @override
  State<Swatch> createState() => _SwatchState();
}

class _SwatchState extends State<Swatch> {
Timer? _timer;
int _start=1000;
bool run=false;
  Color _iconColor = Colors.yellow;

 void starttimer(){
    print('start');

  const oneSec = Duration(microseconds: 1 );
  _timer = Timer.periodic(oneSec,
    (Timer timer) => setState(() {
      if(_start<1){
        timer.cancel();
      }else{
        _start--;
      }
    }),
 
  );
  }
 void resettimer(){
  print('reset');
  _timer?.cancel();
   _start= 1000;
 }
 void stoptimer(){
  print('stop');
  _timer?.cancel();
 }


 @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
   
   
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
         appBar: AppBar(
        title: Text("Timer"),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Container(
            decoration: boxdeco,
                 alignment: Alignment.center,
                height: 200,width: 200,
              child: Text('$_start',style: optionStyle,)//:Text('$_start',style: optionStyle,),
            ),
         ),
          Row(
children: [
  ElevatedButton(style: busty,onPressed: (){
    starttimer();
    setState(() {
      
    });
  }, child: Text('Start')),
    ElevatedButton(style: busty,onPressed: (){
         stoptimer();
         setState(() {
           
         });
    }, child: Text('Stop')),
     ElevatedButton(style: busty,onPressed: (){
    resettimer();
    setState(() {
      // run= run;
    });
  }, child: Text('reset')),

],
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: _iconColor,
        onPressed: (){
        setState(() {
          if(_iconColor == Colors.yellow){
            _iconColor = Colors.blue;
          }else{
            _iconColor = Colors.yellow;
          }

        });
       

      },
      child:Icon(Icons.add),
      ),
      ),

    );
  }
}

 