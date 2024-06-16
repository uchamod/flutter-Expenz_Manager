import 'package:expenze_manager/service/store_userdata.dart';
import 'package:expenze_manager/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //bind the shared preferences to flutter application
  await SharedPreferences.getInstance(); //create a instance
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //implemant the future builder
    return FutureBuilder(
      future: StoreUserData().isRegisterd(), //get the future value
      //create a future builder
      //snapshothas the data of futuer,then we can change the context according to data of thesnapshot
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          //check if any connection error
          return const CircularProgressIndicator(); //show indicator
        } else {
          //otherwise get the snpshot data
          bool userNameData = snapshot.data ?? false;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Expenz manager",
            theme: ThemeData(
              fontFamily: "Poppins",
            ),
            
            home: Wrapper(isUserNameHas: userNameData),
          );
        }
      },
    );
  }
}
