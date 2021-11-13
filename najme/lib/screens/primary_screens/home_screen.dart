import 'package:flutter/material.dart';
import 'package:najme/components/containers/home_container.dart';
import 'package:najme/components/containers/main_container.dart';
import 'package:najme/components/navbar/nav_bar.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int category = -1;
  @override
  Widget build(BuildContext context) {

    return mainContainer(

        appBar: /* NavBar(), */ AppBar(
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
        ),



        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
          child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
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
                const SizedBox(
                  height: 25,
                ),

                 Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                      child: Row(
                        children: [
                          HomeContainer(
                          whenTap: (){
                            setState(() {
                              category = 1;
                            });
                          },
                          image: Assets.math,
                          text: 'حساب',
                            color: category == 1?     AppColors.primary:  AppColors.surface,
                            textColor: category == 1?   AppColors.white :  AppColors.primary,
                          ),

                          const SizedBox(
                            width: 25.0,
                          ),
                          HomeContainer(
                              whenTap: (){
                                setState(() {
                                  category = 2;
                                });
                              },
                              image: Assets.arabic,
                              text: 'لغة عربية',
                              color: category == 2?     AppColors.primary:  AppColors.surface,
                              textColor: category == 2?   AppColors.white :  AppColors.primary,
                          )
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                     Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                      child: Row(
                        children: [
                          HomeContainer(
                              whenTap: (){
                                setState(() {
                                  category = 3;
                                });
                              },
                              image: Assets.ai,
                              text: 'ذكاء',
                              color: category == 3?     AppColors.primary:  AppColors.surface,
                              textColor: category == 3?   AppColors.white :  AppColors.primary,
                          ),
                          const SizedBox(
                            width: 25.0,
                          ),
                          HomeContainer(
                              whenTap: (){
                                setState(() {
                                  category = 4;
                                });
                              },
                              image: Assets.english,
                              text: 'English',
                              color: category == 4?     AppColors.primary:  AppColors.surface,
                              textColor: category == 4?   AppColors.white :  AppColors.primary,
                          )
                        ],
                      ),
                    ),
                  ],
               ),
            ),

         );

  }
}



// return Scaffold(
//   appBar: AppBar(
//     leading: IconButton(
//         onPressed: () {},
//         icon: const Icon(
//           Icons.menu,
//           size: 40,
//         )),
//     actions: [
//       Container(
//         alignment: AlignmentDirectional.center,
//         child: const Text(
//           'نجمي',
//           style: TextStyle(
//             fontSize: 30,
//             fontFamily: 'Cairo',
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//       Container(
//         alignment: AlignmentDirectional.center,
//         child: const Image(
//           image: AssetImage(Assets.logo),
//         ),
//       ),
//     ],
//   ),
//   body: BackgroundImage(
//     null,
//     Padding(
//       padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
//       child: Column(
//         children: [
//           const Padding(
//             padding: EdgeInsets.fromLTRB(0, 70, 0, 5),
//             child: Text(
//               '!مرحبا بك',
//               style: TextStyle(
//                 color: AppColors.primaryDark,
//                 fontSize: 36.0,
//                 fontFamily: 'Cairo',
//                 fontWeight: FontWeight.w800,
//               ),
//             ),
//           ),
//           Expanded(
//               child: Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
//             child: Row(
//               children: [
//                 HomeContainer(
//                     null, const AssetImage(Assets.math), 'حساب', 1),
//                 const SizedBox(
//                   width: 25.0,
//                 ),
//                 HomeContainer(
//                     null, const AssetImage(Assets.arabic), 'لغة عربية', 2)
//               ],
//             ),
//           )),
//           Expanded(
//               child: Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
//             child: Row(
//               children: [
//                 HomeContainer(null, const AssetImage(Assets.ai), 'ذكاء', 3),
//                 const SizedBox(
//                   width: 25.0,
//                 ),
//                 HomeContainer(
//                     null, const AssetImage(Assets.english), 'English', 4)
//               ],
//             ),
//           )),
//         ],
//       ),
//     ),
//   ),

// );
