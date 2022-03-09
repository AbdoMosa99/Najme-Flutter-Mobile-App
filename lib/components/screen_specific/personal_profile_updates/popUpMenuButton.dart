import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

class PopUpMenu extends StatefulWidget {
  PopUpMenu({
    Key? key,
    this.initialIndex,
    this.context,
    this.list,
    this.callBack,
  }) : super(key: key);

  BuildContext? context;
  var initialIndex;
  final List? list;
  final Function(dynamic)? callBack;
  @override
  _PopUpMenuState createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: adjustHeightValue(context, 45),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(
          adjustValue(context, 15.0),
        )),
        color: AppColors.surface,
        border: Border.all(
          color: AppColors.primaryLight,
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: PopupMenuButton(
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide:
                  BorderSide(color: AppColors.secondaryLight, width: 1)),
          color: AppColors.surface,
          itemBuilder: (context) {
            List<PopupMenuEntry> buildList = [];
            for (int i = 0; i < widget.list!.length; i++) {
              buildList.add(PopupMenuItem(
                value: i,
                child: Center(
                  child: Text(
                    '${widget.list![i]}',
                    style: TextStyle(
                      fontSize: adjustValue(context, 18.0),
                      fontFamily: 'Cairo',
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ));
            }
            return buildList;
          },
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    '${widget.list![widget.initialIndex!]}',
                    style: TextStyle(
                        fontSize: adjustValue(context, 16.0),
                        fontFamily: 'Cairo',
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Icon(
                Icons.arrow_drop_down_outlined,
                size: adjustValue(context, 24),
                color: AppColors.secondary,
              )
            ],
          ),
          onSelected: (value) {
            setState(() {
              widget.initialIndex = value;
            });
            widget.callBack!(value);
            // print(widget.initialIndex);
            // widget.choosenIndex = widget.initialIndex;
            // print(widget.choosenIndex);
          },
        ),
      ),
    );
  }
}
