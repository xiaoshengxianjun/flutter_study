import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Map arguments;
  LoginPage({Key key, this.arguments}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // 定义一个mobile的controller来获取输入内容
  TextEditingController _mobileController = TextEditingController();

  FocusNode focusMobile = new FocusNode();
  FocusNode focusPassword = new FocusNode();
  // FocusScopeNode focusScopeNode; // 下面代码中修改焦点操作时，如果不用FocusScope.of(context)操作，可以用此focusScopeNode来操作

  @override
  void initState() {
    _mobileController.addListener((){
      print('输入手机号：' + _mobileController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("登录")),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            TextField(
                autofocus: true, // 默认聚焦
                keyboardType: TextInputType.phone, // 键盘类型，可选值（text,multiline,number,phone,datetime,emailAddress,url）
                focusNode: focusMobile, // 关联focusMobile
                decoration: InputDecoration(
                    labelText: "手机号",
                    hintText: "请填写手机号",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.black12, width: 1)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1)
                    ),
                ),
                controller: _mobileController, // 通过controller方法获取输入值
                onEditingComplete: (){
                    // 点击键盘完成按钮时，触发此方法，没有返回值
                    print("complete点击确认");
                    // 通过FocusScope.of(context)获取Widget树中默认的FocusScopeNode，并修改焦点聚焦
                    FocusScope.of(context).requestFocus(focusPassword);
                }
            ),
            SizedBox(height: 15.0,), // SizeBox常用于给子元素限定固定的宽高，也可以代替padding和container，设置两个控件行或列之间的间距
            TextField(
                obscureText: true,
                focusNode: focusPassword, // 关联focusPassword
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "请填写密码",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.black12, width: 1)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1)
                    ),

                ),
                onChanged: (val){
                    // 输入内容发生变化时触发此方法，可获取到输入的内容
                    print("密码输入：$val");
                },
                onSubmitted: (val) {
                    // 点击键盘完成按钮时，可以触发此方法，能够获取当前输入值
                    print("当前输入内容为：$val");
                },
            ),
            SizedBox(height: 15.0,),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                      color: Colors.blue, // 按钮背景颜色
                      highlightColor: Colors.blue[700], // 按钮按下时的背景颜色
                      colorBrightness: Brightness.dark, // 按钮主题，默认是浅色主题，深色字，改成dark主题字体会变成浅色
                      splashColor: Colors.grey, // 点击时，水波动画中水波的颜色
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)), // 外形，这里设置成胶囊状
                      child: Container( // 这里之所以用Container是为了给按钮设置高度
                        height: 50.0,
                        alignment: Alignment.center,
                        child: Text('登录',
                          style: TextStyle( // 不通过style设置字体大小，默认字号有些小
                              fontSize: 20.0 // 修改按钮字体大小
                          ),
                        ),
                      ),
                      onPressed: (){}
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

