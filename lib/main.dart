import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/authentication.dart';
import 'package:flutter_firebase_auth/providers/database_provider.dart';
import 'package:flutter_firebase_auth/screens/sell_usdt_page.dart';
import 'package:flutter_firebase_auth/screens/splash_screen.dart';
import 'package:flutter_firebase_auth/services/database.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:provider/provider.dart';
import 'providers/loading_provider.dart';
import 'screens/login.dart';

import 'screens/home.dart';
import 'screens/sell_gift_card_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myApp());
  //FlutterNativeSplash.removeAfter(initialization);

}
class myApp extends StatefulWidget {
  //myApp({Key: Key}): super(key: Key);

  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  Widget currentPage = Login();
  StreamSubscription<User> user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // checkLogin();
    // user = FirebaseAuth.instance.authStateChanges().listen((user) {
    //   if (user == null) {
    //     print('Useris logged in');
    //   }
    //   else {
    //     print('User is signedout');
    //   }
    // });
  }


  void dispose(){
    user.cancel();
    super.dispose();

  }
  // A VOID METHOD TO CHECK IF THE USER IS LOGGED IN
  void checkLogin() async{
    AuthenticationHelper  authClass = AuthenticationHelper();
    String token = await authClass.getToken();
    if(token!= null){
      setState(() {
        currentPage= Home();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
final  dbs = DataBaseService();

    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => DropDownConvertProvider()),
        ChangeNotifierProvider(create: (_) => LoadingProvider()),
        ChangeNotifierProvider(create: (_) => DataBaseProvider()),
      StreamProvider(create: (context) => DataBaseService().getProduct()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "Vazir",
          primaryColor: Color(0xff075e54),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.blueAccent),


          ),
          iconTheme: IconThemeData(size: 36.0, color: Colors.black87), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Color(0xff25d366)),

        ),
        initialRoute: FirebaseAuth.instance.currentUser== null? '/login' :  '/home',
        routes: {
          //'/splashScreen': (context)=> SplashScreen(),
          "/home": (context)=> Home(),
          "/login": (context)=> Login(),
          '/sell-usdt': (context)=> SellUsdtPage(),
          '/sell-usdt': (context)=> SellGiftCard(),
        },
        home: Home(),
      ),
    );
  }
}






























// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_firebase_auth/provider_non.dart';
// import 'package:flutter_firebase_auth/wrapper_authentication.dart';
// import 'package:provider/provider.dart';
// import 'login.dart';
//
// Future<void> main() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     await Firebase.initializeApp();
//   runApp(MyApp(),
//    // ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return  MultiProvider(
//       providers:[
//         Provider (create: (_) => TextEditingNotifier()),
//       ],
//       child: MaterialApp(
//         // routes: {
//         //   '/length': (context)=> LenghtPage(),
//         //   "/Mass": (context)=> Mass_Ui_Page(),
//         // },
//         debugShowCheckedModeBanner: false,
//         title: 'Provider Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.green,
//         ),
//         home: WrapperForStateFullWidget(),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//
//       ],
//       child: MaterialApp(
//         title: 'Flutter auth Demo',
//         home: Login(),
//       ),
//     );
//   }
// }



//
// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_firebase_auth/login.dart';
// import 'package:flutter_firebase_auth/signup.dart';
// import 'package:provider/provider.dart';
//
// import 'home.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         // 2
//         Provider<AuthenticationService>(
//           create: (_) => AuthenticationService(FirebaseAuth.instance),
//         ),
//         // 3
//         StreamProvider(
//           create: (context) => context.read<AuthenticationService>().authStateChanges,
//           initialData: null,
//         )
//       ],
//       child: MaterialApp(
//         title: 'Flutter Firebase Auth',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//             visualDensity: VisualDensity.adaptivePlatformDensity,
//             primaryColor: Colors.indigoAccent
//         ),
//         initialRoute: '/',
//         routes: {
//           '/': (context) => Splash(),
//           '/auth': (context) => AuthenticationWrapper(),
//           '/signin': (context) => Login(),
//           '/signup': (context) => Signup(),
//           '/home': (context) => Home(),
//         },
//       ),
//     );
//   }
//
//
// void didChangeDependencies() {
//   super.didChangeDependencies();
//   Timer(const Duration(milliseconds: 2000), () {
//     //TODO: Change to Auth
//     Navigator.pushNamed(
//       context,
//       '/auth',
//     );
//   });
// }

//
//
// class AuthenticationWrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final firebaseuser = context.watch<User>();
//     if (firebaseuser != null) {
//       return Home();
//     }
//     return Login()();
//   }
// }