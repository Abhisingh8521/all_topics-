import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({Key? key}) : super(key: key);

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  final _otpController = TextEditingController();

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
              'Verification Code',
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
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: PinCodeTextField(
                  appContext: context,
                  length: 6,
                  controller: _otpController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeColor: Colors.green,
                    inactiveColor: Color(0xfffE7E8EA),
                    selectedColor: Color(0xfffE7E8EA),
                    selectedFillColor: Colors.green.withOpacity(0.1),
                    borderWidth: 2,
                    disabledColor: Color(0xfffE7E8EA),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "00:20",
                style: (TextStyle(
                    fontSize: 15,
                    color: Color(0xff1D1E20),
                    fontWeight: FontWeight.w600)),
              ),
              Text(
                " resend confirmation code.",
                style: TextStyle(fontSize: 15, color: Color(0xff8F959E)),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
      bottomNavigationBar: MaterialButton(
        height: 65,
        color: Color(0xff9775FA),
        child: const Text(
          "Confirm Code",
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
