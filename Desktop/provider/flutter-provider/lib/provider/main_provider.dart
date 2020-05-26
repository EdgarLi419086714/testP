
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom/counter_model.dart';
import '../first_screen.dart';

void main() {
   final counter = CounterModel();
   final textSize = 48;
   
   runApp(
      Provider<int>.value(
        value: textSize,
        child: ChangeNotifierProvider.value(
          value: counter,
          child: MyProviderApp(),
        ),
      )
   );
}

class MyProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: FirstScreen(),
    );
  }
}