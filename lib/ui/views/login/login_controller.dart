import 'dart:convert';
import 'package:finance_app/core/constants/app_keys.dart';
import 'package:finance_app/core/model/news_data.dart';
import 'package:finance_app/core/model/user_data.dart';
import 'package:finance_app/core/services/database_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class LoginController extends GetxController {

  String? _firstName;
  String? _lastName;

  UserData? _userData;
  UserDatabaseManager _userDatabaseManager = UserDatabaseManager();

  void setFirstName(String val) {
    _firstName = val;
    print(_firstName);
    update();
  }

  String? getFirstName(){
    return _firstName;
  }

  void setLastName(String val) {
    _lastName = val;
    update();
  }

  String? getLastName() {
    return _lastName;
  }

  Future registerUser(
    BuildContext context,
  ) async {
    try {
      // Initialising database instance
      await _userDatabaseManager.initializeDatabase();

      // Delete users in the database since in this use case we should only have one user per time
      await _userDatabaseManager.deleteAllPersons();

      // Inserting the user details

      var userData = UserData(_firstName, _lastName);
      await _userDatabaseManager.insertUserData(userData);
    } catch (err) {
      //notify user of any error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Something went wrong',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    update();
  }


}
