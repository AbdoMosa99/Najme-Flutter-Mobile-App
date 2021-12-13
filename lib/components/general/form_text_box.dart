import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

class FormTextBox extends TextFormField {
  FormTextBox({
    Key? key,
    required BuildContext context,
    required String text,
    required TextEditingController controllerKind,
    TextInputType type = TextInputType.name,
    var suffIcon,
    bool ispass = false,
    var suffixFun,
  }) 
  : super(
    key: key,
    style: TextStyle(
      fontFamily: 'Cairo',
      fontSize: adjustValue(context, 17.0),
    ),

    obscureText: ispass,
    controller: controllerKind,
    keyboardType: type,
    decoration: InputDecoration(
      labelText: text,
      contentPadding: EdgeInsets.symmetric(vertical: adjustHeightValue(context, 5.0), horizontal: adjustWidthValue(context, 15.0)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(adjustValue(context, 15.0)),
        borderSide: const BorderSide(
          color: AppColors.primaryLight,
        ),
      ),
      suffixIcon: IconButton(
        onPressed: suffixFun, 
        icon: Icon(suffIcon)
      ),
      fillColor: AppColors.surface,
      filled: true,
      labelStyle: TextStyle(
        fontFamily: 'Cairo',
        fontSize: adjustValue(context, 15.0),
      ),
    ),
  );
}
