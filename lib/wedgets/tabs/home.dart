import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {

  List _swiperList = [
    "https://fuss10.elemecdn.com/a/3f/3302e58f9a181d2509f3dc0fa68b0jpeg.jpeg",
    "https://fuss10.elemecdn.com/0/6f/e35ff375812e6b0020b6b4e8f9583jpeg.jpeg",
    "https://fuss10.elemecdn.com/d/e6/c4d93a3805b3ce3f323f7974e6f78jpeg.jpeg"
  ]; // 定义轮播图列表

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("页面标题名称"),
        centerTitle: true, // 设置标题居中，安卓设备上默认居左显示
        actions: <Widget>[
          // 这里可以设置标题栏右侧的图表按钮
          IconButton(
              icon: Icon(Icons.share),
              onPressed: (){
                  // 这里可以设置图标按钮的点击事件
              })
        ],
      ),
      drawer: Drawer( // 抽屉菜单，会在标题栏左侧自动添加一个菜单图表，点击图表或者从屏幕左侧往右滑都可以打开菜单列表，endDrawer是右边打开的抽屉
        child: MediaQuery.removePadding(
            context: context,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.add),
                        title: const Text('菜单操作1'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.settings),
                        title: const Text('菜单操作2'),
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
      body: Container(
          height: 200.0,
          child: Swiper(
              itemBuilder: (BuildContext context, int index){
                return new Image.network(
                  _swiperList[index], // index自动修改，传入对应的图片地址即可
                  fit: BoxFit.fill,
                );
              },
              itemCount: 3,
              autoplay: true, // 是否自动播放，默认false
              loop: true, // 无限循环轮播模式，默认true
              pagination: SwiperPagination(),
          ),
      ),
    );
  }
}
