import 'package:flutter/material.dart';

class mainImage extends StatefulWidget {
  mainImage({
    Key? key,
    required this.image,
    this.height = 116,
    this.width = 116
  }) : super(key: key);

  String image;
  final double width;
  final double height;

  @override
  _mainImageState createState() => _mainImageState();
}
class _mainImageState extends State<mainImage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image(
        image: AssetImage(widget.image),
        height: widget.height,
        width: widget.width,
      ),
    );
  }
}
