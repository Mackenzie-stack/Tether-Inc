import 'dart:collection';

import 'package:flutter/cupertino.dart';

class TextEditingNotifier extends ChangeNotifier {

  final List<String> _fromUnitItems = ['Centimeter', 'Decimeter', 'Millimeter', 'Meter', 'Kilometer',];
  final List<String> _toUnitItems = ['Centimeter','Decimeter','Millimeter','Meter','Kilometer',];


  String _question;
  get getQuestionText => _question;

  set setQuestionText(String value) {
    _question = value;
    notifyListeners();
  } // List<String> get fromUnitItems => _fromUnitItems;
  // List<String> get toUnitItems => _toUnitItems;

  UnmodifiableListView<String> get fromUnitItems => UnmodifiableListView(_fromUnitItems);

  UnmodifiableListView<String> get toUnitItems => UnmodifiableListView(_toUnitItems);


  String _selectedToUnit;
  String _selectedFromUnit;

  // get mthod for selected unit to convert from
  get getFromSelectedUnit => _selectedFromUnit;

  //get method for selected unit to convert to
  get getToSelectedUnit => _selectedToUnit;

  //set method for setting the unit to convert from
  set setFromUnit(String value) {
    _selectedFromUnit = value;
    notifyListeners();
  }

  //set method for setting the unit to convert To
  set setToUnit(String value) {
    _selectedToUnit = value;
    notifyListeners();
  }

  //UnmodifiableListView<String> get fromUnitItem => UnmodifiableListView(this.fromUnitItem);

  //UnmodifiableListView<String> get toUnitItems => UnmodifiableListView(this._toUnitItems);

  double _answer ;

  // answer value starts here
  get answer => _answer;

//set method for answer value
  set answer(value) {
    _answer = value;
    notifyListeners();
  }


  void convertCMtoMM(double value) {
    if (value > 0)  {
      _answer =  value* 10;
    }
    notifyListeners();
  }

  void convertMMtoCM(double value) {
    _answer = (0.1 * value) ;
    notifyListeners();
  }

  void convert (double values, String fromUnit, String toUnit ){
    if( (fromUnit == fromUnitItems[0])&& (toUnit == toUnitItems[0] )){
      _answer = (values) ;
      notifyListeners();
    }
    else if ((fromUnit == fromUnitItems[0])&& (toUnit == toUnitItems[1] )){
      _answer = (0.1 * values) ;
      notifyListeners();
    }
    else if ((fromUnit == fromUnitItems[0])&& (toUnit == toUnitItems[2] )){
      _answer = (0.01 * values) ;
      notifyListeners();
    }
    else if ((fromUnit == fromUnitItems[0])&& (toUnit == toUnitItems[3] )){
      _answer = (0.001 * values) ;

      notifyListeners();
    }
    else if ((fromUnit == fromUnitItems[0])&& (toUnit == toUnitItems[4] )){
      _answer = (0.0001 * values) ;

      notifyListeners();
    }
    else {
      _answer =  0 ;
      notifyListeners();
    }

    void dispose(){
      _answer=0;
      _question='${0}';
      super.dispose();
      notifyListeners();

    }
  }



}
