import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../domain/book.dart';
import 'edit_profile_model.dart';

class EditProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditProfileModel>(
      create: (_) => EditProfileModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('プロフィール編集'),
        ),
        body: Center(
          child: Consumer<EditProfileModel>(builder: (context, model, child){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 150,
                    color: Colors.grey,
                  ),
                  TextField(
                    controller: model.nameController,
                    decoration: const InputDecoration(
                        hintText: '名前'
                    ),
                    onChanged: (text) {
                      model.setName(text);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: model.descriptionController,
                    decoration: const InputDecoration(
                        hintText: '自己紹介'
                    ),
                    onChanged: (text) {
                      model.setDescription(text);
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: model.isUpdated()
                          ? () async {
                        try {
                          print("更新開始");
                          await model.update();
                          Navigator.of(context).pop();
                          print("更新完了");
                        } catch (e) {
                          print(e);
                          final snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(e.toString()),
                          );
                        }
                      } : null,
                      child: const Text('更新する')),
                ],),
            );
          }),
        ),
      ),
    );
  }
}