import 'package:flutter/material.dart';
import 'package:instagram_clone/Responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/Responsive/web_screen_layout.dart';
import 'package:instagram_clone/utils/colors.dart';

import 'Responsive/responsive_layout_screen.dart';

void main() {
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
      home: const ResponsiveLayout(mobileScreenLayout: MobileScreen(),webScreenLayout:WebScreen(),),
    );
  }
}
