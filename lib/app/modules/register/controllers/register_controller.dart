import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import package firestore

import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance; // Initialize Firestore

  void register(String email , String name, String address, String phoneNumber, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Get.snackbar('Success', 'User created successfully');
      userCredential.user!.sendEmailVerification();

      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
        'name': name,
        'address': address,
        'phoneNumber': phoneNumber,
        'password': password,
      });
      
      Get.defaultDialog(
          title: 'Verify your email',
          middleText:
              'Please verify your email to continue. We have sent you an email verification link.',
          textConfirm: 'OK',
          textCancel: 'Resend',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.offAllNamed(Routes.LOGIN);
          },
          onCancel: () {
            userCredential.user!.sendEmailVerification();
            Get.snackbar('Success', 'Email verification link sent');
          });
    } on FirebaseAuthException catch (e) {
        Get.snackbar('Error', e.code);
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
