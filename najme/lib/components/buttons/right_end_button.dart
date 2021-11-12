import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';

class RightEndButton extends StatefulWidget {
   RightEndButton({
     Key? key,
     this.icon=Icons.arrow_forward_sharp,
     this.whenTap = null
   }) : super(key: key);

   IconData icon;
   var whenTap;

  @override
  _RightEndButtonState createState() => _RightEndButtonState();
}

class _RightEndButtonState extends State<RightEndButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed:widget.whenTap,
        backgroundColor: AppColors.primary,

        child: Icon(
          widget.icon,
        ),
    );
  }
}
