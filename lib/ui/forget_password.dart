import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xFFF5F6FA),
          ),
          child: const Icon(Icons.keyboard_backspace_outlined,
              color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: const Text(
              'Forgot Password',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(
            height: 40,
          ),
          Image.asset(
            "assets/images/forgetpassicon.png",
            height: 200,
          ),

          const SizedBox(height: 16.0),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Username",
                  style: TextStyle(color: Color(0xff8F959E)),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email Address',
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 16, right: 16),
              //   child: Divider(),
              // ),
            ],
          ),

          Spacer(),

          Center(
              child: Expanded(
                  child: Text(
            "      Please write your email to receive a \n confirmation code to set   a new password.",
            style: TextStyle(color: Colors.grey),
          ))),
          SizedBox(
            height: 10,
          ),
        ],
      ),
      bottomNavigationBar: MaterialButton(
        height: 65,
        color: Color(0xff9775FA),
        child: Text(
          "Confirm Email",
          style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        onPressed: () {
          //Get.off(SignupScreen());
        },
      ),
    );
  }
}
