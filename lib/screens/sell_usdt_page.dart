import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_auth/authentication.dart';
import 'package:flutter_firebase_auth/screens/sell_dialog_page.dart';
import 'package:flutter_firebase_auth/widgets/app_bar.dart';
import 'package:flutter_firebase_auth/widgets/channel_widget.dart';
import 'package:flutter_firebase_auth/widgets/drawer_widget.dart';
import 'package:flutter_firebase_auth/widgets/row_for_min_amount.dart';
import 'package:flutter_firebase_auth/widgets/text_for-normal_display.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'home.dart';

class SellUsdtPage extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBars(),
        drawer: drawer_widget(),

        body: SafeArea(
      child: SingleChildScrollView(
        child: Card(
          elevation: 10,
          shadowColor: Colors.blueAccent,
          //color: Colors.blueAccent[100],
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  'Sell USDT',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),


            Container(
              height: size.height / 3,
              width: size.width - 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.blueGrey,
                    width: 3,
                  )),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8),
                        child: TextForNormalDisplay(text: 'Sell Instructions'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 5.0),
                      child: Text(
                        '1.  Send USDT to the Wallet Address Provided \n '
                        '\n2.Proceed to the Submit ScreenShot of the USDT \ sent'
                        '\n \n3. Wait for approval from Admin'
                        '\n \n4. Your wallet will be credited once verified',
                        textAlign: TextAlign.left,
                        // maxLines: 5,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueAccent
                        ),
                      ),
                    ),
                  ]),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Container(
                height: size.height / 7,
                width: size.width - 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.blueGrey,
                      style: BorderStyle.solid,
                      width: 3,

                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextForNormalDisplay(text: 'Important '),
                    MinAmountAndRateRow(minAmountandrate: 'Minimum Sell Amount',amount: 'USD 100'),
                    MinAmountAndRateRow(minAmountandrate: 'Rate',amount: 'USD1 = N100'),


                  ],
                ),
              ),
            ),
            FormBuilder(
                key: _formKey,
                //autovalidate: true,
                child: Column(children: <Widget>[])),
// FormBuilderTextField(
//   name: 'Amount',
//   initialValue: 'USD 100',
//
// ),

            Container(
              alignment: Alignment.topLeft,
              height: size.height / 3,
              width: size.width - 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.blueGrey,
                    style: BorderStyle.solid,
                    width: 3,
                  )),
              child: Column(

                //crossAxisAlignment: CrossAxisAlignment.center,
               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextForNormalDisplay(text: 'Our Wallets '),
                  ChannelIDWidget(walletId: 'Exrkoj45jjfkf234443cv', channel: 'ERC20 :',),
                  ChannelIDWidget(walletId: 'T5Toj45jjfkf445433ccf', channel: 'TRC20 :',),
                  ChannelIDWidget(walletId: 'FFMFKkoj45jjfkfddfdef', channel:'BEP2:',),
                  ChannelIDWidget(walletId: 'FFFFj45jjfkfddddfdfre', channel: 'BEP20 :',)
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Text('ECRN :'),
                  //     Text(quote),
                  //     IconButton(
                  //         onPressed: () {
                  //           final snackBar = SnackBar(
                  //             content: Text('Copied to ClipBoard'),
                  //             action: SnackBarAction(
                  //               label: 'Undo',
                  //               onPressed: () {},
                  //             ),
                  //           );
                  //           Clipboard.setData(ClipboardData(text: quote)).then(
                  //               (value) => ScaffoldMessenger.of(context)
                  //                   .showSnackBar(snackBar));
                  //         },
                  //         icon: Icon(Icons.copy_outlined)),
                  //   ],
                  // ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Row(
              // mainAxisAlignment: MainAxisAlignment.,
              children: [
                Expanded(
                  child: MaterialButton(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      "Proceed To Submit Proof >>",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        print(_formKey.currentState.value);
                      } else {
                        print("validation failed");
                      }
                      showDialog(context: context, builder: (BuildContext)=> SellDialogPage(
                        title: "Well Done",
                        description:
                        "You have sucessfully implemented Custom Dialog with flutter. "
                            "\\n You have also learned theory behind and how to customize it further.",
                        buttonText: "Close",
                      ));

                    },
                  ),
                ),
                SizedBox(height: 20),
                // Expanded(
                //   child: MaterialButton(
                //     color: Theme.of(context).colorScheme.secondary,
                //     child: Text(
                //       "Reset",
                //       style: TextStyle(color: Colors.white),
                //     ),
                //     onPressed: () {
                //       _formKey.currentState.reset();
                //     },
                //   ),
                // ),
              ],
            ),
            SizedBox(height: 50),

          ]),
        ),
      ),
    ));
  }
}
