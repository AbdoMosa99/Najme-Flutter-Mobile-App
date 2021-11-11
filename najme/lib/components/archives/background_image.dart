/**


import 'package:flutter/material.dart';
import 'package:najme/constants/assets.dart';

class BackgroundImage extends StatelessWidget {
  BackgroundImage(Key? key , this.body) : super(key: key);

  Widget body;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.screenBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: body
    );
  }
}


 **/
