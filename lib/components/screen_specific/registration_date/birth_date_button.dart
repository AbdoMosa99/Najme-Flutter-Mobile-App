import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

class BirthDateButton extends StatefulWidget {
  BirthDateButton({
    Key? key,
    this.width = 144.0,
    this.height = 89.0,
    this.text = '',
    this.fontSize = 24,
    this.data,
    this.title = "NULL"
  }) : super(key: key);

  final double width;
  final double height;
  final double fontSize;
  final String title;

  var data;
  String text;


  @override
  _BirthDateButtonState createState() => _BirthDateButtonState();
}

class _BirthDateButtonState extends State<BirthDateButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SvgPicture.asset(
            Assets.dateBox,
            width: widget.width,
            height: widget.height,
          ),
          
          Text(
            widget.text,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Colors.black,
              fontSize: adjustValue(context, widget.fontSize),
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
                  return SimpleDialog(
                      title: Text(
                                widget.title,
                                  textAlign: TextAlign.right,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: AppColors.primaryDark,
                                    fontSize: adjustValue(context, 25.0),
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                      backgroundColor: AppColors.surface,
                      children: [
                        for (var i in widget.data)
                        SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() {
                                widget.text = i.toString();
                              });
                            },
                            child: Text(
                                      i.toString(),
                                      textAlign: TextAlign.right,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: adjustValue(context, 20.0),
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                          ),
                      ],
                  );
                }

          );
      },
    );
  }
}
