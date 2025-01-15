import 'package:dsw_51744/views/home/home_view.dart';
import 'package:dsw_51744/views/widgets/basic_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../utils/my_colours.dart';

import '../../utils/my_images.dart';
import '../register/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String correctEmail = 'krzysztof.stepien@gmail.com';
  final String correctPassword = '123456789';

  void login() {
    if (usernameController.text == correctEmail &&
        passwordController.text == correctPassword) {
      print('Login ok, go to HomeView');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid Login or Password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [

              // Photo-logo
              Padding(
                padding: const EdgeInsets.only(top: 62),
                child: Image.asset(MyImages.logo),
              ),

              // Text-Sign in
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _singInText('Sign in'),

                ),
              ),

              // Email or User Name
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 46),
                child: BasicTextFormField(
                  icon: Icons.person_outline,
                  marker: "Email or User Name",
                  controller: usernameController,
                )
              ),

              // Password
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                child: BasicTextFormField(
                  icon: Icons.lock_outline,
                  marker: "Password",
                  Password: true,
                  controller: passwordController,
                ),
              ),

              // Text-Forget Password
              Padding(
                padding: const EdgeInsets.only(top:40, right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                      fontSize:15,
                      fontWeight: FontWeight.w700,
                      color: MyColors.purpleColor,
                    ),
                  ),
                ),
              ),

              // Button-Sign in
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: ElevatedButton(
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: MyColors.whiteColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.signInColor,
                    minimumSize: Size(390, 50),
                  ),
                  onPressed: login,
                ),
              ),

              Spacer(),

              // Text-Don't have an account? Sign up
              Padding(
                padding: const EdgeInsets.only(bottom: 62, left: 100,),
                child: Row(
                  children: [
                    Text(
                      'Don`t have an account? ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: MyColors.purpleColor,
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        'Sing up',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: MyColors.purpleColor,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterView()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _singInText(String text) {
  return Text(
      text,
      style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: MyColors.purpleColor
      )
  );
}