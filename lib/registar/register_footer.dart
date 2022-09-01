import 'package:firstapp/registar/register_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../book_list/book_list_page.dart';
import '../domain/book.dart';

class RegisterFooter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookListPage (),
      bottomNavigationBar: BottomNavigationBar(
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム',),
          BottomNavigationBarItem(icon: Icon(Icons.textsms), label: 'トーク',),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'ウォレット',),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: 'メモ',),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
