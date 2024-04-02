import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/model.dart';

class Sapi extends StatefulWidget {
  const Sapi({super.key});

  @override
  State<Sapi> createState() => _SapiState();
}

class _SapiState extends State<Sapi> {
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
        title: Text('Sapi'),
      ),
       body:
        isLoading? LinearProgressIndicator(minHeight: 10,):
       ListView.builder(
            itemCount: listMyData.length,
            itemBuilder: (context, index) {
              return Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      //   Text("id"),
                      Text("${listMyData[index].id.toString()}"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      //      Text("employeeName"),
                      Text("${listMyData[index].employeeName.toString()}"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      //    Text("employeeSalary"),
                      Text("${listMyData[index].employeeSalary.toString()}"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      //     Text("employeeAge"),
                      Text("${listMyData[index].employeeAge.toString()}"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      //   Text("profileImage"),
                      Text("${listMyData[index].profileImage.toString()}"),
                    ],
                  ),
                ),
              ]);
            },
          )
          // :AboutDialog(
          //   applicationName: 'Api not called',
          //   applicationIcon: Icon(Icons.error_outline_rounded),
          // )
      
    );
  }
}
