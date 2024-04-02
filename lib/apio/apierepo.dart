import 'package:code/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  Future defaultGetCall(String url) async {
    return await http.get(Uri.parse(url));
  }

  Future defaultPostCall(String url, dynamic headers, dynamic body) async {
    return await http.post(Uri.parse(url), headers: headers, body: body);
  }
}

// import 'package:flutter/material.dart';
// import 'package:repository_demo/repository/api_repository.dart';
// import 'package:repository_demo/utils/constants.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                }
                return null;
              },
            ),
          ),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Future getEmployees() async {
    final result = await ApiRepository()
        .defaultGetCall('https://dummy.restapiexample.com/api/v1/employees');
  Options(
sendTimeout: Duration(seconds: 1),
receiveTimeout: Duration(seconds: 1),
    );
    final result2 = await ApiRepository().defaultPostCall(
      'https://dummy.restapiexample.com/api/v1/employees',
      {'contentType': 'Application/json', 'Auth': 'Token'},
      {
        'userName': 'hello',
        'password': 'hello',
      },
    );
    print(result);
    print(result2);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    getEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: myTextStyle,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'click here',
                style: Theme.of(context).primaryTextTheme.bodySmall,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
