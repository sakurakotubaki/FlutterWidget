import 'package:flutter/material.dart';
import 'package:go_moon/pages/widgets/custom_dropwown_button.dart';

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
              _travellersInformationWidget(),
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
    return CustomDropDownButtonClass(values: const [
      'James Webb Station',
      'Preneure Station',
    ],
    width: _deviceWidth
    );
  }

  // 旅行情報を表示する関数
  Widget _travellersInformationWidget() {
    return CustomDropDownButtonClass(values: const [
      '1',
      '2',
      '3',
      '4'
    ],
    width: _deviceWidth * 0.45,
    );
  }
}
