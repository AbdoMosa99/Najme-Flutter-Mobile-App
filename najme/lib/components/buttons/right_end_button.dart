import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';

class rightEndButton extends StatefulWidget {
   rightEndButton({Key? key,this.icon=Icons.arrow_forward_sharp}) : super(key: key);

   IconData icon;

  @override
  _rightEndButtonState createState() => _rightEndButtonState();
}

class _rightEndButtonState extends State<rightEndButton> {
  @override
  Widget build(BuildContext context) {
    return Container(

      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: (){},
        backgroundColor: AppColors.primary,

        child: Icon(
          widget.icon,

        ),

      ),
    );
  }
}
