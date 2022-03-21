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
      body: SafeArea(
        // iPhone13の画面に対応
        child: Container(
          height: _deviceHeght,
          width: _deviceWidth,
          // 水平方向のパディングを設定
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
          child: Column(
            // UIの関数を縦に並べる
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start, // widgetを左寄せにする
            children: [
              _pageTitle(),
              _destionationDropDownWidget(),
            ],
          ),
        ),
      ),
    );
  }

  // タイトルを表示する関数
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

  // ドロップダウンを表示する関数
  Widget _destionationDropDownWidget() {
    List<String> _items = [
      'James Webb Station',
      'Preneure Station',
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _deviceHeght * 0.05),
      width: _deviceWidth,
      decoration: BoxDecoration(color: const Color.fromRGBO(53, 53, 53, 1.0),
      borderRadius: BorderRadius.circular(10)),
      child: DropdownButton(
        value: _items.first,
        onChanged: (_) {},
        items: _items.map((e) {
          return DropdownMenuItem(
            child: Text(e),
            value: e,
          );
        }).toList(),
        underline: Container(),
        dropdownColor: const Color.fromRGBO(53, 53, 53, 1.0),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
