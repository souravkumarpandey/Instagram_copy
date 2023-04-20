import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:instagram_clone/models/user.dart' as model;

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
class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
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
//     model.User? user= Provider.of<UserProvider>(context).getUser;
//     return user == null

// ? const Center(

// child: CircularProgressIndicator(

// ),)

// :

    return Scaffold(
      body: PageView(
        children: [
        Text('feed'),
        Text('search'),
        Text('add post'),
        Text('notification'),
        Text('profile'),
        ],
        physics:const  NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        ),
      bottomNavigationBar: BottomNavigationBar(
     
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _page == 0 ? primaryColor : secondaryColor,
            ),
            label: '',
             backgroundColor: mobileBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _page == 1 ? primaryColor : secondaryColor,
            ),
            label: '',
           
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: _page == 2 ? primaryColor : secondaryColor,
            ),
            label: '',
           
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: _page == 3 ? primaryColor : secondaryColor,
            ),
            label: '',
         
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _page == 4 ? primaryColor : secondaryColor,
            ),
            label: '',
            
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
