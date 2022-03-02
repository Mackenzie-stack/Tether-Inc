import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth/models/user.dart';
import 'package:flutter_firebase_auth/services/database.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final storage = new FlutterSecureStorage();
  final DataBaseService db = DataBaseService();

  get user {
    return _auth.currentUser;
  }

//SIGN UP METHOD
  Future<String> signUp({String email, String password}) async {
    try {
       await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,);
       // User user = result.user;
      await DataBaseService(uid: user.uid ).updateUserdata
        ('0000000000',
          'NairaAccountName',
          '0000000000',
          'CedisAccount',
          true ,
        'First Bank',
        'Mackie',
        '3056276328',
      );
      return null;
    }
    on FirebaseAuthException catch (error) {
      return error.message;
    }
  }

  //SIGN IN METHOD

  Future<String> signIn({String email, String password}) async {
    try {
      UserCredential userCredential =
      await _auth.signInWithEmailAndPassword( email: email, password: password);
      storeTokenAndData(userCredential);
     // db.getProduct();
      return null;
    }
    on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // METHOD TO STORE THE USER'S LOGG IN TOKEN
  Future<void> storeTokenAndData(UserCredential userCredential) async {
    await storage.write( key: 'token', value: userCredential.credential.token.toString());
    await storage.write(key: 'userCredential', value: userCredential.toString());
  }

  //SIGN OUT METHOD
  Future<void> signOut() async {
   try{
    await _auth.signOut();
    await storage.delete(key: 'token');
    print('signout');
  } catch(e){}
  }

  Future<String> getToken() async {
    return await storage.read(key: 'token');
  }
}
