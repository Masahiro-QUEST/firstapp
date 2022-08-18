import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: .6,
        title: Text(
        '古泉さん',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(child: Column(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  )
                ),
                child: Text('Flutterは難しいね'),
              )
            ],)),
            textinputWidget()
          ],
        ),
      )
    );

  }

  Container textinputWidget() {
    return Container(
            height: 68,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.camera_alt_outlined),
                  iconSize: 28,
                  color: Colors.black54,
                  onPressed: (){},
                ),
                IconButton(
                  icon: Icon(Icons.photo_outlined),
                  iconSize: 28,
                  color: Colors.black54,
                  onPressed: (){},
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(40)
                  ),
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),),
                ),
                IconButton(
                  icon: Icon(Icons.mic),
                  iconSize: 28,
                  color: Colors.black54,
                  onPressed: (){},
                ),
              ],
            ),
          );
  }
}
