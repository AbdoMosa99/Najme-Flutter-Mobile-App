import 'package:flutter/material.dart';
import 'package:najme/components/buttons/gender_button.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  int is_male = -1;

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
                    GenderButton(
                      whenTap: (){
                        setState(() {
                          is_male = 1;
                        });
                      },
                      image: Assets.male,
                      color: is_male == 1 ? AppColors.primary : AppColors.surface,
                    ),

                    SizedBox(width: 20.0),
                    GenderButton(
                      whenTap: (){
                        setState(() {
                          is_male = 0;
                        });
                      },
                      image: Assets.female,
                      color: is_male == 0 ? AppColors.primary : AppColors.surface,
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
