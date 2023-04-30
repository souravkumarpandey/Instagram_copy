import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user.dart'as model;
import 'package:instagram_clone/resources/storage_method.dart';
class AuthMethods{
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final FirebaseFirestore _firestore= FirebaseFirestore.instance;
  
Future<model.User> getUserdetails() async{
     User currentUser =_auth.currentUser!;
     DocumentSnapshot snap= await _firestore.collection('users').doc(currentUser.uid).get();
     return model.User.fromsnap(snap);
}
  

  //sign up the user
  Future<String> signUpuser({
      required String email,
      required String password,
      required String username,
      required String bio,
      required Uint8List file,
  }) async{
     String res= "Some error occur";
     try{
       if(email.isNotEmpty ||password.isNotEmpty||username.isNotEmpty|| bio.isNotEmpty ){
        UserCredential cred=await _auth.createUserWithEmailAndPassword(email: email, password: password);
        // add user to data base;

        print(cred.user!.uid);
        String photoUrl= await StorageMethods().uploadImageToStorage('profilePics', file, false);

        model.User user= model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          bio:bio,
          photoUrl: photoUrl,
          following: [],
          followers: [],
        );


      await _firestore.collection('users').doc(cred.user!.uid).set(
        user.toJson(),
        );

        // await _firestore.collection('users').doc(cred.user!.uid).set({
        //   'username':username,
        //    'uid':cred.user!.uid,
        //    'email': email,
        //    'bio': bio,
        //    'followers':[],
        //    'following':[],
        //    'photoUrl':photoUrl,
        // },);
        //
        res= "success";
       }
     }
     catch(err){
       res= err.toString();
     }
     return res;
  }
  //  login user
  Future<String> loginUser({
    required String email,
    required String password,
  })async{
    String res= 'some error occur';
    try{
       if(email.isNotEmpty|| password.isNotEmpty){
       await _auth.signInWithEmailAndPassword(email: email, password: password);
       res='success';
       }else{
       
       }
    }catch(err){
      res=err.toString();
    }
    return res;
  }

 Future<void> signOut() async{
  await _auth.signOut();
 }
}