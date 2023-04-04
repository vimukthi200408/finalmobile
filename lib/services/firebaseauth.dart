import 'package:finalmobile/services/data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:finalmobile/models/user.dart';

class FireBaseAuth{

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  //
  // Bser? userGotFromFirebase(User? user) {
  //   return user !=null ? Bser(uid: user.uid) : null;
  // }
  //
  //
  // //auth change user stream
  //
  //
  // Stream<Bser> get user{
  //   return _auth.authStateChanges()
  //       .map((User? user) => userGotFromFirebase(user));
  // }


  //chats

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Bser userGotFromFirebase(User? user) {
    print('daft');
    print(user);
    print('daft');
    return user != null ? Bser(uid: user.uid) : throw Exception("User i null");
  }

  Stream<Bser> get user {
    print('siren');
    print(_auth.authStateChanges().map(userGotFromFirebase));
    print('siren');
    return _auth.authStateChanges().map(userGotFromFirebase);
  }







  //sign in anon

  Future anonSign() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      print('atten');
      print(user?.uid);
      return userGotFromFirebase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //sign in with email and password
  Future Signingin(String username,String password) async{
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: username, password: password);
      User? user = result.user;
      return userGotFromFirebase(user);
    }catch(e){
      print(e.toString());
      return null;

    }

  }


  //register with email and password
  Future Registering(String username,String password) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: username, password: password);
      User? user = result.user;


      //await Database(uid: user!.uid).updateData('0', 'new leaf member', 100);
      return userGotFromFirebase(user);
    }catch(e){
      print(e.toString());
      return null;

    }

  }

  //sign out
  Future signingOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }


}
