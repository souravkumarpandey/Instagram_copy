import 'package:flutter/foundation.dart';


import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/resources/auth_method.dart';

class UserProvider with ChangeNotifier{
  User? _user;
  User? get getUser=>_user;
  final AuthMethods _authMethods= AuthMethods();

  Future<void> refreshuser() async{
    User user= await _authMethods.getUserdetails();
    _user= user;
    notifyListeners();
  }
}
// UserProvider with ChangeNotifier {

// User? _user;



// final AuthMethods _authMethods = AuthMethods();



// User? get getUser => _user;



// Future<void> refreshUser() async {

// User user = await _authMethods.getUserDetails();

// _user = user;

// notifyListeners();

// }

// }