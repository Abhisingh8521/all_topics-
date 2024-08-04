// import 'package:all_topics/views/users_detail_screens.dart';
// import 'package:all_topics/views/utils/app_constants.dart';
// import 'package:flutter/material.dart';
//
// import '../controller/http_services.dart';
// import '../model/api_model.dart';
// import 'add_users_with_sqflite.dart';
// import 'auth_screens/phone_auth_user_details.dart';
// import 'auth_screens/user_profile.dart';
//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// // Import your model and other necessary files
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   TextEditingController titleController = TextEditingController();
//   TextEditingController bodyController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AddUserScreen(),
//             ),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//       appBar: AppBar(
//         backgroundColor: AppConstant.appMainColor,
//         title: const Text("HomeScreen",style: TextStyle(color: Colors.white),),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: (String value) {
//               if (value == 'show_user') {
//
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => UserDetailsScreen(),
//                   ),
//                 );
//               } else if (value == 'profile') {
//
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => UserProfileScreens(),
//                   ),
//                 );
//               } else if (value == 'logout') {
//
//                 Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => PhoneSignUpScreen(),
//                   ),
//                       (route) => false,
//                 );
//               }
//             },
//             itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//               const PopupMenuItem<String>(
//                 value: 'show_user',
//                 child: ListTile(
//                   leading: Icon(Icons.account_circle),
//                   title: Text('Show User'),
//                 ),
//               ),
//               const PopupMenuItem<String>(
//                 value: 'profile',
//                 child: ListTile(
//                   leading: Icon(Icons.person),
//                   title: Text('Profile'),
//                 ),
//               ),
//               const PopupMenuItem<String>(
//                 value: 'logout',
//                 child: ListTile(
//                   leading: Icon(Icons.logout),
//                   title: Text('Logout'),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       body: FutureBuilder<List<PostsModel>>(
//         future: HttpServices.getPost(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(color: Colors.blue,),
//             );
//           }
//           if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           }
//           List<PostsModel> postList = <PostsModel>[];
//           postList.addAll(snapshot.data!);
//           return ListView.builder(
//             itemCount: postList.length,
//             itemBuilder: (context, index) {
//               return postItems(postList[index]);
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Widget postItems(PostsModel postsModel) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//         color: Colors.black12,
//       ),
//       margin: EdgeInsets.all(10),
//       padding: EdgeInsets.all(8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   postsModel.id.toString(),
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 Text(
//                   postsModel.title.toString(),
//                   style: TextStyle(fontSize: 12),
//                 ),
//                 Text(
//                   postsModel.body.toString(),
//                   style: TextStyle(fontSize: 9),
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             children: [
//               IconButton(
//                 onPressed: () {
//                   // Navigate to update dialog
//                   updateDialog(context, postsModel);
//                 },
//                 icon: Icon(
//                   Icons.edit,
//                   color: Colors.cyan,
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   // Delete post
//                   HttpServices.deletePost(postsModel.id ?? 1).then((value) {
//                     setState(() {});
//                   });
//                 },
//                 icon: Icon(
//                   Icons.delete,
//                   color: Colors.redAccent,
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
//   Future<void> updateDialog(BuildContext context, PostsModel postsModel) {
//     titleController.text = postsModel.title ?? "";
//     bodyController.text = postsModel.body ?? "";
//
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           child: Padding(
//             padding: const EdgeInsets.all(15),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextField(
//                   controller: titleController,
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.phone),
//                     filled: true,
//                     hintText: 'Enter title',
//                     fillColor: Color(0xffefefef),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 TextField(
//                   controller: bodyController,
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.phone),
//                     filled: true,
//                     hintText: 'Enter body',
//                     fillColor: Color(0xffefefef),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//
//                     if (mounted) {
//                       HttpServices.updatePost(
//                         postsModel.id ?? 1,
//                         titleController.text,
//                         bodyController.text,
//                       ).then((value) {
//                         Navigator.pop(context);
//                         setState(() {});
//                       });
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.cyan,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                   child: const Text(
//                     "Update",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
// }

import 'package:flutter/material.dart';
import '../controller/http_services.dart';
import '../model/api_model.dart';
import 'add_users_with_sqflite.dart';
import 'auth_screens/phone_auth.dart';
import 'auth_screens/user_profile.dart';
import 'users_detail_screens.dart';
import 'utils/app_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController titleController;
  late TextEditingController bodyController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    bodyController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppConstant.appMainColor,
        title: const Text(
          "HomeScreen",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          PopupMenuButton<String>(

            onSelected: (String value) {
              if (value == 'show_user') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailsScreen(),
                  ),
                );
              } else if (value == 'profile') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfileScreens(),
                  ),
                );
              } else if (value == 'logout') {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SendOtpScreen(),
                  ),
                      (route) => false,
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'show_user',
                child: ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Show User',),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'profile',
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'logout',
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: FutureBuilder<List<PostsModel>>(
        future: HttpServices.getPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }
          List<PostsModel> postList = <PostsModel>[];
          postList.addAll(snapshot.data as Iterable<PostsModel>);
          return ListView.builder(
            itemCount: postList.length,
            itemBuilder: (context, index) {
              titleController.text = postList[index].title!;
              bodyController.text = postList[index].body!;
              return postItems(postList[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(

        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddUserScreen(),
            ),
          );
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }

  Widget postItems(PostsModel postsModel) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.black12,
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  postsModel.id.toString(),
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  postsModel.title.toString(),
                  style: const TextStyle(fontSize: 15),
                ),
                Text(
                  postsModel.body.toString(),
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  updatePostDialog(context, postsModel);
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.cyan,
                ),
              ),
              IconButton(
                onPressed: () {
                  addPostDialog(context);
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.cyan,
                ),
              ),
              IconButton(
                onPressed: () async {
                  String res = await HttpServices.deletePost(postsModel.id);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('$res'),
                  ));
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> updatePostDialog(
      BuildContext context, PostsModel postsModel) async {
    titleController.text = postsModel.title!;
    bodyController.text = postsModel.body!;
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Update",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    filled: true,
                    hintText: 'Enter title',
                    fillColor: Color(0xffefefef),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: bodyController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    filled: true,
                    hintText: 'Enter body',
                    fillColor: Color(0xffefefef),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    postsModel.title = titleController.text;
                    postsModel.body = bodyController.text;
                    String res = await HttpServices.patchPost(postsModel);
                    bodyController.clear();
                    titleController.clear();
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('$res'),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Update",
                    style: TextStyle(color: Colors.white),
                  ),
                )

              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> addPostDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    filled: true,
                    hintText: 'Enter title',
                    fillColor: Color(0xffefefef),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: bodyController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    filled: true,
                    hintText: 'Enter body',
                    fillColor: Color(0xffefefef),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    String res = await HttpServices.createPost(PostsModel(
                        body: bodyController.text,
                        title: titleController.text,
                        userId: 1));
                    bodyController.clear();
                    titleController.clear();
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('$res'),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Post",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

