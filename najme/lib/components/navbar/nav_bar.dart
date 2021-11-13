import 'package:flutter/material.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';


class NavBar extends StatefulWidget {
  NavBar({
    Key? key
  }): super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              size: 40,
            )),
            actions: [
            Container(
              alignment: AlignmentDirectional.center,
              child: const Text(
                'نجمي',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              child: const Image(
                image: AssetImage(Assets.logo),
              ),
            ),
          ],
    );
  }
}