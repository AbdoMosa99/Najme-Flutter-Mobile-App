import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';

class order extends StatefulWidget {
  order({
    Key? key,
    this.question = 'Null',
    this.size = 64,
    this.right = true
  }) : super(key: key);

  final String question;
  final double size;
  final bool right;

  @override
  _orderState createState() => _orderState();
}

class _orderState extends State<order> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
          widget.question,
          maxLines: 2,
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
