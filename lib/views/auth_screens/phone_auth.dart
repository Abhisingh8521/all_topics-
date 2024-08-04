import 'package:all_topics/views/auth_screens/verify_otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/app_constants.dart';

class SendOtpScreen extends StatefulWidget {
  const SendOtpScreen({Key? key}) : super(key: key);

  @override
  State<SendOtpScreen> createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends State<SendOtpScreen> {
  late TextEditingController _phoneNumberController;
  String _verificationid = '';
  int? _resendToken;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _handleSignUp() async {
    if (_phoneNumberController.text.length == 10 && !_isLoading) {
      setState(() {
        _isLoading = true;
      });

      try {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+91${_phoneNumberController.text}',
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
          verificationFailed: (FirebaseAuthException e) {
            print("Exception: $e");
            setState(() {
              _isLoading = false;
            });
          },
          codeSent: (String verificationId, int? resendToken) {
            setState(() {
              _verificationid = verificationId;
              _resendToken = resendToken;
              _isLoading = false;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpScreen(
                  verificationId: _verificationid,
                  resendToken: _resendToken,
                  phone: '+91${_phoneNumberController.text}',
                ),
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            // Handle timeout
          },
        );
      } catch (e) {
        print("Exception: $e");
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 50),
                Image.asset(
                  "assets/images/img.png",
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 25),
                Text(
                  "Registration",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "We need to register your phone without getting started!",
                  style: TextStyle(fontSize: 16,color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                TextField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_android),
                    hintText: 'Enter your phone',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isLoading ? null : _handleSignUp,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: _phoneNumberController.text.length == 10
                        ? Colors.green.shade600
                        : Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text(
                    'Send the code',
                    style: TextStyle(fontSize: 16,color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          if (_isLoading)

            Stack(
              children: [
                ModalBarrier(
                  color: Colors.black.withOpacity(0.4),
                  dismissible: false,
                ),
                const Center(
                  child:  CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                    valueColor: AlwaysStoppedAnimation(Colors.green),
                    strokeWidth: 5,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
