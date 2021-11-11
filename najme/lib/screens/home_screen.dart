import 'package:flutter/material.dart';
import 'package:najme/components/background_image.dart';
import 'package:najme/components/home_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: BackgroundImage(
        null,
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 70, 0, 5),
                child: Text(
                  '!مرحبا بك',
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 36.0,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                child: Row(
                  children: [
                    HomeContainer(
                        null, const AssetImage(Assets.math), 'حساب', 1),
                    const SizedBox(
                      width: 25.0,
                    ),
                    HomeContainer(
                        null, const AssetImage(Assets.arabic), 'لغة عربية', 2)
                  ],
                ),
              )),
              Expanded(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                child: Row(
                  children: [
                    HomeContainer(null, const AssetImage(Assets.ai), 'ذكاء', 3),
                    const SizedBox(
                      width: 25.0,
                    ),
                    HomeContainer(
                        null, const AssetImage(Assets.english), 'English', 4)
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
      // body: Container(
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage(Assets.screenBackground),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   child: Padding(
      //     padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
      //     child: Column(
      //       children: [
      //         const Padding(
      //           padding: EdgeInsets.fromLTRB(0, 70, 0, 5),
      //           child: Text(
      //             '!مرحبا بك',
      //             style: TextStyle(
      //               color: AppColors.primaryDark,
      //               fontSize: 36.0,
      //               fontFamily: 'Cairo',
      //               fontWeight: FontWeight.w800,
      //             ),
      //           ),
      //         ),
      //         Expanded(
      //             child: Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 0.0),
      //               child: Row(
      //           children: [
      //               HomeContainer(null, const AssetImage(Assets.math), 'حساب',1),
      //               const SizedBox(
      //                 width: 25.0,
      //               ),
      //               HomeContainer(null, const AssetImage(Assets.arabic), 'لغة عربية',2)
      //           ],
      //         ),
      //             )),
      //         Expanded(
      //             child: Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
      //               child: Row(
      //           children: [
      //               HomeContainer(null, const AssetImage(Assets.ai), 'ذكاء',3),
      //               const SizedBox(
      //                 width: 25.0,
      //               ),
      //               HomeContainer(null, const AssetImage(Assets.english), 'English',4)
      //           ],
      //         ),
      //             )),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
