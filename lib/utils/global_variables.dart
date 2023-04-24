import 'package:flutter/material.dart';
import 'package:instagram_clone/Screens/add_post_screen.dart';
import 'package:instagram_clone/Screens/feed_Screen.dart';

const webScreenSize= 600;

const homeScreenItem=[
        FeedScreen(),
        Text('search'),
         AddPostScreen(),
        Text('notification'),
        Text('profile'),];