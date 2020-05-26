
import 'package:flutter/cupertino.dart';

class InheritedProvider<T> extends InheritedWidget {

  InheritedProvider({@required this.data, Widget child}): super(child: child);

  //共享状态使用泛型
  final T data;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

}