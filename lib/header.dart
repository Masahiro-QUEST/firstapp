import 'package:firstapp/routes/talk_route.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget{
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TalkScreen(),
                  ));
            },
          ),
      ),
      actions: [
        Padding(padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: Icon(Icons.message),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TalkScreen(),
            ));
          },
        )
        ),
      ],
      title: Text('ホーム'),
      backgroundColor: Colors.black87,
      centerTitle: true,
      elevation: 0.0,
    );
  }
}