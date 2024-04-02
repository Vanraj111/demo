import 'package:code/apio/apierepo.dart';
import 'package:code/models/model.dart';
import 'package:flutter/material.dart';

class Api1 extends StatefulWidget {
  const Api1({super.key});

  @override
  State<Api1> createState() => _Api1State();
}

class _Api1State extends State<Api1> {
  List<Data> albumlistData = [];

  bool isLoading = false;
   Future  _albumDato() async{
    final album =  await ApiRepository().defaultGetCall("https://jsonplaceholder.typicode.com/photos");
   
    if(album.statusCode == 200){
     List albumData = album.data['data'] as List;
        albumlistData = albumData.map((e) => Data.fromJson(e)).toList();
        setState(() {});
    }else if(album.statusCode == 404) {
            setState(() => isLoading = false);
 return albumlistData;

    }
  }
  @override
  void initState() {
    _albumDato;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: ListView.builder(
  itemCount: albumlistData.length ,
  itemBuilder: (context, index) {
  return SizedBox(
    height: 100,
    width: 100,
   
  );
},),
    );
  }
}