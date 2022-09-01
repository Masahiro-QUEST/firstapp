import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_model.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Mymodel>(
      create: (_) => Mymodel()..fetchUser(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本を追加'),
        ),
        body: Center(
          child: Consumer<Mymodel>(builder: (context, model, child) {
            return Stack(
              children: [
                Column(children: [
                  Text("名前"),
                  Text("自己紹介"),
                  Text(model.email ?? "メールアドレスなし"),
                  TextButton(
                      onPressed: () async {
                        await model.logout();
                        Navigator.of(context).pop();
                      },
                      child: Text("ログアウト")
                  ),
                ],
                ),
                if (model.isLoading)
                  Container(
                    color: Colors.black54,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}