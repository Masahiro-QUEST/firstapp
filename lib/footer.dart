import 'package:flutter/material.dart';
import 'routes/home_route.dart';
import 'routes/talk_route.dart';
import 'routes/wallet_route.dart';
import 'header.dart'; // <- header.dart を インポート

var _navIndex = 0;
var _label = '';
var _titles = ['Contacts', 'Map', 'Chat'];
class Footer extends StatefulWidget{
  const Footer();

  @override
  _Footer createState() => _Footer();
}

class _Footer extends State
{
  static const _screens = [
    HomeScreen(),
    WalletScreen(),
    TalkScreen(),
  ];
  int _selectedIndex = 0;
  final _pages = <Widget>[
    Container(
      child: Text('HomeScreen'),
      alignment: Alignment.center,
    ),
    Container(
      child: Text('トーク'),
      alignment: Alignment.center,
      color: Colors.lightBlue,
    ),
    Container(
      child: Text('ウォレット'),
      alignment: Alignment.center,
      color: Colors.pink.withOpacity(0.5),
    ),
    Container(
      child: Text('メモ'),
      alignment: Alignment.center,
      color: Colors.yellow.withOpacity(0.5),
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Center(
        child: Text('本一覧'),
      ),
      bottomNavigationBar: BottomNavigationBar(
      items: const[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム',),
        BottomNavigationBarItem(icon: Icon(Icons.textsms), label: 'トーク',),
        BottomNavigationBarItem(icon: Icon(Icons.work), label: 'ウォレット',),
        BottomNavigationBarItem(icon: Icon(Icons.note), label: 'メモ',),
      ],
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
    ),
    );
}//Widget build
}