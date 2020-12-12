import 'package:flutter/material.dart';

class HomeMainWidget extends StatelessWidget {
  final String asset;
  final String title;

  const HomeMainWidget({Key key, this.asset, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          height: 50,
          image: AssetImage(asset),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
