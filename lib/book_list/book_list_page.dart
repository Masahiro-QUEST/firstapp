import 'package:firstapp/add_book/add_book_page.dart';
import 'package:firstapp/book_list/book_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../domain/book.dart';

// import '../footer.dart';
// import '../header.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class BookListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BooklistModel>(
      create: (_) => BooklistModel()..fetchBookList(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本一覧'),
        ),
        body: Center(
          child: Consumer<BooklistModel>(builder: (context, model, child){
            final List<Book>? books = model.books;

            if (books == null){
              return CircularProgressIndicator();
            }

            final List<Widget> widgets = books
                .map(
                  (book) => ListTile(
                    title: Text(book.title),
                    subtitle: Text(book.author),
                  ),
            ).toList();
            return ListView(
              children: widgets,
            );
          }),
        ),
        floatingActionButton: Consumer<BooklistModel>(builder: (context, model, child){
            return FloatingActionButton(
              onPressed: ()async {
                final bool? added = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddBooKPage(),
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
}