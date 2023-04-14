import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/Responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/Responsive/web_screen_layout.dart';
import 'package:instagram_clone/Screens/signup_screen.dart';
import 'package:instagram_clone/utils/colors.dart';

import 'Responsive/responsive_layout_screen.dart';
import 'Screens/login_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options:const FirebaseOptions(
      apiKey: 'AIzaSyCIBFcuDyP4HEoEPJ6cQrt_SK3QjsS11Hw',
      appId: "1:184614334957:web:4da6645babda3f5a6b37e4",
      messagingSenderId: "184614334957",
      projectId: "instagram-dub-f8479",
      storageBucket: "instagram-dub-f8479.appspot.com",
    ));
  } else{
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreen(),
      //   webScreenLayout: WebScreen(),
      // ),
      home :SignUpScreen(),
    );
  }
}
