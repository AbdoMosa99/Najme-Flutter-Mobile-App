import 'package:flutter/material.dart';
import 'package:najme/components/general/back_button.dart';
import 'package:najme/components/screen_specific/space/space_main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SpaceContainer(
          child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: adjustHeightValue(context, 50),
              ),
              Image.asset(
                Assets.store,
              ),
            ],
          ),
          PBackButton(
            context: context,
            color: AppColors.secondary,
          ),
        ],
      )),
    );
  }
}
