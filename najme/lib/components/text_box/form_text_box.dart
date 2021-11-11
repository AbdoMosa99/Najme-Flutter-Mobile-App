import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';

class FormTextBox extends StatefulWidget {
  FormTextBox({
    Key? key,
    this.text = 'Null',
    this.length = 20,
    required this.controllerKind,
    this.type = TextInputType.name
  })
      : super(key: key);

  final String text;
  final int length;
  final TextEditingController controllerKind;
  final TextInputType type;
  // Icon icon;
  @override
  _FormTextBoxState createState() => _FormTextBoxState();
}

class _FormTextBoxState extends State<FormTextBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //textDirection: TextDirection.ltr,
      maxLength: widget.length,
      controller: widget.controllerKind,
      keyboardType: widget.type,
      onFieldSubmitted: (value) {
        print(value);
      },
      onChanged: (value) {
        print(value);
      },
      decoration: InputDecoration(
        labelText: widget.text,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: AppColors.primaryLight,
            )),
        //suffixIcon: widget.icon,
        fillColor: const Color(0xFFDED5EF),
        filled: true,
        labelStyle: const TextStyle(
          fontFamily: 'Cairo',
          fontSize: 20.0,
        ),
      ),
    );
  }
}
