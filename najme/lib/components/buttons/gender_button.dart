import 'package:flutter/material.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';

class GenderButton extends StatefulWidget {
  GenderButton({
    Key? key,
    this.image = Assets.error,
    this.color = AppColors.surface,
    this.whenTap = null
  }) : super(key: key);

  final String image;
  Color color;
  var whenTap;

  @override
  _GenderButtonState createState() => _GenderButtonState();
}

class _GenderButtonState extends State<GenderButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
        onTap: widget.whenTap,

            child: Container(
              width: 150.0,
              child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Image(
                  image:  AssetImage(widget.image),
                  height: 150.0,
                  width: 150.0,
                ),
              ]),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: widget.color,
                border: Border.all(
                  color: AppColors.primaryDark,
                  width: 1,
                ),
              ),
            ),
        ),
    );
  }
}
