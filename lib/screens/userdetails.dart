import 'package:expenze_manager/screens/homepage/homepage.dart';
import 'package:expenze_manager/util/constants.dart';
import 'package:expenze_manager/widgets/form_textfiled.dart';
import 'package:expenze_manager/widgets/shared_button.dart';

import 'package:flutter/material.dart';

//user Login/registation interface
class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  //key for check the textfield validation
  final _validationKey = GlobalKey<FormState>();
  //controllers for the controle the textFileds
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conformPasswordController =
      TextEditingController();

  bool isChecked = false;

  //dispose the data
  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _conformPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //hedline
              Text(
                "Enter your \nPersonal Details",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: kcHedingBlack,
                    height: 1.2),
              ),
              const SizedBox(
                height: 35,
              ),
              //create the user detail form
              Form(
                key: _validationKey, //add validation key
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //text field for username
                    UserDetailFormFiled(
                      hintText: "Name",
                      errorMassage: "please fill the username",
                      textController: _nameController,
                      showText: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //text field for user email
                    UserDetailFormFiled(
                      hintText: "Email",
                      errorMassage: "please fill the Email",
                      textController: _emailController,
                      showText: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //text filed for password
                    UserDetailFormFiled(
                      hintText: "Password",
                      errorMassage: "please fill the Password",
                      textController: _passwordController,
                      showText: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //text filed for confirm password
                    UserDetailFormFiled(
                      hintText: "Confirm Password",
                      errorMassage: "please Confirm the password",
                      textController: _conformPasswordController,
                      showText: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Remember Me for the next time",
                          style: TextStyle(
                              color: kcDiscription,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        //rememberMe checkbox
                        Expanded(
                          child: CheckboxListTile(
                            activeColor: kcButtonBlue,
                            value: isChecked,
                            onChanged: (value) {
                              setState(
                                () {
                                  isChecked = value!;
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    //submit button
                    GestureDetector(
                      onTap: () {
                        //checke  form state is not nullable
                        if (_validationKey.currentState!.validate()) {
                          //is form is valid
                          String userName = _nameController.text;
                          String userEmail = _emailController.text;
                          String userPassword = _passwordController.text;
                          String userCoformPassword =
                              _conformPasswordController.text;

                          print(
                              "$userName $userEmail $userPassword $userCoformPassword");

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ));
                        }
                      },
                      child: CoustomButton(
                        text: "Next",
                        buttonColor: kcButtonBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
