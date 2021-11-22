import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';

class FormTextBox extends StatefulWidget {
  FormTextBox({
    Key? key,
    this.text = 'Null',
    this.length = 20,
    required this.controllerKind,
    this.type = TextInputType.name,
    this.suffIcon = null,
    this.ispass = false,
    this.suffixFun = null,
  }) : super(key: key);

  final String text;
  final int length;
  final TextEditingController controllerKind;
  final TextInputType type;
  var suffIcon;
  bool ispass;
  var suffixFun;
  @override
  _FormTextBoxState createState() => _FormTextBoxState();
}

class _FormTextBoxState extends State<FormTextBox> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          maxLength: widget.length,
          obscureText: widget.ispass,
          controller: widget.controllerKind,
          keyboardType: widget.type,
          decoration: InputDecoration(
            labelText: widget.text,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                color: AppColors.primaryLight,
              ),
            ),
            suffixIcon: IconButton(
                onPressed: widget.suffixFun, icon: Icon(widget.suffIcon)),
            fillColor: AppColors.surface,
            filled: true,
            labelStyle: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
