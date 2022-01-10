import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

// ignore: must_be_immutable
class SparialStarDark extends StatelessWidget {
  SparialStarDark({
    Key? key,
    this.img = "",
    this.backEMG ="",
    this.text=''
  }) 
  : 
  super(key: key,);
  String img="";
  String backEMG="";
  String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            width: adjustValue(context, 110) ,
            height: adjustValue(context, 110) ,
            child: Padding(
            padding: EdgeInsets.all(adjustValue(context, 2.0)),
              child: Stack(
                children: <Widget>[        
                  Container(
                    alignment: Alignment.center,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstIn),
                      child: Image.asset(backEMG ))
                  ),
                  if (img != "") ...[
                    Align(                       
                      alignment: Alignment.center,
                      child: Image.asset(
                      img ,
                      width: adjustValue(context, 80),
                      height: adjustValue(context, 80),
                      ),                     
                    ) 
                  ]  
                ],
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: adjustValue(context, 15),
              color:AppColors.secondary.withOpacity( adjustValue(context, 0.4)),
              fontFamily: 'Cairo',
            ),
          )
        ],
      ),
    );
  }
}