import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/app/modules/register/controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    width: double.maxFinite,
                    child: Image.asset(
                      'assets/images/Vector 5.png',
                      height: 80,
                      width: double.maxFinite,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  SizedBox(height: 9),
                  Center(
                    child: Text(
                      "Register Your Account",
                      style: GoogleFonts.poppins(fontSize: 33, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildInputField("Email", hintText: "Email here...", controller: controller.emailController),
                  SizedBox(height: 16),
                  _buildInputField("Name", hintText: "Name here...", controller: controller.nameController),
                  SizedBox(height: 16),
                  _buildInputField("Address", hintText: "Address here...", controller: controller.addressController),
                  SizedBox(height: 16),
                  _buildInputField("Phone Number", hintText: "Phone Number here...", controller: controller.phoneController, keyboardType: TextInputType.number),
                  SizedBox(height: 16),
                  _buildInputField("Password", hintText: "Password here...", obscureText: true, controller: controller.passwordController),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () => controller.register(
                        controller.emailController.text,
                        controller.nameController.text,
                        controller.addressController.text,
                        controller.phoneController.text,
                        controller.passwordController.text,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Register',
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Text('Already have an account?', style: GoogleFonts.poppins()),
                        TextButton(
                          onPressed: () => Get.toNamed("/login"),
                          child: Text('Login', style: GoogleFonts.poppins()),
                        ),
                      ],
                    ),
                  ),
                  _buildStackVectorThree(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, {String? hintText, bool obscureText = false, TextEditingController? controller, TextInputType? keyboardType}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 20),
        ),
        SizedBox(height: 9),
        Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.centerLeft,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
          ),
        ),
      ],
    ),
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