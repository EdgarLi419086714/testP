import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappprovider/Selector/counter_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';


class MySelectorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MySelectorPageStage();
  }
}

class _MySelectorPageStage extends State<MySelectorPage> {

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback){
      Provider.of<CounterProvider>(context).increment();
    });
  }

  void onClick(BuildContext context) {
    print('Button 1被点击了。。。。。。。。。。');
    Provider.of<CounterProvider>(context).increment();
  }

  @override
  Widget build(BuildContext context) {
    print('页面重绘了。。。。。。。。。。。');
    return ChangeNotifierProvider(
      create: (BuildContext context) => CounterProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Selector"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Selector(builder: (BuildContext context, value, Widget child) {
                print('Text 1 重绘了。。。。。。。。。。');
                return Text(
                    //获取数据
                    'Text1 : ${value.toString()}',
                    style: TextStyle(fontSize: 20)
                );
              }, selector: (BuildContext context, CounterProvider counterProvider) {
                  return counterProvider.value;
              },),

              Selector(builder: (BuildContext context, value, Widget child) {
                print('Text 2 重绘了。。。。。。。。。。');
                return Text(
                  //获取数据
                    'Text2 : ${value.toString()}',
                    style: TextStyle(fontSize: 20)
                );
               }, selector: (BuildContext , CounterProvider counterProvider) {
                   return counterProvider.value1;
               },
              ),
              Consumer(builder: (BuildContext context, CounterProvider value, Widget child) {
                print('RaisedButton重绘了。。。。。。');
                return RaisedButton(
                  onPressed: () => onClick(context),
                  child: Text('Button1'),
                );
              },),
              DataWidget(),
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