
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProviderModel extends ChangeNotifier {
  var _count = 0;

  get count => _count;

  void add(){
    _count++;
    notifyListeners();
  }

}