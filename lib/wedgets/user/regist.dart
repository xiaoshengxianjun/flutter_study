import 'package:flutter/material.dart';

class RegistPage extends StatefulWidget {
  @override
  _RegistPageState createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> with SingleTickerProviderStateMixin{
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

  int sex = 1; // 设定一个性别变量
  List hobby = [false, false, false]; // 设置一个爱好数组，每一项对应一个选择项
  bool rich = false; // 设置一个是否有钱的变量

  @override
  Widget build(BuildContext context) {
    return Scaffold( // 一个页面骨架容器类型组件，在这里可以设置导航栏，主要页面等内容
      appBar: AppBar(title: Text("注册")),
      body: SingleChildScrollView( // 因为本页面内容较多，当输入框聚焦时，弹起的键盘会使部分页面内容溢出，所以使用此布局方案
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container( // container相当于html中的div，充当一个容器的作用
              height: 60.0,
              decoration: BoxDecoration(
                border: Border( // 设置边框，这里只设置下边框，让整个输入区域有个统一的下边框
                    bottom: BorderSide(
                        width: 1.0,
                        color: Colors.grey
                    )
                )
              ),
              child: Row(
                children: <Widget>[
                  // 与下面的SizeBox()同属于限制类容器，对子组件添加而外的约束，这里限定限定输入框前面的文本描述宽度，在html中相当于这种布局：
                  // <div>
                  // <label>手机号</label><input />
                  // </div>
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 60.0
                    ),
                    child: Text("手机号"),
                  ),
                  Expanded( // 流式布局,这里会占满父容器剩余的空间
                      child: TextField(
                          autofocus: true, // 默认聚焦
                          keyboardType: TextInputType.phone, // 键盘类型，可选值（text,multiline,number,phone,datetime,emailAddress,url）
                          focusNode: focusMobile, // 关联focusMobile
                          decoration: InputDecoration(
                            hasFloatingPlaceholder: false, // labelText是否浮动，默认true，修改为false则LabelText在聚焦时不会上浮且不显示
                            labelText: "请填写手机号", // 用于默认状态下描述输入框信息，如手机号，密码等文本，聚焦时会自动上浮，类似input中的placeholder
                            hintText: "请填写手机号", // 聚焦状态下显示的文本描述，类似input中的placeholder
                            isDense: true, // 是否改变输入框为密集型，默认false，如果为true，图标和间距都会变小
                            enabledBorder: OutlineInputBorder( // 输入框可用时显示的边框
                                borderSide: BorderSide(color: Colors.transparent, width: 1)
                            ),
                            focusedBorder: OutlineInputBorder( // 聚焦时显示的边框
                                borderSide: BorderSide(color: Colors.transparent, width: 1)
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
                  )

                ],
              ),
            ),
            SizedBox(height: 15.0,), // SizeBox常用于给子元素限定固定的宽高，也可以代替padding和container，设置两个控件行或列之间的间距
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                  border: Border( // 设置边框，这里只设置下边框
                      bottom: BorderSide(
                          width: 1.0,
                          color: Colors.grey
                      )
                  )
              ),
              child: Row(
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: 60.0
                    ),
                    child: Text("密码"),
                  ),
                  Expanded(
                      child: TextField(
                        obscureText: true,
                        focusNode: focusPassword, // 关联focusPassword
                        decoration: InputDecoration(
                          hasFloatingPlaceholder: false,
                          labelText: "请填写密码",
                          hintText: "请填写密码",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)), // 直接在TextField上设置圆角边框
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
                  )
                ],
              ),
            ),
            SizedBox(height: 15.0,),
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                  border: Border( // 设置边框，这里只设置下边框
                      bottom: BorderSide(
                          width: 1.0,
                          color: Colors.grey
                      )
                  )
              ),
              child: Row(
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: 60.0
                    ),
                    child: Text("性别"),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Radio(
                            value: 1, // 当前组件的值
                            groupValue: this.sex, // 当前组件所属组的值，即操作的最终结果值
                            onChanged: (e){
                              // 组件本身并不会保存当前状态，选中状态由父组件来管理，当被点击时，会触发此事件。
                              // 通过此事件获取当前值后更新父组件变量，借此更新页面显示状态
                              setState(() {
                                this.sex = e;
                              });
                            }
                        ),
                        Text("男"),
                        Radio(
                            value: 2,
                            groupValue: sex,
                            activeColor: Colors.red, // 激活状态下显示的颜色
                            onChanged: (e){
                              setState(() {
                                sex = e;
                              });
                            }
                        ),
                        Text("女"),
                      ],
                    )
                  )
                ],
              ),
            ),
            SizedBox(height: 15.0,),
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                  border: Border( // 设置边框，这里只设置下边框
                      bottom: BorderSide(
                          width: 1.0,
                          color: Colors.grey
                      )
                  )
              ),
              child: Row(
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: 60.0
                    ),
                    child: Text("爱好"),
                  ),
                  Expanded(
                      child: Row(
                        children: <Widget>[
                            Checkbox(
                                value: hobby[0],
                                onChanged: (e){
                                    setState(() {
                                      hobby[0] = e;
                                    });
                                }
                            ),
                            Text("财富"),
                            Checkbox(
                                value: hobby[1],
                                activeColor: Colors.yellow, // 设置激活状态下的颜色
                                onChanged: (e){
                                  setState(() {
                                    hobby[1] = e;
                                  });
                                }
                            ),
                            Text("美食"),
                            Checkbox(
                                value: hobby[2],
                                activeColor: Colors.red,
                                onChanged: (e){
                                  setState(() {
                                    hobby[2] = e;
                                  });
                                }
                            ),
                            Text("美女"),
                        ],
                      )
                  )
                ],
              ),
            ),
            SizedBox(height: 15.0,),
            Container(
              height: 60.0,
              decoration: BoxDecoration(
                  border: Border( // 设置边框，这里只设置下边框
                      bottom: BorderSide(
                          width: 1.0,
                          color: Colors.grey
                      )
                  )
              ),
              child: Row(
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: 60.0
                    ),
                    child: Text("有钱"),
                  ),
                  Expanded(
                      child: Row(
                        children: <Widget>[
                          Switch(
                              value: rich,
                              activeColor: Colors.green, // 激活时圆点的颜色
                              activeTrackColor: Colors.pink, // 激活时横条的颜色
                              onChanged: (e){
                                setState(() {
                                  rich = e;
                                });
                              }
                          ),
                          Text("是"),
                        ],
                      )
                  )
                ],
              ),
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
                      onPressed: (){
                          print("注册成功");
                      }
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

