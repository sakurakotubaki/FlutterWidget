import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // 幅と高さの変数
  late double _deviceHeght, _deviceWidth;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _deviceHeght = MediaQuery.of(context).size.height; // 高さを設定
    _deviceWidth = MediaQuery.of(context).size.width; // 幅を設定
    return Scaffold(
      body: SafeArea( // iPhone13の画面に対応
        child: Container(
          height: _deviceHeght,
          width: _deviceWidth,
          // 水平方向のパディングを設定
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
          child: _pageTitle(),
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return const Text(
      "#GoMoon",
      style: TextStyle(
        color: Colors.white,
        fontSize: 70,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  // 画像を表示する関数
  Widget _astroImageWidget() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/astro_moon.png"),
        ),
      ),
    );
  }
}
