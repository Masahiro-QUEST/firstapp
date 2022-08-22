import 'package:firstapp/add_book/add_book_page.dart';
import 'package:firstapp/book_list/book_list_model.dart';
import 'package:firstapp/edit_book/edit_book_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../domain/book.dart';

// import '../footer.dart';
// import '../header.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class BookListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBookList(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本一覧'),
        ),
        body: Center(
          child: Consumer<BookListModel>(builder: (context, model, child){
            final List<Book>? books = model.books;

            if (books == null){
              return CircularProgressIndicator();
            }
            final List<Widget> widgets = books
                .map(
                  (book) => Slidable(
                    endActionPane: ActionPane(
                      motion: DrawerMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (value) async {
                            final String? title = await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EditBookPage(book),
                                ));
                            if(title != null){
                              final snackBar = SnackBar(
                                content: Text('$titleを編集しました'),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }

                            model.fetchBookList();
                          },
                          backgroundColor: Colors.blue,
                          icon: Icons.edit,
                          label: '編集',
                        ),
                        SlidableAction(
                          onPressed: (value) async{
                            await showConfirmDialog(context, book, model);
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: '削除',
                        ),
                      ],

                    ),
                    child: ListTile(
                      leading: book.imgURL != null
                          ? Image.network(book.imgURL!) : null,
                      title: Text(book.title),
                      subtitle: Text(book.author),
                    ),
                  ),
            ).toList();
            return ListView(
              children: widgets,
            );
          }),
        ),
        floatingActionButton: Consumer<BookListModel>(builder: (context, model, child){
            return FloatingActionButton(
              onPressed: ()async {
                final bool? added = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddBookPage(),
                      fullscreenDialog: true,
                    ));
                if(added != null && added){
                  final snackBar = SnackBar(
                      content: Text('本を追加しました'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                model.fetchBookList();
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            );
          }
        ),
      ),
    );
  }

  Future showConfirmDialog(
      BuildContext context,
      Book book,
      BookListModel model,
      ){
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("削除の確認"),
          content: Text("${book.title}を削除しますか？"),
          actions: [
            TextButton(
              child: Text("いいえ"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text("はい"),
              onPressed: () async {
                // modelで削除
                await model.delete(book);
                Navigator.pop(context);
                final snackBar = SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('${book.title}を削除しました'),
                );
                model.fetchBookList();
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ],
        );
      },
    );
  }

}