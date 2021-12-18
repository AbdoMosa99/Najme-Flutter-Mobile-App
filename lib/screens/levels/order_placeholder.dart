import 'package:flutter/cupertino.dart';
import 'package:najme/constants/colors.dart';

import '../../utility.dart';

class OrderPlaceholder extends StatefulWidget {
  OrderPlaceholder({ Key? key, required this.element }) : super(key: key);
  var color = null;
  var child = null;
  var strokeColor = AppColors.secondaryLight;
  var strokeWidth = 3.0;
  final element;
  @override
  _OrderPlaceholderState createState() => _OrderPlaceholderState();
}

class _OrderPlaceholderState extends State<OrderPlaceholder> {

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) 
      {
        return Container(
          width: adjustValue(context, 60.0),
          height: adjustValue(context, 60.0),
          color : widget.color,
          margin: EdgeInsets.all(adjustValue(context, 1.0)),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: widget.strokeColor,
              width: adjustValue(context, widget.strokeWidth),
            ),
          ),
          child: widget.child,
        );
      },
      onWillAccept: (data){
        return data==widget.element;
      },
    );
  }
}