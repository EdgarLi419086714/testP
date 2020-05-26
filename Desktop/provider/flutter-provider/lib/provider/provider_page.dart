
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappprovider/provider/provider_model.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return  _ProviderPageState();
  }
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProviderModel(),)
        ],
        child: Scaffold(
          appBar: AppBar(
            title: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                    var counter = Provider.of<ProviderModel>(context);
                    return new Text("Provider ${counter.count.toString()}");
                }
            ) ,
          ),
          body: CountWidget(),
        ) ,
    );
  }
}

class  CountWidget extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context, counter, _){
       return new Column(
         children: <Widget>[
           new Expanded(child: new Center(child: new Text(counter.count.toString()))),
           new Center(
               child: new FlatButton(
                   onPressed: () {
                     counter.add();
                   }
                   , child: null),
           ),
         ],
       );
    });
  }
}