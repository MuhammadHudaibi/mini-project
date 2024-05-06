import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get for GetWidget
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/app/modules/splash/controllers/splash_controller.dart';

class SplashView extends GetWidget<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Wrap(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 486,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Image.asset(
                          'assets/images/vector1.png',
                          height: 312,
                          width: 118,
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Image.asset(
                            'assets/images/Vector 2.png',
                            height: 362,
                            width: 135,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Image.asset(
                            'assets/images/bunga ungu 1.png',
                            height: 152,
                            width: 200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 9),
                  Text(
                    "HELLO FELLAS.",
                    style: GoogleFonts.poppins( fontSize: 35, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 199,
                    child: Text(
                      "Temukan segala jenis bunga dari berbagai belahan dunia!".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins( fontSize: 15,fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 46),
                  _buildStackVectorThree(),
                ],
              ),
            ],
          ),
        ),
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
