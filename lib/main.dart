import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'book_list/book_list_page.dart';
import 'header.dart'; // <- header.dart を インポート
import 'footer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookListSample',
      home: BookListPage(),
    );
  }
}