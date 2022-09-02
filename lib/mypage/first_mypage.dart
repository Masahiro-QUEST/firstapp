import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:provider/provider.dart';
import '../edit_profile/edit_profile_page.dart';
import '../next_page.dart';
import 'my_model.dart';

class Firstmypage extends StatelessWidget {
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

  @override
  String? name;
  String? description;

  void getUser() async {
    final user = FirebaseAuth.instance.currentUser;
    // firestoreに追加
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final snapshot =
        await FirebaseFirestore.instance.collection('user').doc(uid).get();
    final data = snapshot.data();
    this.name = data?['name'];
    this.description = data?['description'];
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Mymodel>(
        create: (_) => Mymodel()..fetchUser(),
        child: Scaffold(
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
                  child: PageView.builder(
                      itemCount: 4,
                      itemBuilder: (context, position) {
                        return Container(
                          color: Colors.white,
                          child: Center(
                            child: Image.asset(
                              "assets/Banner.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      }),
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
              )),
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfilePage(),
                      ));
                },
                child: Container(
                  child: Image.asset("assets/profile.png"),
                ),
              ),
              Container(
                child: Consumer<Mymodel>(builder: (context, model, child) {
                  return Stack(
                    children: [
                      Text(model.name ?? "名前"),
                    ],
                  );
                }),
              ),

              Container(
                alignment: Alignment.bottomCenter,
                color: Colors.orange,
                padding: EdgeInsets.all(30.0),
                child: ElevatedButton(
                  child: const Text(
                    "ログアウト",
                    style: TextStyle(fontSize: 25),
                  ),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
