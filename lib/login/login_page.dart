import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/registar/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../mypage/first_mypage.dart';

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
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: model.titleController,
                        decoration: const InputDecoration(
                            hintText: 'ID'
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
                            model.startLoading();
                            try {
                              await model.login();
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pop(model.email);
                              if (FirebaseAuth.instance.currentUser != null){
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Firstmypage(),
                                      fullscreenDialog: true,
                                    ),
                                );
                              } else {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                    fullscreenDialog: true,
                                  ),
                                );
                            }
                            } catch (e) {
                              final snackBar = SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(e.toString()),);
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            } finally {
                              model.endLoading();
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
                          child: Text("新規登録の方はこちら")
                      )
                    ],),
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