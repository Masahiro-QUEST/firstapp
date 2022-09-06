import 'package:firstapp/welcome_page/second_welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(WelcomePage());
}

// StatelessWidgetクラスという親クラスをMyAppに継承している
class WelcomePage extends StatelessWidget {
  //StatelessWidgetは、build関数をoverride（上書き）することで、MaterialApp内のWidgetにもStatelessな特性を持たせている
  @override
  // build関数: Widgetを実際に描画するためのメソッド
  Widget build(BuildContext context) {
    // MaterialApp: materialデザインを使用するためのWidget, mainに返される
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Container(
                child: Text(
                  'サガン鳥栖を応援して、みんなで元気になろう',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        '・サガン鳥栖ファントークンは、チームを強化するとともにファンの皆様と一緒に発展して行くために、企画されたものです。',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        child: Text(
                          '・サガン鳥栖ファントークンは、チームを強化するとともにファンの皆様と一緒に発展して行くために、企画されたものです。',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        child: Text(
                          '・サガン鳥栖ファントークンは、チームを強化するとともにファンの皆様と一緒に発展して行くために、企画されたものです。',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Image.asset("assets/ball.png",),
                            ),
                          Ink(
                            color: Colors.white,
                            child: IconButton(
                              color: Colors.blue,
                              icon: const Icon(Icons.arrow_forward),
                              iconSize: 50,
                              onPressed:  () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) {
                                      return WelcomePageSecond();
                                    },
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      final Offset begin = Offset(1.0, 0.0); // 右から左
                                      // final Offset begin = Offset(-1.0, 0.0); // 左から右
                                      final Offset end = Offset.zero;
                                      final Animatable<Offset> tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: Curves.easeInOut));
                                      final Animation<Offset> offsetAnimation = animation.drive(tween);
                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
