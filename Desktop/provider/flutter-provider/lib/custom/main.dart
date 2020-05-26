import 'dart:collection';
import 'package:flutter/material.dart';
import 'change_notifier.dart';
import 'change_notifier_provider.dart';

void main() {
  runApp(MyApp());
}

class Item {
  double price;
  int count;
  Item(this.price, this.count);
}

class CartModel extends ChaneNotifier {
  // 用于保存购物车中商品列表
  final List<Item> _items = [];

  // 禁止改变购物车里的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // 购物车中商品的总价
  double get totalPrice =>
      _items.fold(0, (value, item) => value + item.count * item.price);

  // 将 [item] 添加到购物车。这是唯一一种能从外部改变购物车的方法。
  void add(Item item) {
    _items.add(item);
    // 通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
    notifyListeners();
  }
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
   var color =  Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ChangeNotifierProivder<CartModel>(
            data: CartModel(),
            child: Builder(builder: (context){
               return Column(
                   children: <Widget>[
                     Builder(builder: (context){
                       var cart=ChangeNotifierProivder.of<CartModel>(context);
                       return Text("总价: ${cart.totalPrice}");
                     }),
                     Builder(builder: (context) {
                       return RaisedButton(
                          child: Text('添加商品'),
                          onPressed: (){
                            ChangeNotifierProivder.of<CartModel>(context).add(Item(20.0, 1));
                          },
                       );
                     }),
                   ],
               );
            }),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
