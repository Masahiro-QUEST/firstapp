import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../domain/book.dart';

class LoginModel extends ChangeNotifier {

  final titleController = TextEditingController();
  final authorController = TextEditingController();

  bool isLoading = false;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

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

  Future login() async {
    this.email = titleController.text;
    this.password = authorController.text;

    if ( email != null && password != null){
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: password!);
    }
  }
}