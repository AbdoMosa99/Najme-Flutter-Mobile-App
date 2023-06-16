import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';


class GenderButton extends StatefulWidget {
  GenderButton(
      {Key? key,
      this.image = Assets.placeholder,
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
            Expanded(
              child: SvgPicture.asset(widget.image),
            )
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
