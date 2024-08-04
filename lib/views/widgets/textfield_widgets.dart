import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;

  const CustomTextField({
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(20),

        ),
        child: SizedBox(
          height: 56,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: labelText,
              prefixIcon: Icon(prefixIcon),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none
              ),
                fillColor: Colors.black12.withOpacity(0.1),
                filled: true,

            ),
          ),
        ),
      ),
    );
  }
}

