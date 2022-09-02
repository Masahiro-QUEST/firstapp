import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Mymodel extends ChangeNotifier {
  bool isLoading = false;
  String? email;
  String? name;
  String? description;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  void fetchUser() async{
    final user = FirebaseAuth.instance.currentUser;
    this.email = user?.email;
    // firestoreに追加
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final snapshot = await FirebaseFirestore.instance.collection('user').doc(uid).get();
    final data = snapshot.data();
    this.name = data?['name'];
    this.description = data?['description'];


    notifyListeners();
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }
}