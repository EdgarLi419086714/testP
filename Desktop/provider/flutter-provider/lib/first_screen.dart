
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappprovider/second_page.dart';
import 'package:provider/provider.dart';

import 'custom/counter_model.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final _counter = Provider.of<CounterModel>(context);
     final textSize = Provider.of<int>(context).toDouble();
     print('first screen rebuild');
     return Provider(
        builder: (_) => textSize,
        child: Scaffold(
          appBar: AppBar(
            title: Text('FirstPage'),
          ),
          body: Center(
            child: Text(
              'Value : ${_counter.value}',
              style: TextStyle(fontSize: textSize),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SecondPage())),
            child: Icon(Icons.navigate_next),
          ),
        ),
       dispose:(context, textSize) {
          print('dispose ==  ${textSize}');
       },
     );
  }
}