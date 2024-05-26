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

  bool isChecked = false;
  StoreUserData userdata = StoreUserData();
  @override
  // Future<void> initState() async {
  //   // TODO: implement initState
  //   _nameController.addListener(
  //     userdata.storeData(
  //         name: _nameController,
  //         email: _emailController,
  //         password: _passwordController,
  //         conformpassword: _conformPasswordController,
  //         context: context) as VoidCallback,
  //   );
  //   super.initState();
  // }

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
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                      hintText: "Name",
                      errorMassage: "please fill the username",
                      textController: nameController,
                      showText: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //text field for user email
                    UserDetailFormFiled(
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                      hintText: "Email",
                      errorMassage: "please fill the Email",
                      textController: emailController,
                      showText: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //text filed for password
                    UserDetailFormFiled(
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      hintText: "Password",
                      errorMassage: "please fill the Password",
                      textController: passwordController,
                      showText: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //text filed for confirm password
                    UserDetailFormFiled(
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      hintText: "Confirm Password",
                      errorMassage: "please Confirm the password",
                      textController: conformPasswordController,
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
                      onTap: () async {
                        //checke  form state is not nullable
                        if (_validationKey.currentState!.validate()) {
                          //is form is valid
                          // String userName = nameController.text;
                          // String userEmail = emailController.text;
                          // String userPassword = passwordController.text;
                          // String userCoformPassword =
                          //     conformPasswordController.text;

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
}
