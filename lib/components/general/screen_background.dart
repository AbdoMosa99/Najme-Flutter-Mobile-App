
import 'package:flutter/material.dart';

Widget ScreenBackground({
  required final String bgImage,
  final Widget? child,
})
{
  return Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bgImage),
                fit: BoxFit.cover
              ),
            ),
            child: child,
            );
}