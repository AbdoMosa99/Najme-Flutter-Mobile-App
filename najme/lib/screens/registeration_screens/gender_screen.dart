import 'package:flutter/material.dart';
import 'package:najme/components/gender_button.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';

class GenderScreen extends StatefulWidget {
  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  int active1 = 0;
  int active2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage('assets/images/background.png'),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 200.0,
              margin: const EdgeInsets.only(top: 150.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          active1 = 1;
                          active2 = 0;
                        });
                      },
                      child: GenderButton(null, 1, active1),
                    ),
                    SizedBox(width: 20.0),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          active1 = 0;
                          active2 = 1;
                        });
                      },
                      child: GenderButton(null, 0, active2),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: const Text(
                  "اختر نوعك!",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 64.0,
                    fontFamily: 'Cairo',
                  ),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.arrow_forward_sharp),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
