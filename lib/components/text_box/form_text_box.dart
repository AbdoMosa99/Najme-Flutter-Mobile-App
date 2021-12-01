import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';

class FormTextBox extends TextFormField {
  FormTextBox({
    Key? key,
    String text = 'Null',
    int length = 20,
    required TextEditingController controllerKind,
    TextInputType type = TextInputType.name,
    var suffIcon = null,
    bool ispass = false,
    var suffixFun = null,
  }) 
  : super(
    key: key,
    maxLength: length,
    obscureText: ispass,
    controller: controllerKind,
    keyboardType: type,
    decoration: InputDecoration(
      labelText: text,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
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
      labelStyle: const TextStyle(
        fontFamily: 'Cairo',
        fontSize: 20.0,
      ),
    ),
  );
}
