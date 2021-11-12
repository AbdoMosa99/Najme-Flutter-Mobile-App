import 'package:flutter/material.dart';
import 'package:najme/constants/assets.dart';

class BirthDateButton extends StatefulWidget {
  BirthDateButton({
    Key? key,
    this.width = 144.0,
    this.height = 89.0,
    this.text = 'Null',
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
    return GestureDetector(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image(
            image: const AssetImage(Assets.dateBox),
            width: widget.width,
            height: widget.height,
          ),
          Text(
            widget.text,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 34.0,
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
