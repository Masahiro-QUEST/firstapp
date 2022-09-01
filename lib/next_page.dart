import 'dart:ffi';

import 'package:firstapp/registar/register_page.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

import 'login/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController controller;

  GlobalKey<PageContainerState> key = GlobalKey();

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 100,
            child: PageIndicatorContainer(
              key: key,
              align: IndicatorAlign.bottom,
              length: 4,
              indicatorSpace: 10.0,
              padding: const EdgeInsets.all(10),
              indicatorColor: Colors.grey,
              indicatorSelectorColor: Colors.blue,
              shape: IndicatorShape.circle(size: 12),
              child: PageView.builder(itemCount: 4,itemBuilder: (context, position) {
                return Container(
                  color: Colors.white,
                  child: Center(
                    child: Image.asset("assets/Banner.png",fit: BoxFit.contain,),
                  ),
                );
              }
              ),
            ),
          ),
          Center(
              child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Image.asset("assets/bubbleBird.png"),
                  Image.asset("assets/bubbleEarth.png"),
                  Image.asset("assets/bubbleMap.png"),
                ],
              ),
              )
          ),
          //購入カードを横で表示
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/icon.png"),
              Spacer(),
              Image.asset("assets/icon02.png"),
              Spacer(),
              Image.asset("assets/icon03.png"),
              Spacer(),
              Image.asset("assets/icon03.png"),
            ],
          ),
          Flexible(flex: 1, child: Container()),
          Flexible(
              flex: 1,
              child: Container(
                color: Colors.orange,
              )),
          Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.0),
                color: Colors.orange,
                child: Text('DDポイントの獲得には\n'
                    '登録・ログインが必要です',
                style: TextStyle(fontSize: 24,color: Colors.white),),
              )
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            color: Colors.orange,
            padding: EdgeInsets.all(30.0),
            child: ElevatedButton(
              child: const Text("登録・ログイン",
                style: TextStyle(
                    fontSize: 25
                ),
              ),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage (),
                    )
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}