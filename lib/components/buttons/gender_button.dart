import 'package:flutter/material.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';


class GenderButton extends StatefulWidget {
  GenderButton(
      {Key? key,
      this.image = Assets.error,
      this.color = AppColors.surface,
      this.whenTap = null})
      : super(key: key);

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
      child: InkWell(
        onTap: widget.whenTap,
        child: Container(
          width: adjustValue(context, 150.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Image(
              image: AssetImage(widget.image),
              height: adjustValue(context, 150.0),
              width: adjustValue(context, 150.0),
            ),
          ]),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(adjustValue(context, 20.0)),
            color: widget.color,
            border: Border.all(
              color: AppColors.secondary,
              width: adjustValue(context, 1),
            ),
          ),
        ),
      ),
    );
  }
}
