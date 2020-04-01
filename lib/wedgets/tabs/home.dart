import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {

  List _swiperList = [
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2715144986,4235468516&fm=26&gp=0.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1585740312062&di=1912635b3d8bdb3a04183fc0dd5a7f12&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20190111%2F259b252bc71c445cbe2d4e60800408a9.png",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1585740384531&di=066c06311c9ace90e18dd167b31a0099&imgtype=0&src=http%3A%2F%2Fimg.lixiaomeng.net%2Fxkbb%2F1e64a34a86a5123aebaab73c255b2f6a.jpg",
    "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3442485252,3832173426&fm=26&gp=0.jpg"
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
          height: 140.0,
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
