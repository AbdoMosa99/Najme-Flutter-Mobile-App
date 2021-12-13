import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/utility.dart';

class BirthDateButton extends StatefulWidget {
  BirthDateButton({
    Key? key,
    this.width = 144.0,
    this.height = 89.0,
    this.text = '',
  }) : super(key: key);

  final double width;
  final double height;
  String text;

  @override
  _BirthDateButtonState createState() => _BirthDateButtonState();
}

class _BirthDateButtonState extends State<BirthDateButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SvgPicture.asset(
            Assets.dateBox,
            width: widget.width,
            height: widget.height,
          ),
          
          Text(
            widget.text,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Colors.black,
              fontSize: adjustValue(context, 24.0),
              fontFamily: 'Cairo',
            ),
          ),
        ],
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              var months = [
                "يناير",
                "فبراير",
                "مارس",
                "إبريل",
                "مايو",
                "يونيو",
                "يوليو",
                "أغسطس",
                "سبتمبر",
                "أكتوبر",
                "نوفمبر",
                "ديسمبر"
              ];

              return SimpleDialog(
                title: const Text("اختر شهر ميلادك!"),
                children: [
                  for (var i in months)
                    SimpleDialogOption(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          widget.text = i;
                        });
                      },
                      child: Text(i),
                    ),
                ],
              );
            });
      },
    );
  }
}
