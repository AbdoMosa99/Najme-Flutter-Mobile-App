import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

// ignore: must_be_immutable
class SparialStar extends StatelessWidget {
  SparialStar({
    Key? key,
    this.img = "",
    this.backEMG ="",
    this.text=''
  }) 
  : super(key: key,);
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
            color: Colors.red,
            child: Padding(
            padding: EdgeInsets.all(adjustHeightValue(context, 2.0)),
              child: Stack(
                children: <Widget>[        
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      backEMG,
                      width: adjustValue(context, 100) ,
                      height: adjustValue(context, 100) ,
                    )
                  ),
                  if (img != "") ...[
                    Align(                       
                      alignment: Alignment.center,
                      child: Image.asset(
                        img,
                        width: adjustValue(context, 80),
                        height: adjustValue(context, 80),
                      ),                     
                    ) 
                  ]  
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: adjustValue(context, 2.0)),
            child: Text(
              text,
              style: TextStyle(
              fontSize: adjustValue(context, 15),
              color:AppColors.secondary,
              fontFamily: 'Cairo',
            ),
            ),
          )
        ],
      ),
    );
  }
}