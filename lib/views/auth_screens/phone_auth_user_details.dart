import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import '../../model/user_model.dart';
import '../home_screens.dart';
import '../utils/app_constants.dart';
import '../widgets/textfield_widgets.dart';

class PhoneSignUpScreen extends StatefulWidget {
  PhoneSignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<PhoneSignUpScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userGender = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> addUserToFirestore(String name, String email, String gender) async {
    try {
      EasyLoading.show(status: "Please wait..");
      User? user = _auth.currentUser;
      if (user != null) {

        UserModel userModel = UserModel(
          uId: user.uid,
          name: name,
          email: email,
          gender: gender,
        );
        Map<String, dynamic> userData = userModel.toMap();
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set(userData);

        EasyLoading.dismiss();


        Fluttertoast.showToast(
          msg: "Sign Up Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } catch (e) {
      EasyLoading.dismiss();
      Fluttertoast.showToast(
        msg: "Sign Up Failed! $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: const Text(
          "Sign Up",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              SizedBox(height: 30),
              Lottie.asset("assets/images/singup.json",
                width: 150,
                height: 150,),


              SizedBox(height: 20),
              CustomTextField(
                controller: username,
                labelText: "Name",
                prefixIcon: Icons.person,
              ),

              CustomTextField(
                controller: userEmail,
                labelText: "Email",
                prefixIcon: Icons.email,
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 283,
                height: 43,
                child: DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(30),
                  decoration: InputDecoration(
                    hintText: 'Gender',
                    prefixIcon: Icon(Icons.accessibility),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.black12,
                    filled: true,
                  ),
                  value: userGender.text.isNotEmpty ? userGender.text : null,
                  items: ["Female", "Male"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Center(
                        child: Text(
                          value,
                          textAlign: TextAlign.center,style: TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    userGender.text = value!;
                  },
                ),
              ),



              SizedBox(height: 40),
             Container(
               width: 200,
               height: 48,
               decoration: BoxDecoration(
                   color: Colors.blue,
                   borderRadius: BorderRadius.circular(20)
               ),
               child: TextButton(
                  onPressed: () {
                    String name = username.text.trim();
                    String email = userEmail.text.trim();
                    String gender = userGender.text.trim();

                    if (name.isNotEmpty &&
                        email.isNotEmpty &&
                        gender.isNotEmpty) {
                      addUserToFirestore(name, email, gender);
                    } else {
                      Fluttertoast.showToast(
                        msg: "Please fill all fields",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                      );
                    }
                  },
                  child: Text("SIGN UP",style: TextStyle(color: Colors.white),),
                ),
             ),
            ],
          ),
        ),
      ),
    );
  }
}
