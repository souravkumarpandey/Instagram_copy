import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List following;
  final List followers;

  User({
    required this.username,
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.bio,
    required this.following,
    required this.followers,
  });
  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'bio': bio,
        'photoUrl': photoUrl,
        'followers': [],
        'following': [],
      };
  static User fromsnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      email: snapshot['email'],
      uid: snapshot['uid'],
      photoUrl:snapshot['photoUrl'],
      username: snapshot['username'],
      bio:snapshot['bio'],
      following: snapshot['following'],
      followers: snapshot['followers'],
    );
  }
}
