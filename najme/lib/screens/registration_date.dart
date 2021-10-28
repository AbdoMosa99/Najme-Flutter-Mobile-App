import 'package:flutter/material.dart';
import 'package:najme/components/birth_date_button.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';

class RegistrationBirthDateScreen extends StatelessWidget {
  const RegistrationBirthDateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegistrationBirthDate(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RegistrationBirthDate extends StatefulWidget {
  const RegistrationBirthDate({Key? key}) : super(key: key);

  @override
  _RegistrationBirthDateState createState() => _RegistrationBirthDateState();
}

class _RegistrationBirthDateState extends State<RegistrationBirthDate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.screenBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BirthDateButton(null, 144.0, 89.0, "اليوم"),
              BirthDateButton(null, 169.0, 105.0, "الشهر"),
              BirthDateButton(null, 192.0, 119.0, "السنة"),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "اختر تاريخ ميلادك!",
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontSize: 64.0,
                  fontFamily: 'Cairo',
                ),
              ),
            ],
          ),
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
