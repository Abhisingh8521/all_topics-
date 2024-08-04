// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// //
// //
// //
// // class LetsStartScreen extends StatefulWidget {
// //   const LetsStartScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   State<LetsStartScreen> createState() => _LetsStartScreenState();
// // }
// //
// // class _LetsStartScreenState extends State<LetsStartScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Container(
// //           height: 50,
// //           width: 50,
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(25),
// //             color: const Color(0xFFF5F6FA),
// //           ),
// //           child: const Icon(Icons.keyboard_backspace_outlined, color: Colors.black),
// //         ),
// //       ),
// //       body: Column(
// //         children: [
// //           Center(
// //             child: const Text(
// //               'Let’s Get Started',
// //               style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
// //             ),
// //           ),
// //           SizedBox(height: MediaQuery.of(context).size.height * .3,),
// //           Column(
// //             children: [
// //               SizedBox(height: 14,),
// //               Padding(
// //                 padding: const EdgeInsets.only(right: 10,left: 10),
// //                 child: MaterialButton(
// //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //                   height: 55,
// //                   elevation: 5,
// //                   color: Color(0xff1DA1F2),
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     crossAxisAlignment: CrossAxisAlignment.center,
// //                     children: [
// //                       Image.asset("assets/images/googel_icon.png",height: 20,),
// //                       SizedBox(width: 14,),
// //                       Text("Google",style: TextStyle(fontSize: 18,color: Colors.white))
// //                     ],
// //                   ),
// //                   onPressed: (){},
// //                 ),
// //               ) ,
// //               SizedBox(height: 14,),
// //               Padding(
// //                 padding: const EdgeInsets.only(right: 10,left: 10),
// //                 child: MaterialButton(
// //                   height: 55,
// //                   elevation: 5,
// //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //                   color: Color(0xffEA4335),
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     crossAxisAlignment: CrossAxisAlignment.center,
// //                     children: [
// //                       Icon(Icons.phone_android,color: Colors.white,),
// //                       SizedBox(width: 10,),
// //                       Text("Phone",style: TextStyle(fontSize: 18,color: Colors.white),)
// //                     ],
// //                   ),
// //                   onPressed: (){},
// //                 ),
// //               )
// //             ],
// //           ),
// //           const Spacer(), // Added to push the "Send Below this text" message to the bottom
// //           Row(
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Text("Already have an account? ",style: TextStyle(fontSize: 15,color: Color(0xff8F959E)),),
// //               InkWell(
// //                   onTap: () {},
// //                   child: Text("Signin",style: (TextStyle(fontSize: 15,color: Color(0xff1D1E20),fontWeight: FontWeight.w600)),)),
// //             ],
// //           ),
// //           SizedBox(height: 30,),
// //         ],
// //       ),
// //       bottomNavigationBar: MaterialButton(
// //         height: 65,
// //         color: Color(0xff9775FA),
// //         child: Text("Create an Account",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 18,fontWeight: FontWeight.bold,letterSpacing: 1),),
// //         onPressed: (){
// //           //Get.off(SignupScreen());
// //         },
// //       ),
// //     );
// //   }
// // }
//
//
// signup Screen                                                                                                                                                                                                                                      import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shopee_user/views/screens/auth/email_auth/signing_screen.dart';
// import 'package:shopee_user/views/utils/app_extensions/app_extensions.dart';
//
// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});
//
//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   bool isPrimaryAddress = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:AppBar(
//         title: Container(
//           height: 50,
//           width: 50,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(25),
//             color: const Color(0xFFF5F6FA),
//           ),
//           child: const Icon(Icons.keyboard_backspace_outlined, color: Colors.black),
//         ),
//       ),
//       body:
//       Column(
//         children: [
//           Center(
//             child: const Text(
//               'Sign Up',
//               style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(height: MediaQuery.of(context).size.height * .3,),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 15),
//                 child: Text("Username",style: TextStyle(color: Color(0xff8F959E)),),
//               ),
//               //10.height,
//               Padding(
//                 padding: const EdgeInsets.only(left: 15,right: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("Hemendra Mali",style: TextStyle(fontSize: 15,color: Color(0xff1D1E20)),),
//                     Icon(Icons.call_missed_outgoing,color: Colors.green,)
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 16,right: 16),
//                 child: Divider(),
//               ),
//             ],
//           ) ,
//           10.height,
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 15),
//                 child: Text("Password",style: TextStyle(color: Color(0xff8F959E)),),
//               ),
//               10.height,
//               const Padding(
//                 padding: EdgeInsets.only(left: 15,right: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("Hemendra Mali",style: TextStyle(fontSize: 15,color: Color(0xff1D1E20)),),
//                     Text("Strong",style: TextStyle(fontSize: 13,color: Colors.green,),),
//
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 16,right: 16),
//                 child: Divider(),
//               ),
//             ],
//           ),
//           10.height,
//           Column(`
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 15),
//                 child: Text("Username",style: TextStyle(color: Color(0xff8F959E)),),
//               ),
//               10.height,
//               Padding(
//                 padding: const EdgeInsets.only(left: 15,right: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("Hemendra Mali",style: TextStyle(fontSize: 15,color: Color(0xff1D1E20)),),
//                     Icon(Icons.call_missed_outgoing,color: Colors.green,)
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 16,right: 16),
//                 child: Divider(),
//               ),
//             ],
//           ),
//           20.height,
//           Padding(
//             padding: const EdgeInsets.only(left: 15,right: 15),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Remember me"),
//                   SizedBox(width: 4),
//                   Switch(
//                     value: isPrimaryAddress,
//                     activeColor: Colors.green,
//                     onChanged: (value) {
//                       setState(() {
//                         isPrimaryAddress = value;
//                       });
//                     },
//                   ),
//                 ]
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: MaterialButton(
//         height: 65,
//         color: Color(0xff9775FA),
//         child: Text("Sign Up",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 18,fontWeight: FontWeight.bold,letterSpacing: 1),),
//         onPressed: (){
//           Get.off(SigningScreen());
//         },
//       ),
//     );
//   }
// }