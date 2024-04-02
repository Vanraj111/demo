import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/model.dart';

class Tabapi extends StatefulWidget {
  const Tabapi({super.key});

  @override
  State<Tabapi> createState() => _TabapiState();
}

class _TabapiState extends State<Tabapi> {
  final dio = Dio();
  List<Data> listMyData = [];
  bool isLoading = false;

  Future<Object> _getData() async {
    setState(() => isLoading = true);
    await Future.delayed(Duration(seconds: 2));
    try {
      final response =
          await dio.get("https://dummy.restapiexample.com/api/v1/employees",
              options: Options(
                sendTimeout: const Duration(seconds: 1),
                receiveTimeout: const Duration(seconds: 1),
              ));

      if (response.statusCode == 200) {
        debugPrint(response.data.toString());
        List listData = response.data['data'] as List;
        listMyData = listData.map((e) => Data.fromJson(e)).toList();
        setState(() {});
      } else if (response.statusCode == 500) {
        debugPrint("Internal server down");
      }
      setState(() {});
      setState(() => isLoading = false);
      return listMyData;
    } on DioException catch (e) {
      setState(() => isLoading = false);
      if (e.response != null) {
      } else {
        debugPrint('----e>$e');
        debugPrint('-----requestOption>${e.requestOptions}');
        debugPrint('-----message>${e.message}');
      }
      return listMyData;
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabapi'),
      ),
       body:
        // isLoading? LinearProgressIndicator(minHeight: 10,):
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 50,
                      color: Colors.cyan,
                      child: Text("Id ")),
                    Container(
                        alignment: Alignment.center,
                      width: 100,
                       color: Colors.cyan,
                      child: Text("Name")),
                    Container(
                        alignment: Alignment.center,
                      width: 90,
                      color: Colors.cyan,
                      child: Text("Salary")),
                    Container(
                        alignment: Alignment.center,
                      width: 50,
                      color: Colors.cyan,
                      child: Text("Age")),
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: isLoading? Center(child: CircularProgressIndicator(color:Colors.red,)):
                  ListView.builder(
                   physics: NeverScrollableScrollPhysics(),
                             itemCount: listMyData.length,
                             itemBuilder: (context, index) {
                   return Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     Container(
                      alignment: Alignment.center,
                      width: 50,
                      color: Colors.amberAccent,
                      child: Text("${listMyData[index].id.toString()}")),
                     Container(
                      alignment: Alignment.center,
                      width: 100,
                      color: Colors.amberAccent,
                      child: Text("${listMyData[index].employeeName.toString()}")),
                
                     Container(
                      alignment: Alignment.center,
                      width: 90,
                      color: Colors.amberAccent,
                      child: Text("${listMyData[index].employeeSalary.toString()}")),
                
                     Container(
                     alignment: Alignment.center,
                    width: 50,
                      color: Colors.amberAccent,
                      child: Text("${listMyData[index].employeeAge.toString()}")),
                
                     // Padding(
                     //   padding: const EdgeInsets.all(8.0),
                     //   child: Column(
                     //     children: [
                     //       //   Text("profileImage"),
                     //       Text("${listMyData[index].profileImage.toString()}"),
                     //       Divider(),
                     //     ],
                     //   ),
                     // ),
                   ]);
                             },
                           ),
                ),
              ],
            )
          // :AboutDialog(
          //   applicationName: 'Api not called',
          //   applicationIcon: Icon(Icons.error_outline_rounded),
          // )
      
    );
  }
}
