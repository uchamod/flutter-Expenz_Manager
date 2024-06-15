import 'package:expenze_manager/widgets/mainpage.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

//the method for store the data
class StoreUserData {
  //method for storevalues for the future
  Future<void> storeData({
    required BuildContext context,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController
        conformPasswordController, //required parameters
  }) async {
    try {
      //initilize shared preferences
      SharedPreferences pref = await SharedPreferences.getInstance();
      //set the store data
      await pref.setString("userName", nameController.text);
      await pref.setString("email", emailController.text);
      await pref.setString("password", passwordController.text);

      //show the alert
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("user details saved succsussfuly"),
        ),
      );
      nameController.clear();
      emailController.clear();
      passwordController.clear();
      conformPasswordController.clear();
      //push to the next page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
      );

      //if any error in above process
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            err.toString(),
          ),
        ),
      );
    }
    //check the password if passwords are mis match show the alert
  }

  //check the userdata is has or not
  Future<bool?> isRegisterd() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userName = pref.getString("userName");
    return userName!.isEmpty ? null : true;
  }

  //get username and email from saved data
  Future<List<dynamic>?> getUserDetails() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String? userName = pref.getString("userName");

    String? email = pref.getString("email");

    return [userName, email];
  }

  
}
