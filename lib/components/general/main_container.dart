import 'package:flutter/material.dart';
import 'package:najme/components/general/screen_background.dart';
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
    this.floatingActionIcon = Icons.arrow_forward,
    this.floatingActionIconColor = AppColors.white,
    this.onFloatingActionButtonTap,
    this.paddingAll = 20.0,
  }) 
  : super(key: key);

  final Widget child;
  final String bgImage;
  final AppBar? appBar;
  final Drawer? drawer;

  final bool floatingActionButton;
  final IconData? floatingActionIcon;
  final Color? floatingActionIconColor;
  final void Function()? onFloatingActionButtonTap;

  final double paddingAll;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: appBar,
          endDrawer: Container(
            margin: EdgeInsets.zero,
            child: drawer,
            width: adjustWidthValue(context, 280.0),
          ),
          body: ScreenBackground(
            bgImage: bgImage,
            child: Padding(
              padding: EdgeInsets.all(adjustValue(context, paddingAll)),
              child: child
            ),
          ),

          floatingActionButton: floatingActionButton? Container(
            width: adjustValue(context, 56.0),
            height: adjustValue(context, 56.0),
            child: FloatingActionButton(
              key: key,
              onPressed: onFloatingActionButtonTap,
              backgroundColor: AppColors.primary,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Icon(
                  floatingActionIcon,
                  size: adjustValue(context, 24.0),
                  color: floatingActionIconColor,
                ),
              ),
            ),
          ) : null,
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        ),
      ),
    );
  }
}