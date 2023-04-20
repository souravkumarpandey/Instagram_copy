import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:instagram_clone/models/user.dart'as model;

// class MobileScreen extends StatefulWidget {
//   const MobileScreen({super.key});

//   @override
//   State<MobileScreen> createState() => _MobileScreenState();
// }

// class _MobileScreenState extends State<MobileScreen> {
//   String username = "";
//   @override
//   void initState() {
//     // TODO: implement initState

//     getUsername();
//   }

//   void getUsername() async {
//     DocumentSnapshot snap = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .get();
//     print(snap.data()) ;   
//     setState(() {
//       username=(snap.data()as Map<String,dynamic>)['username'];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('$username'),
//       ),
//     );
//   }
// }
class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    model.User? user= Provider.of<UserProvider>(context).getUser;
    return user == null

? const Center(

child: CircularProgressIndicator(

),)

: 

  Scaffold(
      body: Center(
        child: Text(user.email ),
      ),
    );
  }
}