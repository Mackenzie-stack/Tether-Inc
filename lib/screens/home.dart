import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/authentication.dart';
import 'package:flutter_firebase_auth/models/user.dart';
import 'package:flutter_firebase_auth/providers/database_provider.dart';
import 'package:flutter_firebase_auth/screens/sell_gift_card_screen.dart';
import 'package:flutter_firebase_auth/screens/sell_usdt_page.dart';
import 'package:flutter_firebase_auth/services/database.dart';
import 'package:flutter_firebase_auth/widgets/app_bar.dart';
import 'package:flutter_firebase_auth/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';
import '../widgets/card_widget.dart';
import 'custom_app_bar.dart';
import 'login.dart';
import '../widgets/topviewcard.dart';

class Home extends StatelessWidget {
  AuthenticationHelper _auth = AuthenticationHelper();

  @override
  Widget build(BuildContext context) {
   // final brews = Provider.of<QuerySnapshot>(context);
    Size size = MediaQuery.of(context).size;

//final dBprovider = Provider.of<DataBaseProvider>(context);
final provy = Provider.of<List<ModelUser>>(context);


// final dBprov = Provider.of<List<ModelUser>>(context);
// final  _userStream =FirebaseFirestore.instance.collection('User Data').doc('uid').snapshots();
//     //DataBaseService dbserve = DataBaseService();

//  return StreamBuilder<DocumentSnapshot>(
//       stream: _userStream,
//         builder: (context, snapshot) {
// if (snapshot.hasData){}
// List<DocumentSnapshot> documents = snapshot.data.docs;
// List<ModelUser> items =[];
// for(var i =0; i< documents.length;i++){
//   DocumentSnapshot  document = documents[i];
//   items.add(ModelUser.fromMap(document.data()));
// }

//}

    return Scaffold(

          drawer: drawer_widget(),
          appBar: CustomAppBar(
            backgroundColor: Colors.blue,

          ),
          body:
       // (provy != null) ?
          SafeArea(
          child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
          //SizedBox(height: 1,),
          // cardWidgetContainer(size: size),
          Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
          ' Choose What You Want To Do',
          style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          ),
          ),
          ),
          Flexible(
          child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 15, right: 15),
          children: [
          CardWidget(
          iconn: CryptoFontIcons.USDT,
          textForIcon: 'Sell USDT',
          // route:  MaterialPageRoute(builder: (builder) => SellUsdtPage()),
          onPressed: () {

          bool _isSelected = true;
print('${provy.toString()}');
          if (provy[1].isSubscribed= false) {
            Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (contex) => SellUsdtPage()));
          } else {
            _showDialog(context);
          }
          },
          coloor: Colors.black,
          ),
          //'/sell-usdt',),

          CardWidget(
          iconn: CryptoFontIcons.SLS,
          textForIcon: 'Buy USDT',
          coloor: Colors.blue,
          ),
          CardWidget(
          //  Icon(CryptoFontIcons.BTC_ALT,
          iconn: CryptoFontIcons.ETC,
          textForIcon: 'Refill Wallet',
          coloor: Colors.blue,
          ),
          CardWidget(
          iconn: Icons.account_box_sharp,
          textForIcon: 'Sell Gift Card',
          onPressed: () {

          Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (contex) => SellGiftCard()));

          },
          coloor: Colors.black87),
          ],
          ))
          ],
          ),
          ),
    // :  Container(child: CircularProgressIndicator()),


          floatingActionButton: FloatingActionButton(
          onPressed: () async {
          await _auth.signOut();
          // AuthenticationHelper().signOut().then((_) =>
          Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (builder) => Login()),
          (route) => false);

          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex) => Login()),
          //   ));
          },
          child: Icon(Icons.logout),
          tooltip: 'Logout',
          ),
          );
      //  }
   // );
  }

  AppBar buildAppBar() {
    return AppBar(
      // backgroundColor: Colors.blueAccent,
      title: Text(' Tether'),
      // leading: IconButton(
      //   icon: Icon(Icons.menu),
      //   onPressed: () { },
      // ),
      actions: <Widget>[
        // IconButton(
        //   icon: Icon(Icons.search),
        //   onPressed: () {},
        // ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],

      bottom: PreferredSize(
        preferredSize: Size.fromHeight(120),
        //Size.fromHeight(100.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: <Widget>[
              CardTopWidget(
                  account: 'Naira Account',
                  balance: '#0.00',
                  withdraw: 'Withdraw Funds>'),
              CardTopWidget(
                  account: 'Cedis Account',
                  balance: '#0.00',
                  withdraw: 'Withdraw Funds>')
            ],
          ),
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            elevation: 10,
            title: Text('Important '),
            content: Text('You Need to Subscribe to use to this Service?'
                '\n Do you wish to Subscribe ? '),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'YES',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'NO',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}



class cardWidgetContainer extends StatelessWidget {
  const cardWidgetContainer({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blueAccent,
      height: size.height * 0.2,
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(
            color: Colors.blueAccent,
          ),
          //width: 1,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10))
          // .circular(10), //.circular(10),
          ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CardTopWidget(
              account: 'Naira Account',
              balance: '#0.00',
              withdraw: 'Withdraw Funds >'),
          CardTopWidget(
              account: 'Cedis Account',
              balance: '#0.00',
              withdraw: 'Withdraw Funds >')
        ],
      ),
    );
  }

}
