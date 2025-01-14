import 'package:dsw_51744/utils/my_images.dart';
import 'package:dsw_51744/views/widgets/basic_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../utils/my_colours.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [

            //"AppBar"
            Stack(
              children: [
                //JAK SKONCZE CALOSC TO MOZNA SIE TYM POBAWIC
                // Padding(
                //   padding: const EdgeInsets.only(top: 59),
                //   child: AppBar(
                //     titleSpacing: -15,
                //     title: Text(
                //       'Back',
                //       style: TextStyle(
                //         fontWeight: FontWeight.w400,
                //         fontSize: 12,
                //         color: MyColors.purpleColor,
                //       ),
                //     ),
                //   ),
                // ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(MyImages.ellipse),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 59, left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios_new,
                            color: MyColors.purpleColor,
                          ),

                          Text(
                            'Back',
                            style: TextStyle(
                              color: MyColors.purpleColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),

            //Sign up-Text
            Padding(
              padding: const EdgeInsets.only(bottom: 46, top: 55, left: 20),
              child: Align(
                child: _singUpText('Sign up'),
                alignment: Alignment.centerLeft,
              ),
            ),

            //Full Name
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
              child: BasicTextFormField(
                icon: Icons.person_outline,
                marker: 'Full Name',
              ),
            ),

            //Email
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
              child: BasicTextFormField(
                icon: Icons.local_post_office_outlined,
                marker: 'Email',
              ),
            ),

            //Password
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
              child: BasicTextFormField(
                icon: Icons.lock_outline,
                marker: 'Password',
                Password: true,
              ),
            ),

            //Confirm Password
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 80),
              child: BasicTextFormField(
                icon: Icons.lock_outline,
                marker: 'Confirm Password',
                Password: true,
              ),
            ),

            // Sign up-Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {

                },
                child: Text(
                  'Sing Up',
                  style: TextStyle(
                    color: MyColors.whiteColor,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(390, 50),
                  backgroundColor: MyColors.signInColor,
                ),
              ),
            ),

            Spacer(),

            //Text-Already have an account? Sing in
            Padding(
              padding: const EdgeInsets.only(bottom: 62, left: 95),
              child: Row(
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: MyColors.purpleColor
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      'Sing in',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: MyColors.purpleColor,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}

Widget _singUpText(String text) {
  return Text(
      text,
      style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: MyColors.purpleColor,
      )
  );
}