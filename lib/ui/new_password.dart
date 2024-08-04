import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
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
          const Center(
            child: Text(
              'New Password',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 60.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Password",
                  style: TextStyle(color: Color(0xff8F959E)),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Hj@#345kja',
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 16, right: 16),
              //   child: Divider(),
              // ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Confirm Password",
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
                    hintText: 'Hj@#345kja',
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
          const Center(
              child: Expanded(
                  child: Text(
            "Please write your new password.",
            style: TextStyle(color: Colors.grey),
          ))),
          SizedBox(
            height: 10,
          ),
        ],
      ),
      bottomNavigationBar: MaterialButton(
        height: 65,
        color: const Color(0xff9775FA),
        child: const Text(
          "Reset Password",
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
