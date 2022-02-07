import 'package:flutter/material.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/utility.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(adjustHeightValue(context, 15)),
            child: Lottie.asset('assets/lottie/loading.json'),
          ),
        ],
      ),
    );
  }
}
