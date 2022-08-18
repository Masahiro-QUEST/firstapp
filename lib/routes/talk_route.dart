import 'package:flutter/material.dart';
import '../chat_screen.dart';

class TalkScreen extends StatelessWidget {
  const TalkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
          ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatScreen(),
                    ));
              },
            leading: ClipOval(
              child: Image.asset('assets/womanIcon.jpg'),
            ),
            trailing: Text('1分前'),
            title: Text('山田さん'),
            subtitle: Text('Flutterは難しいね')
          ),
            ListTile(
            leading: ClipOval(
              child: Image.asset('assets/manIcon.jpg'),
            ),
            trailing: Text('3分前'),
            title: Text('佐藤さん'),
            subtitle: Text('資格のこと聞いていい？')
          ),
          ]
        ),
      )
    );
  }
}