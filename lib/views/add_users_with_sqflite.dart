import 'package:all_topics/views/utils/app_constants.dart';
import 'package:all_topics/views/widgets/textfield_widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../controller/provider.dart';
import '../model/data_model.dart';

class AddUserScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          'Add User',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                Image.asset("assets/images/book.png",
                  width: 140,
                  height: 140,),


                SizedBox(height: 20),

                CustomTextField(
                  prefixIcon: Icons.person,
                  controller: _nameController,
                  labelText: "Name",
                ),
                CustomTextField(
                  prefixIcon: Icons.email,
                  controller: _emailController,
                  labelText: "Email",
                ),
                CustomTextField(
                  prefixIcon: Icons.home,
                  controller: _addressController,
                  labelText: "Address",
                ),
                SizedBox(
                  width: 310,
                  height: 56,
                  child: DropdownButtonFormField<String>(
                    borderRadius: BorderRadius.circular(30),
                    decoration: InputDecoration(
                      hintText: 'Gender',
                      prefixIcon: Icon(Icons.accessibility),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none
                      ),
                      fillColor: Colors.black12.withOpacity(0.1),
                      filled: true,
                    ),
                    value: _genderController.text.isNotEmpty ? _genderController.text : null,
                    items: ["Female", "Male"].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      _genderController.text = value!;
                    },
                  ),
                ),


                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 283,
                        height: 43,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                          onPressed: () async {
                            if (_nameController.text.isEmpty ||
                                _emailController.text.isEmpty ||
                                _addressController.text.isEmpty ||
                                _genderController.text.isEmpty) {
                              Fluttertoast.showToast(
                                msg: "All Field Required!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            } else {
                              final newUser = UserProviderModel(
                                name: _nameController.text,
                                email: _emailController.text,
                                address: _addressController.text,
                                gender: _genderController.text,
                              );
                              final userProvider = Provider.of<UserProvider>(
                                  context,
                                  listen: false);
                              await userProvider.addUser(newUser);
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
