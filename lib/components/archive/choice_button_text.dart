import 'package:flutter/material.dart';
import 'package:najme/utility.dart';


class choiceButtonText extends StatefulWidget {
  choiceButtonText({
    Key? key,
    this.text = "null",
    this.whenTap = null,
    required this.color,
    required this.textColor,
    this.width = 160,
    this.height = 160,
  }) : super(key: key);

  final String text;
  var whenTap;
  Color color;
  Color textColor;
  double height;
  double width;

  @override
  _choiceButtonTextState createState() => _choiceButtonTextState();
}

class _choiceButtonTextState extends State<choiceButtonText> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(adjustValue(context, 10)),
        child: InkWell(
          onTap: widget.whenTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(adjustValue(context, 76)),
              color: widget.color,
            ),
            height: widget.height,
            width: widget.width,
            child: Center(
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: adjustValue(context, 65),
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                  color: widget.textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
