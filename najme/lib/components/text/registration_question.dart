import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';

class order extends StatefulWidget {
  order({
    Key? key,
    this.question = 'Null'
  }) : super(key: key);

  final String question;

  @override
  _orderState createState() => _orderState();
}

class _orderState extends State<order> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
          widget.question,
          style: TextStyle(
              fontSize: 64,
              fontFamily: 'Cairo',
              color: AppColors.primary
          ),
        )
    );
  }
}
