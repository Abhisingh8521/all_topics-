// provider.dart
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../model/data_model.dart';
import 'db_helper.dart';

class UserProvider with ChangeNotifier {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> addUser(UserProviderModel user) async {
    try {
      final id = await _databaseHelper.insertData(user);

      Fluttertoast.showToast(
        msg: "User added successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (e) {
      print("Failed to add user: $e");
      Fluttertoast.showToast(
        msg: "Failed to add user: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future<List<UserProviderModel>> getAllUsers() async {
    try {
      return await _databaseHelper.getAllUsers();
    } catch (e) {
      print("Failed to fetch users: $e");
      throw e;
    }
  }

  Future<void> deleteUser(int? userId) async {
    if (userId == null) {

      return;
    }
    try {

      await _databaseHelper.deleteUser(userId);
      Fluttertoast.showToast(
        msg: "User deleted successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      notifyListeners();
    } catch (e) {
      print("Failed to delete user: $e");
      Fluttertoast.showToast(
        msg: "Failed to delete user: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }


}
