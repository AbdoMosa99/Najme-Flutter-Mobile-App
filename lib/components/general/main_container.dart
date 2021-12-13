import 'package:flutter/material.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    Key? key,
    required this.child,
    this.bgImage = Assets.screenBackground,
    this.appBar,
    this.drawer,
    this.floatingActionButton = false,
    this.floatingActionIcon = Icons.arrow_back,
    this.onFloatingActionButtonTap,
  }) 
  : super(key: key);

  final Widget child;
  final String bgImage;
  final AppBar? appBar;
  final Drawer? drawer;

  final bool floatingActionButton;
  final IconData? floatingActionIcon;
  final void Function()? onFloatingActionButtonTap;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: appBar,
        endDrawer: Container(
          margin: EdgeInsets.zero,
          child: drawer,
          width: adjustWidthValue(context, 280.0),
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgImage), 
              fit: BoxFit.cover
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(adjustValue(context, 20.0)),
            child: child,
            ),
          ),

        floatingActionButton: floatingActionButton? Container(
          width: adjustValue(context, 56.0),
          height: adjustValue(context, 56.0),
          child: FloatingActionButton(
            key: key,
            onPressed: onFloatingActionButtonTap,
            backgroundColor: AppColors.primary,
            child: Icon(
              floatingActionIcon,
              size: adjustValue(context, 24.0),
            ),
          ),
        ) : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}