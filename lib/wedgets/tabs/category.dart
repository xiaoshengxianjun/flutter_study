import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with SingleTickerProviderStateMixin {
  List tabs = ["新闻","历史","图片"]; // 定义tabbar列表
  TabController _tabController; // 需要定义一个Controller

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(
      // initialIndex: 1, // 初始化激活索引，默认是0，有序该tabBar索引的业务需求，可以直接更改此处
        length: tabs.length,
        vsync: this // 如果此处vsync:this标红报错，查看上面代码是否加上with SingleTickerProviderStateMixin
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label, // 指示器即下划线宽度计算方式，两个选项tab（默认，跟tab等宽）label（跟文本等宽）
            indicatorWeight: 3, // 指示器的高度，默认为2
            indicatorColor: Colors.black,
            // labelColor: Colors.red, // 标签颜色，如果不设置未选中状态标签颜色，默认全部标签都是此颜色
            unselectedLabelColor: Colors.black, // 未选中状态下的标签颜色
            // isScrollable: true, // 是否可以滚动，默认false，当选项较多时可以选择此项设为true
            controller: _tabController, // 必须要有个controller监控Tab菜单切换
            tabs: tabs.map((e) => Tab(text:e)).toList() // 箭头函数，遍历tabs列表，生成Tab组件 Tab有text,icon和child三个属性
        ),
      ),
      body: TabBarView(
        controller: _tabController, // 必须要有个controller，而且和TabBar中的controller是同一个
        children: tabs.map((e){
          return Container(
            alignment: Alignment.center,
            child: Text(e,textScaleFactor: 5.0,), // 这里是示例，显示放大五倍的标签文本
          );
        }).toList(),
      ),
    );
  }
}
