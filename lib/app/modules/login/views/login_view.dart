import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/app/modules/login/controllers/login_controller.dart';

class LoginView extends GetView<LoginController>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 300,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset(
                          'assets/images/Vector 5.png',
                          height: 80,
                          width: double.maxFinite,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Image.asset(
                            'assets/images/login_logo 1.png',
                            height: 152,
                            width: 200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 9),
                  Center(
                    child: Text(
                      "Welcome To Azalea",
                      style: GoogleFonts.poppins( fontSize: 35, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Usename/Email",
                      style: GoogleFonts.poppins(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 9),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        hintText: 'Email here...',
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Password",
                      style: GoogleFonts.poppins(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 9),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: controller.passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        hintText: 'Password here...',
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 50,
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.purple[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Login', style: GoogleFonts.poppins()),
                      onPressed: () => controller.login(
                          controller.emailController.text,
                          controller.passwordController.text),
                    )),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Does not have an account?', style: GoogleFonts.poppins(),),
                        TextButton(
                          child: Text('Register', style: GoogleFonts.poppins(),),
                          onPressed: () {
                            Get.toNamed("/register");
                          },
                        )
                      ],
                    ),
                  ),
                  _buildStackVectorThree(),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget _buildStackVectorThree() {
    return SizedBox(
      height: 394,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/images/Vector 3.png',
            height: 309,
            width: 428,
            alignment: Alignment.topCenter,
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            child: Image.asset(
              'assets/images/Vector 4.png',
              height: 296,
              width: 428,
              alignment: Alignment.topCenter,
            ),
          ),
        ],
      ),
    );
  }
}
