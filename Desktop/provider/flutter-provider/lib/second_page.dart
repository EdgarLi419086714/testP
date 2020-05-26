
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom/counter_model.dart';

class SecondPage extends StatelessWidget {

  Widget childWidget() {
    print('childWidget 被刷新了');
    return Text('1111');
  }

  @override
  Widget build(BuildContext context) {
    print('second screen rebuild');
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
      ),
    body: Consumer2<CounterModel, int>(builder: (context, CounterModel counter, int textSize, _) {
        print('context 被刷新了');
        return Center(
          child: Text(
            'Value: ${counter.value}',
            style: TextStyle(
              fontSize: textSize.toDouble(),
            ),
          ),
        );
    }),
     floatingActionButton: Consumer<CounterModel>(
       builder: (context, CounterModel counter, child){
         print('FloatingActionButton 被刷新了');
         return FloatingActionButton(
         onPressed: counter.increment,
         child: child,
       );
     },
//       child: childWidget(),
     ),
   );
  }
}