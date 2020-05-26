import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappprovider/Selector/counter_provider.dart';
import 'package:flutterappprovider/Selector/my_selector_page.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';


class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyPageStage();
  }
}

class _MyPageStage extends State<MyPage> {

  CounterProvider _counterProvider;

  void initState() {
    super.initState();
  }

  void onClick(BuildContext context) {
    print('Button 1被点击了。。。。。。。。。。');
    Provider.of<CounterProvider>(context).increment();
  }

  @override
  Widget build(BuildContext context) {
    print('页面重绘了。。。。。。。。。。。');

//    return  Scaffold(
//        appBar: AppBar(
//          title: Text("Selector"),
//        ),
//        body: Center(
//          child: Column(
//            children: <Widget>[
//              //使用Consumer来获取CounterProvider，为Text提供数据
//              Consumer(builder: (BuildContext context, CounterProvider value, Widget child) {
//                print('Text1重绘了。。。。。。');
//                return Text(
//                  //获取数据
//                  'Text1 : ${value.value}',
//                  style: TextStyle(fontSize: 20),
//                );
//              },),
//
//              Consumer(builder: (BuildContext context, CounterProvider value, Widget child) {
//                print('Text2重绘了。。。。。。');
//                return Text(
//                  //获取数据
//                    'Text2 : ${value.value1}',
//                    style: TextStyle(fontSize: 20)
//                );
//              },),
//
//              RaisedButton(
//                onPressed: () => onClick(context),
//                child: Text('Button1'),
//              ),
//
//              RaisedButton(
//                onPressed: () {
//                  print('Button 2被点击了。。。。。。。。。。');
//                  Provider.of<CounterProvider>(context,listen: false).increment1();
//                },
//                child: Text('Button2'),
//              )
//            ],
//          ),
//        ),
//      );

    return ChangeNotifierProvider(
      create: (BuildContext context) => CounterProvider(),
      child: Scaffold(
         appBar: AppBar(
           title: Text("Selector"),
         ),
         body: Center(
          child: Column(
          children: <Widget>[
            //使用Consumer来获取CounterProvider，为Text提供数据
            Consumer(builder: (BuildContext context, CounterProvider value, Widget child) {
                 print('Text1重绘了。。。。。。');
                 return Text(
                   //获取数据
                   'Text1 : ${value.value}',
                   style: TextStyle(fontSize: 20),
                 );
              },),

            Consumer(builder: (BuildContext context, CounterProvider value, Widget child) {
              print('Text2重绘了。。。。。。');
              return Text(
                  //获取数据
                  'Text2 : ${value.value1}',
                  style: TextStyle(fontSize: 20)
              );
            },),

            Consumer(builder: (BuildContext context, CounterProvider value, Widget child) {
              print('RaisedButton重绘了。。。。。。');
              return RaisedButton(
                onPressed: () => onClick(context),
                child: Text('Button1'),
              );
            },),
            DataWidget(),

            RaisedButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MySelectorPage())),
              child: Text('jump'),
            ),

            LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
              return  RaisedButton(
                 child: Text('test'),
                 onPressed: (){
                    Provider.of<CounterProvider>(context).increment();
                 },
              );
            }),
            ],
          ),
        ),
      ),
    );
  }
}

class DataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("局部重绘");
    return RaisedButton(
      onPressed: () {
        print('Button 2被点击了。。。。。。。。。。');
        Provider.of<CounterProvider>(context).increment();
      },
      child: Text('Button2'),
    );
  }
}