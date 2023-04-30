import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/global_variables.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import 'package:instagram_clone/models/user.dart'as model;

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  
  int _page = 0;
  late PageController pageController=PageController();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    pageController=PageController();
  }
  void onPageChanged(int page){
    setState(() {
      _page=page;
    });
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  void navigationTapped(int page){
pageController.jumpToPage(page);
  }
  Widget build(BuildContext context) {
   model.User? user= Provider.of<UserProvider>(context).getUser;
    return user == null

? const Center(

child: CircularProgressIndicator(

),)

: 

  Scaffold(
         appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: SvgPicture.asset(
          'assets/ic_instagram.svg',
          color: primaryColor,
          height: 32,
        ),
        actions: [
          IconButton(
            
            icon:  Icon(
              Icons.home,
               color: _page == 0 ? primaryColor : secondaryColor,
            ),
            onPressed :()=> navigationTapped(0),
          ),
          IconButton(
           onPressed :()=> navigationTapped(1),
            icon:  Icon(
              Icons.search_outlined,
               color: _page == 1 ? primaryColor : secondaryColor,
            ),
          ),
          IconButton(
           onPressed :()=> navigationTapped(2),
            icon:  Icon(
              Icons.add_a_photo,
               color: _page == 2 ? primaryColor : secondaryColor,
            ),
          ),
          IconButton(
           onPressed :()=> navigationTapped(3),
            icon:  Icon(
              Icons.favorite,
                 color: _page == 3 ? primaryColor : secondaryColor,
            ),
          ),
          IconButton(
        onPressed :()=> navigationTapped(4),
            icon:  Icon(
              Icons.person,
                 color: _page == 4 ? primaryColor : secondaryColor,
            ),
          ),
        ],
        
      ),
      body: PageView(
        physics:const  NeverScrollableScrollPhysics(),
        children: homeScreenItems,
        controller: pageController,
        onPageChanged: onPageChanged,

      ),
    );
  }
}
