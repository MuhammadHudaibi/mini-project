import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class HomeController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Mendapatkan data pengguna
  Future<Map<String, dynamic>> getUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        return userDoc.data() as Map<String, dynamic>;
      }
    }
    return {};
  }

  // Fungsi untuk mengunggah foto ke Firestore
  Future<String> uploadPhoto(File imageFile) async {
    User? user = _auth.currentUser;
    if (user != null) {
      // Mengunggah foto ke Firebase Storage
      String fileName = 'profile_${user.uid}.jpg';
      firebase_storage.Reference ref = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('user_photos')
          .child(fileName);

      firebase_storage.UploadTask uploadTask = ref.putFile(imageFile);
      firebase_storage.TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
      
      // Mendapatkan URL dari foto yang diunggah
      String downloadURL = await snapshot.ref.getDownloadURL();

      // Mengupdate URL foto pada dokumen pengguna di Firestore
      await _firestore.collection('users').doc(user.uid).update({
        'photoURL': downloadURL,
      });

      return downloadURL;
    } else {
      throw 'Tidak ada pengguna yang terautentikasi.';
    }
  }

  // Fungsi untuk memilih foto dari galeri
  Future<File?> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }
}
