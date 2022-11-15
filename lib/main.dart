import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'pages/authpages/loginpage.dart';

import 'services/notfication_service.dart';
import 'services/auth/login.dart';

import 'pages/data_view_pages/view_all_esp.dart';

import 'pages/data_view_pages/esp_detail.dart';

bool isLogin = false;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationService().initNotification();
  // isLogin = await device_has_auth();
  // await pars_authentication_log_out();
  var user = await pars_authentication(email: 'djjeremys0@gmail.com',password: '1afsbns1A');
  // user.uid
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    if (isLogin){
      print('user is logined');
    }
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // navigatorKey: Grock.navigationKey,
      // scaffoldMessengerKey: Grock.scaffoldMessengerKey,
      theme: ThemeData.dark(
      ),
      home: esp_detail_view(espID: "3450"),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
