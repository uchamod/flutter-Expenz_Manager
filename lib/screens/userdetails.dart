import 'package:flutter/material.dart';
import 'package:expenze_manager/screens/homepage/homepage.dart';
import 'package:expenze_manager/service/store_userdata.dart';
import 'package:expenze_manager/util/constants.dart';
import 'package:expenze_manager/widgets/form_textfiled.dart';
import 'package:expenze_manager/widgets/shared_button.dart';

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
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conformPasswordController =
      TextEditingController();
  //check the validation
  bool isChecked = false;
  StoreUserData userdata = StoreUserData();
  //control the visibility of passwords
  bool isvisible = true;
  bool isvisibleCorrect = true;
  @override

  //dispose the data
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    conformPasswordController.dispose();
    print("dispose used");
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
                      showText: false,
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                      hintText: "Name",
                      errorMassage: "please fill the username",
                      textController: nameController,
                      isvaild: (value) {
                        if (value!.isEmpty) {
                          return "please fill the username";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //text field for user email
                    UserDetailFormFiled(
                      showText: false,
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                      hintText: "Email",
                      errorMassage: "please fill the Email",
                      textController: emailController,
                      isvaild: _validateEmail,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //text filed for password
                    UserDetailFormFiled(
                      showText: isvisible,
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      hintText: "Password",
                      errorMassage: "please fill the Password",
                      textController: passwordController,
                      isvaild: _validatePassword,
                      conditionWidget: InkWell(
                          onTap: () {
                            setState(() {
                              isPasswordShow();
                            });
                          },
                          child: isvisible
                              ? Icon(
                                  Icons.visibility_off,
                                  size: 24,
                                  color: kcDiscription,
                                )
                              : Icon(
                                  Icons.visibility,
                                  size: 24,
                                  color: kcDiscription,
                                )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //text filed for confirm password
                    UserDetailFormFiled(
                      showText: isvisibleCorrect,
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      hintText: "Confirm Password",
                      errorMassage: "please Confirm the password",
                      textController: conformPasswordController,
                      isvaild: _validatePassword,
                      conditionWidget: InkWell(
                          onTap: () {
                            setState(() {
                              isConformPasswordShow();
                            });
                          },
                          child: isvisibleCorrect
                              ? Icon(
                                  Icons.visibility_off,
                                  size: 24,
                                  color: kcDiscription,
                                )
                              : Icon(
                                  Icons.visibility,
                                  size: 24,
                                  color: kcDiscription,
                                )),
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
                      onTap: () async {
                        //checke  form state is not nullable
                        if (_validationKey.currentState!.validate()) {
                          //is form is valid

                          //call the user store method
                          await userdata.storeData(
                              context: context,
                              nameController: nameController,
                              emailController: emailController,
                              passwordController: passwordController,
                              conformPasswordController:
                                  conformPasswordController);
                        }
                      },
                      //coustom button
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

  //check email is valid
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Regex for validating email format
    String pattern = r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  //check password is valid
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  //function for chang the pasword icon
  bool isPasswordShow() {
    isvisible = !isvisible;
    return isvisible;
  }

  bool isConformPasswordShow() {
    isvisibleCorrect = !isvisibleCorrect;
    return isvisibleCorrect;
  }
}
