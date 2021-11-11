import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';

class FormTextBox extends StatefulWidget {
  FormTextBox(Key? key, this.name, this.length, this.controllerKind, this.type)
      : super(key: key);

  String name;
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
        labelText: widget.name,
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
