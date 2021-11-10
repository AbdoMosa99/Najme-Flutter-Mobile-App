import 'package:flutter/material.dart';

class choiseButtonText extends StatefulWidget {
  choiseButtonText({
    Key? key,
    this.text = "null",
    required this.whenTap,
    required this.color,
    required this.textColor,

  }) : super(key: key);

  String text;
  Function whenTap;
  Color color;
  Color textColor;

  @override
  _choiseButtonTextState createState() => _choiseButtonTextState();
}

class _choiseButtonTextState extends State<choiseButtonText> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: ()
          {
            widget.whenTap();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(76),
              color: widget.color,
            ),
            height: 160,
            width: 160,

            child: Center(
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 65,
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
