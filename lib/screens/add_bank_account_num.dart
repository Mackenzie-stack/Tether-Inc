import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/providers/database_provider.dart';
import 'package:provider/provider.dart';

class AddBankAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providerFor = Provider.of<DataBaseProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Row(
          children: <Widget>[

            TextField(decoration: InputDecoration(hintText: 'Account Name'),),
            TextField(decoration: InputDecoration(hintText: 'Account Number'),),
            TextField(decoration: InputDecoration(hintText: 'Bank Name'),),
            TextButton(
                onPressed: (){},
                child: Text('Submit')
            ),

          ],
        ),
      ),
    );
  }
}
