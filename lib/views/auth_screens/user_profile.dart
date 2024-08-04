import 'package:all_topics/views/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/user_model.dart';

class UserProfileScreens extends StatefulWidget {
  const UserProfileScreens({Key? key}) : super(key: key);

  @override
  State<UserProfileScreens> createState() => _UserProfileScreensState();
}

class _UserProfileScreensState extends State<UserProfileScreens> {
  late Stream<DocumentSnapshot> userDataStream;

  @override
  void initState() {
    super.initState();
    userDataStream = fetchUserData();
  }

  Stream<DocumentSnapshot> fetchUserData() {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        return FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .snapshots();
      } else {
        throw "User is not logged in";
      }
    } catch (e) {
      print("Error fetching user data: $e");
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          'User Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600),
                child: StreamBuilder<DocumentSnapshot>(
                  stream: userDataStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      UserModel userData = UserModel.fromMap(
                          snapshot.data!.data() as Map<String, dynamic>);
                      return Column(
                        children: [
                          SizedBox(height: 25,),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(8),
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 60,
                              child: Icon(Icons.person, size: 90,color: Colors.white70,),
                            ),
                          ),
                          SizedBox(height: 40,),
                          Card(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text('Name',style: TextStyle(fontWeight: FontWeight.w900),),
                                  subtitle: Text(userData.name ?? ""),
                                ),
                                ListTile(
                                  title: Text('Email',style: TextStyle(fontWeight: FontWeight.w900),),
                                  subtitle: Text(userData.email ?? ""),
                                ),
                                ListTile(
                                  title: Text('Gender',style: TextStyle(fontWeight: FontWeight.w900),),
                                  subtitle: Text(userData.gender ?? ""),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
