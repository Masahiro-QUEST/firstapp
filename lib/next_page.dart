import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  NextPage(this.name);
  final String name;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('次の画面'),
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Image.asset('images/questLogo.png'),
            Center(
              child: RaisedButton(
                child: Text('戻る'),
                onPressed: () {
                  Navigator.pop(
                    context,
                    'こんにちはは'
                  );
                },
              )

            ),
          ],
        ),
      ),
    );
  }

}