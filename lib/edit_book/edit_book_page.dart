import 'package:firstapp/edit_book/edit_book_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../domain/book.dart';

class EditBookPage extends StatelessWidget {
  final Book book;
  EditBookPage(this.book);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditBookModel>(
      create: (_) => EditBookModel(book),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('本を編集'),
        ),
        body: Center(
          child: Consumer<EditBookModel>(builder: (context, model, child){
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
                    controller: model.titleController,
                    decoration: const InputDecoration(
                        hintText: '本のタイトル'
                    ),
                    onChanged: (text) {
                      model.setTitle(text);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: model.authorController,
                    decoration: const InputDecoration(
                        hintText: '本の著者'
                    ),
                    onChanged: (text) {
                      model.setTitle(text);
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: model.isUpdated()
                          ? () async {
                        try {
                          await model.update();
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pop(model.title);

                        } catch (e) {
                          final snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(e.toString()),);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
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