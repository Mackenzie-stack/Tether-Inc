import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/models/user.dart';
import 'package:flutter_firebase_auth/services/database.dart';

class DataBaseProvider extends ChangeNotifier {
 final firestoreservie = DataBaseService();
 String uid;

 List _ml = [];

 List get ml  {
   getModeluser();
   return _ml;
   //notifyListeners();
 }

  Future<void> getModeluser () async{
  DocumentSnapshot dcs = await firestoreservie.usserCollection.doc(uid).get();
  var data = dcs.data() as Map;

  var tableData = data[uid] as List<dynamic>;
   tableData.forEach((element) {
  _ml.add(ModelUser.FromFireStore(element));
  notifyListeners();
   });}



  String _nairaAccountNuber;
  String _nairaAccountName;
  String _cedisAccountNumber;
  String _cedisAccountName;
  bool _isSubscribed;
  int _iud;

  String _bankName;
  String _accountNumber;
  String _accountName;

  String get nairaAccountNuber => _nairaAccountNuber;
  String get nairaAccountName => _nairaAccountName;
  String get cedisAccountNumber => _cedisAccountNumber;
  String get cedisAccountName => _cedisAccountName;
  bool get isSubscribed => _isSubscribed;
  String get bankName => _bankName;
 String get accountNumber => _accountNumber;
 String get accountName => _accountName;
 int get iud => _iud;


 changeNairaAccountName (String value){
_nairaAccountName =  value ;
    notifyListeners(); }

  changeNairaAccountNumber (String value){
    _nairaAccountNuber =  value ;
    notifyListeners(); }

  changeisSubscribed (bool value){
    _isSubscribed =  value ;
    notifyListeners(); }

    saveAccount(){
    var newProduct = ModelUser(
        bankName: bankName,
        accountName: accountName,
      accountNumber: accountNumber,
      iud: iud,
    );
    firestoreservie.saveAccount(newProduct);



  }


}