
import 'package:flutter/material.dart';

import '../../utility.dart';

class FilterCard extends Container{
  FilterCard({
    Key? key,

    required BuildContext context,
    required String titleText,

  }) : super(
          key: key,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(adjustValue(context, 8)),
            ),
            color: const Color.fromRGBO(80, 54, 164, 0.65),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(adjustValue(context, 0.5)),
                spreadRadius: adjustValue(context, 2),
                blurRadius: adjustValue(context, 2),
                offset: const Offset(0, 3),
              ),
            ],
          ),

          child: Padding(
            padding: const EdgeInsets.all(2.5),
            child: Text(
                titleText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: adjustValue(context, 19),
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w800,

                ),
            ),
          ),

);
}
