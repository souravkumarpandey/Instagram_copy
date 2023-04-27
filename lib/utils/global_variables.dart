import 'package:flutter/material.dart';
import 'package:instagram_clone/Screens/add_post_screen.dart';
import 'package:instagram_clone/Screens/feed_Screen.dart';
import 'package:instagram_clone/Screens/search_screen.dart';

const webScreenSize= 600;

const homeScreenItem=[
        FeedScreen(),
        SearchScreen(),
         AddPostScreen(),
        Text('notification'),
        Text('profile'),];