import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/app/modules/home/controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: controller.getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasData) {
          var userData = snapshot.data!;
          return Home(userData: userData, controller: controller);
        } else {
          return Scaffold(
            body: Center(
              child: Text('Failed to fetch user data.'),
            ),
          );
        }
      },
    );
  }
}

class Home extends StatelessWidget {
  final Map<String, dynamic> userData;
  final HomeController controller;

  Home({required this.userData, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHelloNameColumn(),
              SizedBox(height: 18),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "My Phone Number : ${userData['phoneNumber']}",
                    style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              SizedBox(height: 6),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "My Address : ${userData['address']}",
                    style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              Spacer(flex: 70),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    File? imageFile = await controller.pickImageFromGallery();
                    if (imageFile != null) {
                      // Memanggil fungsi untuk mengunggah foto setelah berhasil memilih foto dari galeri
                      await controller.uploadPhoto(imageFile);
                    }
                  },
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
                        'Upload Foto',
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              
              Spacer(
                flex: 70,
              ),
              _buildStackVectorThree(),
            ],
          ),
        ),

      ),
    );
  }
  
  Widget _buildHelloNameColumn() {
    String? photoURL = userData['photoURL'];
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.fromLTRB(20, 3, 20, 2),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.blueGrey, // Ubah warna sesuai keinginan
            width: 2.0, // Sesuaikan ketebalan garis
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, ${userData['name']}",
                  style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 1),
                Text(
                  "How's your day going?",
                  style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
          Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.only(
              top: 20,
              right: 15,
              bottom: 5,
            ),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Image.network(
              photoURL!,
              height: 40,
              width: 40,
              alignment: Alignment.center,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStackVectorThree() {
    return SizedBox(
      height: 250,
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
              height: 350,
              width: 428,
              alignment: Alignment.topCenter,
            ),
          ),
        ],
      ),
    );
  }
}
