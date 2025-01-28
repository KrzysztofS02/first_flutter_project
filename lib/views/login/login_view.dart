// ignore_for_file: inference_failure_on_instance_creation

import 'package:dsw_51744/views/home/home_view.dart';
import 'package:dsw_51744/views/widgets/basic_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  Future<void> saveCredentials(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }

  Future<Map<String, String?>> getCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    final password = prefs.getString('password');
    return {'username': username, 'password': password};
  }

  Future<void> saveLoginState(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  Future<bool> getLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  void login() async {
    // final savedCredentials = await getCredentials();

    if (usernameController.text == correctEmail &&
        passwordController.text == correctPassword) {
      await saveCredentials(usernameController.text, passwordController.text);

      await saveLoginState(true);

      print('Login ok, go HomeView');
      Navigator.pushReplacement(
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
  void initState() {
    super.initState();
    checkLoginState();
  }

  Future<void> checkLoginState() async {
    final isLoggedIn = await getLoginState();
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeView()));
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
                  )),

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
                padding: const EdgeInsets.only(top: 40, right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                      fontSize: 15,
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
                padding: const EdgeInsets.only(
                  bottom: 62,
                  left: 100,
                ),
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
                        'Sign up',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: MyColors.purpleColor,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterView()),
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
  return Text(text,
      style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: MyColors.purpleColor));
}
