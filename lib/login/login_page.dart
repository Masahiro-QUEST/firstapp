import 'package:firstapp/registar/register_model.dart';
import 'package:firstapp/registar/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../domain/book.dart';
import 'login_model.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      create: (_) => LoginModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ログイン'),
        ),
        body: Center(
          child: Consumer<LoginModel>(builder: (context, model, child){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: model.titleController,
                    decoration: const InputDecoration(
                        hintText: 'パスワード'
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
                        hintText: 'Password'
                    ),
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
                          Navigator.of(context).pop(model.email);

                        } catch (e) {
                          final snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(e.toString()),);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: const Text('ログイン')),
                  TextButton(
                      onPressed: () async{
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()
                            ));
                      },
                      child: Text("新規登録の方はこちら"

                  ))
                ],),
            );
          }),
        ),
      ),
    );
  }
}