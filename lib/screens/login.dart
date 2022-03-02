import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_auth/authentication.dart';
import 'package:flutter_firebase_auth/providers/loading_provider.dart';
import 'package:flutter_firebase_auth/widgets/login_form_statefull_class.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'loading_page.dart';
import 'signup.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 //   final LoadingProvider loadingProvider =
        Provider.of<LoadingProvider>(context);

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
            SizedBox(height: 80),
          // logo
          Column(
            children: [
              FlutterLogo(
                size: 55,

              ),
              SizedBox(height: 50),
              Text(
                'Welcome back!',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),

          SizedBox(
            height: 50,
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LoginForm(),
          ),

          SizedBox(height: 20),

          Row(
            children: <Widget>[
              SizedBox(width: 30),
              Text('New here ? ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/signup');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                child: Text('Get Registered Now!!',
                    style: TextStyle(fontSize: 20, color: Colors.blue)),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container buildLogo() {
    // return Container(
    //   height: 80,
    //   width: 80,
    //   // padding: EdgeInsets.only(top: 20),
    //   decoration: BoxDecoration(
    //       borderRadius: BorderRadius.all(Radius.circular(10)),
    //       color: Colors.blue),
    //   child: Center(
    //     child: Text(
    //       "T",
    //       style: TextStyle(color: Colors.white, fontSize: 60.0),
    //     ),
    //   ),
    // );
  }
}
