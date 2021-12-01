import 'package:flutter/material.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';

class choiseButtonText extends StatefulWidget {
  choiseButtonText({
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
  _choiseButtonTextState createState() => _choiseButtonTextState();
}

class _choiseButtonTextState extends State<choiseButtonText> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: widget.whenTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(76),
              color: widget.color,
            ),
            height: widget.height,
            width: widget.width,
            child: Center(
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 65,
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
