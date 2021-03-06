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
          child: Stack(
            children: [
              Column(
                // UIの関数を縦に並べる
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start, // widgetを左寄せにする
                children: [
                  _pageTitle(),
                  _bookRideWidget(),
                ],
              ),
              // 画像を中央右寄りにする
              Align(
                alignment: Alignment.centerRight,
                child: _astroImageWidget(),
              ),
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
      // 画像の縦と横のサイズを調整
      height: _deviceHeght * 0.50,
      width: _deviceWidth * 0.65,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/astro_moon.png"),
        ),
      ),
    );
  }

  // bookWidget
  Widget _bookRideWidget() {
    return Container(
      height: _deviceHeght * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _destionationDropDownWidget(),
          _travellersInformationWidget(),
          _rideButton(),
        ],
      ),
    );
  }

  // ドロップダウンを表示する関数
  Widget _destionationDropDownWidget() {
    return CustomDropDownButtonClass(values: const [
      'James Webb Station',
      'Preneure Station',
    ], width: _deviceWidth);
  }

  // 旅行情報を表示する関数
  Widget _travellersInformationWidget() {
    return Row(
      // ドロップダウンボタンの間にスペースを作る
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomDropDownButtonClass(
          values: const ['1', '2', '3', '4'],
          width: _deviceWidth * 0.45,
        ),
        CustomDropDownButtonClass(
          values: const ['Economy', 'Business', 'First', 'Private'],
          width: _deviceWidth * 0.40,
        ),
      ],
    );
  }

  // 読むボタン
  Widget _rideButton() {
    return Container(
      padding: EdgeInsets.only(bottom: _deviceHeght * 0.01),
      width: _deviceWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        onPressed: () {},
        child: const Text(
          "Bookride!",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
