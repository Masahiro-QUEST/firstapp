import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../domain/book.dart';

class RegisterModel extends ChangeNotifier {

  final titleController = TextEditingController();
  final authorController = TextEditingController();

  String? email;
  String? password;

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  Future sighUp() async {
    this.email = titleController.text;
    this.password = authorController.text;

    if( email != null && password != null){
      final userCredential = await
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!);

      final user = userCredential.user;

      if ( user != null){
        final uid = user.uid;

        final doc = FirebaseFirestore.instance.collection('user').doc(uid);
        await doc.set({
          'uid': uid,
          'email': email,
        });
      }

    }

    // firestoreに追加
    // await FirebaseFirestore.instance.collection('books').doc(book.id).update({
    //   'title': title,
    //   'author': author,
    // });
  }
}