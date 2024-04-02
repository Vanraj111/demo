import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: ListView.builder(
        

        itemCount: 20,
        itemBuilder: (context, index)
         {
        return Column(
          children: [
            Container(
              height: 20,
             width:500,
              color: Colors.white,
              child: Text('Settings'),
            ),
            Divider(height: 0,color: Colors.black,),
          ],
        );
      },     

      ),
    );
  }
}