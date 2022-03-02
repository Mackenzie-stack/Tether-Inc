import 'package:flutter/cupertino.dart';

class LoadingProvider extends ChangeNotifier{

  //THE LOADING VARIABLE
  bool _loading = false;

  //GETTING THE LOADING VARIABLE
  bool get loading => _loading;


  //SETTING THE LOADING VARIABLE
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }
}