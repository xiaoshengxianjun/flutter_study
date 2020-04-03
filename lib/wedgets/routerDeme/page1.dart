import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个页面"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
              child: Text("跳转第二页"),
              onPressed: (){
                Navigator.pushNamed(context, '/page2', arguments: 'hello');
              }
          )
        ],
      ),
    );
  }
}
