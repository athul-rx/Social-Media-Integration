// ignore_for_file: unused_field, unused_local_variable, empty_catches, use_rethrow_when_possible, avoid_print, unnecessary_new, prefer_typing_uninitialized_variables, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices{
     
     final _auth = FirebaseAuth.instance;
     final _googleSignIn=GoogleSignIn();
    
      
     
       var userDetails;

     signInWithGoogle() async 
     {

        try{
            final GoogleSignInAccount? googleSignInAccount=await _googleSignIn.signIn(); 
        if(googleSignInAccount != null){
          final GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
         final AuthCredential authCredential=GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,

         );
         await _auth.signInWithCredential(authCredential);
        }
        
        }on FirebaseAuthException catch (e) {
          print(e.message);
          return;
        }
     }

      signInWithFacebook() async{
        final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.success) {
      var _accessToken = loginResult.accessToken;
      final userInfo = await FacebookAuth.instance.getUserData();
       userDetails= userInfo;
      return userDetails;
    } else {
      print('ResultStatus: ${loginResult.status}');
      print('Message: ${loginResult.message}');
    }
      }
     
     

    signOut() async {
      await FacebookAuth.instance.logOut();
      await _auth.signOut();
      await _googleSignIn.signOut();
      
    }
}
