import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';

class Order extends StatefulWidget {
  Order({
    Key? key,
    this.question = 'Null',
    this.size = 64,
    this.right = true,
    this.maxlines = 2
  }) : super(key: key);

  final String question;
  final double size;
  final bool right;
  final int  maxlines;

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
          widget.question,
          maxLines: widget.maxlines,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          textDirection: widget.right ? TextDirection.rtl : TextDirection.ltr,
          style: TextStyle(
              fontSize: widget.size,
              fontFamily: 'Cairo',
              color: AppColors.primaryDark
          ),
        )
    );
  }
}
