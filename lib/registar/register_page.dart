import 'package:firstapp/registar/register_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../domain/book.dart';

class RegisterPage extends StatelessWidget {

  Future _launchUrl() async {
    final Uri _url = Uri.parse('https://dev.d2wury9cbvd286.amplifyapp.com');

    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Unable to launch url $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterModel>(
      create: (_) => RegisterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('新規登録'),
        ),
        body: Center(
          child: Consumer<RegisterModel>(builder: (context, model, child){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("JリーグID新規登録", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  Text("ご入力いただいたメールアドレスに、確認メールを送付致します。"
                      "\n1.　お客様ご自身でメール設定されていない場合も、メールサーバ上で自動的に迷惑メールへ振り分けられてしまうことがございます"
                      "\n2.　URL付きメールが受信拒否になっている場合や、ドメイン指定などでの受信設定の影響で届かない場合もございます。",
                    style: TextStyle(fontSize: 15)),
                  Container(
                    width: double.infinity,
                    child:TextButton(onPressed: (){
                      _launchUrl();
                    }, child: Text(">他サイトのアカウントで登録する"), style: TextButton.styleFrom(
                      alignment: Alignment.topLeft,
                    ),),
                  ),
                  TextField(
                    controller: model.titleController,
                    decoration: const InputDecoration(
                        hintText: 'メールアドレス'
                    ),
                    onChanged: (text) {
                      model.setEmail(text);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: model.authorController,
                    decoration: const InputDecoration(
                        hintText: 'パスワード'
                    ),
                    obscureText: true,
                    onChanged: (text) {
                      model.setPassword(text);
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: ()async {
                        try {
                          await model.sighUp();
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pop(model.password);

                        } catch (e) {
                          final snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(e.toString()),);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: const Text('登録する')),
                ],),
            );
          }),
        ),
      ),
    );
  }
}