import 'package:flutter/material.dart';

class rightEndButton extends StatefulWidget {
  const rightEndButton({Key? key}) : super(key: key);

  @override
  _rightEndButtonState createState() => _rightEndButtonState();
}

class _rightEndButtonState extends State<rightEndButton> {
  @override
  Widget build(BuildContext context) {
    return Container(

      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Color(0XFF311B92),

        child: Icon(
          Icons.arrow_forward_sharp,

        ),

      ),
    );
  }
}
