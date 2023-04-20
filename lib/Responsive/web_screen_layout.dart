import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import 'package:instagram_clone/models/user.dart'as model;

class WebScreen extends StatelessWidget {
  const WebScreen({super.key});

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
        child: Text(user.bio
         ),
      ),
    );
  }
}
