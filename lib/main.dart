import 'package:firebase_core/firebase_core.dart';
import 'package:firstapp/registar/register_footer.dart';
import 'package:firstapp/welcome_page/first_welcome.dart';
import 'package:flutter/material.dart';
import 'book_list/book_list_page.dart';
import 'header.dart'; // <- header.dart を インポート
import 'footer.dart';
import 'next_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: WelcomePage(),
      )

    );
  }
}