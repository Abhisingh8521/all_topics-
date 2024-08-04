// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import '../../model/user_model.dart';
// import '../views/home_screens.dart';
//
// class SignUpController extends GetxController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<void> addUserToFirestore(String name, String email, String gender) async {
//     try {
//       User? user = _auth.currentUser;
//       if (user != null) {
//         EasyLoading.show(status: 'Signing Up...');
//
//         UserModel userModel = UserModel(
//           uId: user.uid,
//           name: name,
//           email: email,
//           gender: gender,
//         );
//         Map<String, dynamic> userData = userModel.toMap();
//         await FirebaseFirestore.instance.collection('users').doc(user.uid).set(userData);
//
//         EasyLoading.dismiss();
//
//         Fluttertoast.showToast(
//           msg: "Sign Up Successful",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           backgroundColor: Colors.green,
//           textColor: Colors.white,
//         );
//
//         Get.offAll(HomeScreen());
//       }
//     } catch (e) {
//       EasyLoading.dismiss();
//       Fluttertoast.showToast(
//         msg: "Sign Up Failed! $e",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//       );
//     }
//   }
// }
