import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("第二个页面"),
      ),
      body: Column(
        children: <Widget>[
          Text(args),
          RaisedButton(
              child: Text("跳转第三页"),
              onPressed: () async {
                args = await Navigator.pushNamed(context, '/page3');
                print(args);
              }
          )
        ],
      ),
    );
  }
}

