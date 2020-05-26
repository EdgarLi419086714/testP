import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappprovider/Selector/counter_provider.dart';
import 'package:flutterappprovider/Selector/my_page.dart';
import 'package:provider/provider.dart';

//void main() {
//  runApp(
//      MultiProvider(
//        providers: [
//          ChangeNotifierProvider(create: (_) => CounterProvider()),
//        ],
//        child: MyApp(),
//      )
//     );
//}

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyPage(),
    );
  }
}