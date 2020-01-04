import 'package:Doraemon/main_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = false;
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  static final showCard = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter api demo.',
      home: Scaffold(
        appBar: AppBar(
          title: Text('21天精通Flutter'),
        ),
        body: Container(
            child: _buildStack(context),
            //宽高全屏
            width: double.infinity,
            height: double.infinity,
            //背景
            color: Colors.white10,
            //外间距
            margin: const EdgeInsets.all(16.0),
            //内间距
            padding: new EdgeInsets.all(24.0),
            //定位
            alignment: Alignment(0.0, 0.0),
            //旋转
            transform: new Matrix4.rotationZ(0)),
      ),
    );
  }

  // #docregion Card
  Widget _buildStack(BuildContext context) => InkWell(
      onTap: () {
        _toContentPage(context);
      },
      child: Stack(
        alignment: const Alignment(0.0, 0.6),
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade800,
            backgroundImage: AssetImage('images/flutter_icon.png'),
            radius: 100,
            child: Text('哆啦A梦'),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
            child: Text(
              'Flutter 百宝箱',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ));

  //#enddocregion Card

  //跳转目录页面
  void _toContentPage(BuildContext context) {
    //可以这样传参
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainContent()),
    );
    //或者这样传参
//    Navigator.of(context).push(
//      new MaterialPageRoute<void>(builder: (context) => RandomWords()),
//    );
  }
}
