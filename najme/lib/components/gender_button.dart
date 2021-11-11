import 'package:flutter/material.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';

class GenderButton extends StatefulWidget {
  const GenderButton(Key? key, this.gender, this.choice) : super(key: key);

  final int choice;
  final int gender;

  @override
  _GenderButtonState createState() => _GenderButtonState();
}

class _GenderButtonState extends State<GenderButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      width: 150.0,
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Image(
          image: widget.gender == 1
              ? AssetImage('assets/images/female.png')
              : AssetImage('assets/images/male.png'),
          height: 150.0,
          width: 150.0,
        ),
      ]),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: widget.choice == 1 ? AppColors.primaryDark : AppColors.surface,
        border: Border.all(
          color: AppColors.primaryDark,
          width: 1,
        ),
      ),
    ));
  }
}
