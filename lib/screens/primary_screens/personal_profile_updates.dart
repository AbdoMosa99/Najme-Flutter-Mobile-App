import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/general/main_button.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/primary_screens/personal_profile.dart';
import '../../utility.dart';

class PersonalProfileUpdates extends StatefulWidget {
  const PersonalProfileUpdates({Key? key}) : super(key: key);

  @override
  _PersonalProfileUpdatesState createState() => _PersonalProfileUpdatesState();
}
enum SingingCharacter { lafayette, jefferson }
class _PersonalProfileUpdatesState extends State<PersonalProfileUpdates> {

  final List<int> dayList = [1, 2, 3, 4, 5, 6, 7,
            8, 9, 10, 11, 12, 13, 14, 15, 16,
            17, 18, 19, 20, 21, 22, 23, 24, 25,
            26, 27, 28, 29, 30, 31];
  final List<String> monthList = ["يناير", "فبراير", "مارس", "إبريل",
                            "مايو", "يونيو", "يوليو", "أغسطس", "سبتمبر",
                            "أكتوبر", "نوفمبر", "ديسمبر",];
  final List<int> yearList = [2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017];
  final List<String> levelList = ['KG1', 'KG2'];
  final List<String> countryList = ["القاهرة",
    "الجيزة", "الشرقية", "الدقهلية", "البحيرة",
    "المنيا", "القليوبية", "الإسكندرية", "الغربية",
    "سوهاج", "أسيوط", "المنوفية", "كفر الشيخ", "الفيوم", "قنا",
    "بني سويف", "أسوان", "دمياط",
    "الإسماعيلية", "الأقصر", "بور سعيد", "السويس",
    "مطروح", "شمال سيناء", "البحر الاحمر", "الوادي الجديد", "جنوب سيناء",
  ];
  final List<String> futureList = ['مهندس','عالم','مبرمج','ظابط','مدرس','طبيب'];

  int _dayCurrentItemSelected = 1;
  String _monthCurrentItemSelected = '';
  int _yearCurrentItemSelected = 1;
  String _levelCurrentItemSelected = '';
  String _countryCurrentItemSelected = '';
  String _futureCurrentItemSelected = '';

  @override
  void initState() {
    super.initState();
    _dayCurrentItemSelected = dayList[0];
    _monthCurrentItemSelected = monthList[0];
    _yearCurrentItemSelected = yearList[0];
    _levelCurrentItemSelected = levelList[0];
    _countryCurrentItemSelected = countryList[0];
    _futureCurrentItemSelected = futureList[0];
  }


  var nameController = TextEditingController();
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MainContainer(
          child: Padding(
            padding: EdgeInsets.only(top: adjustHeightValue(context, 110.0)),
            child: Center(
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children:[
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'النوع:',
                                style: TextStyle(
                                  fontSize: adjustValue(context, 20.0),
                                  fontFamily: 'Cairo',
                                  color: AppColors.primaryDark,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.only(left: adjustValue(context, 18.0)),
                                      title: Text(
                                        'ولد',
                                        style: TextStyle(
                                          fontSize: adjustValue(context, 22.0),
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryDark,
                                        ),
                                      ),
                                      leading: Transform.scale(
                                        scale: 1.2,
                                        child: Radio<SingingCharacter>(
                                          activeColor: AppColors.secondary,
                                          value: SingingCharacter.lafayette,
                                          groupValue: _character,
                                          onChanged: (SingingCharacter? value) {
                                            setState(() {
                                              _character = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.only(left: adjustValue(context, 15.0)),
                                      title: Text(
                                        'بنت',
                                        style: TextStyle(
                                          fontSize: adjustValue(context, 22.0),
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryDark,
                                        ),
                                      ),
                                      leading: Transform.scale(
                                        scale: 1.2,
                                        child: Radio<SingingCharacter>(
                                          activeColor: AppColors.secondary,
                                          value: SingingCharacter.jefferson,
                                          groupValue: _character,
                                          onChanged: (SingingCharacter? value) {
                                            setState(() {
                                              _character = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: adjustHeightValue(context, 25),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'الأسم:',
                                style: TextStyle(
                                  fontSize: adjustValue(context, 20.0),
                                  fontFamily: 'Cairo',
                                  color: AppColors.primaryDark,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                child: TextFormField(
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: adjustValue(context, 17.0),
                                    color: AppColors.primaryDark,
                                  ),
                                  cursorColor: AppColors.primary,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                        color: AppColors.secondaryLight,
                                        width: adjustValue(context, 2),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                        color: AppColors.primaryLight,
                                      ),
                                    ),
                                    labelText: 'الأسم',
                                    contentPadding: EdgeInsets.symmetric(vertical: adjustHeightValue(context, 5.0), horizontal: adjustWidthValue(context, 15.0)),
                                    fillColor: AppColors.surface,
                                    filled: true,
                                    labelStyle: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: adjustValue(context, 15.0),
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: adjustHeightValue(context, 25),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  'تاريخ الميلاد',
                                  style: TextStyle(
                                    fontSize: adjustValue(context, 20.0),
                                    fontFamily: 'Cairo',
                                    color: AppColors.primaryDark,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: Expanded(
                                        child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(adjustValue(context, 10.0),)),
                                              color: AppColors.surface,
                                              border: Border.all(
                                                color: AppColors.primaryLight,
                                              ),
                                            ),
                                            child: Directionality(
                                              textDirection: TextDirection.ltr,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: adjustValue(context, 4),
                                                  top: adjustValue(context, 3),
                                                  bottom: adjustValue(context, 3) ,
                                                ),
                                                child: PopupMenuButton<int>(
                                                  shape: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(18),
                                                      borderSide: const BorderSide(
                                                          color: AppColors.secondaryLight,
                                                          width: 1
                                                      )
                                                  ),
                                                  color: AppColors.surface,
                                                  itemBuilder: (context) {
                                                    return dayList.map((num) => PopupMenuItem(
                                                      value: num,
                                                      child: Center(
                                                        child: Text(
                                                            '$num',
                                                            style: TextStyle(
                                                              fontSize: adjustValue(context, 20.0),
                                                              fontFamily: 'Cairo',
                                                              color: AppColors.primary,
                                                            )
                                                        ),
                                                      ),
                                                    )).toList();
                                                  },
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                          '$_dayCurrentItemSelected',
                                                          style: TextStyle(
                                                            fontSize: adjustValue(context, 18.0),
                                                            fontFamily: 'Cairo',
                                                            color: AppColors.primaryDark,
                                                          )),
                                                      Icon(Icons.arrow_drop_down_outlined,
                                                        size: adjustValue(context, 20),
                                                        color: AppColors.secondary,)
                                                    ],
                                                  ),
                                                  onSelected: (v) {
                                                    setState(() {
                                                      print('!!!===== $v');
                                                      _dayCurrentItemSelected = v;
                                                    });
                                                  },),
                                              ),
                                            )),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                      child: Expanded(
                                        child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(adjustValue(context, 10.0),)),
                                              color: AppColors.surface,
                                              border: Border.all(
                                                color: AppColors.primaryLight,
                                              ),
                                            ),
                                            child: Directionality(
                                              textDirection: TextDirection.ltr,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: adjustValue(context, 4),
                                                  top: adjustValue(context, 3),
                                                  bottom: adjustValue(context, 3) ,
                                                ),
                                                child: PopupMenuButton<String>(
                                                  shape: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(18),
                                                      borderSide: const BorderSide(
                                                          color: AppColors.secondaryLight,
                                                          width: 1
                                                      )
                                                  ),
                                                  color: AppColors.surface,
                                                  itemBuilder: (context) {
                                                    return monthList.map((str) => PopupMenuItem(
                                                      value: str,
                                                      child: Center(
                                                        child: Text(
                                                            str,
                                                            style: TextStyle(
                                                              fontSize: adjustValue(context, 20.0),
                                                              fontFamily: 'Cairo',
                                                              color: AppColors.primary,
                                                            )
                                                        ),
                                                      ),
                                                    )).toList();
                                                  },
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: <Widget>[
                                                      Text(
                                                          _monthCurrentItemSelected,
                                                          style: TextStyle(
                                                            fontSize: adjustValue(context, 18.0),
                                                            fontFamily: 'Cairo',
                                                            color: AppColors.primaryDark,
                                                          )
                                                      ),
                                                      Icon(Icons.arrow_drop_down_outlined,
                                                        size: adjustValue(context, 20),
                                                        color: AppColors.secondary,),
                                                    ],
                                                  ),
                                                  onSelected: (v) {
                                                    setState(() {
                                                      print('!!!===== $v');
                                                      _monthCurrentItemSelected = v;
                                                    });
                                                  },),
                                              ),
                                            )),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 0),
                                      child: Expanded(
                                        child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(adjustValue(context, 10.0),)),
                                              color: AppColors.surface,
                                              border: Border.all(
                                                color: AppColors.primaryLight,
                                              ),
                                            ),
                                            child: Directionality(
                                              textDirection: TextDirection.ltr,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: adjustValue(context, 4),
                                                  top: adjustValue(context, 3),
                                                  bottom: adjustValue(context, 3) ,
                                                ),
                                                child: PopupMenuButton<int>(
                                                  shape: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(18),
                                                      borderSide: const BorderSide(
                                                          color: AppColors.secondaryLight,
                                                          width: 1
                                                      )
                                                  ),
                                                  color: AppColors.surface,
                                                  itemBuilder: (context) {
                                                    return yearList.map((num) => PopupMenuItem(
                                                      value: num,
                                                      child: Center(
                                                        child: Text(
                                                            '$num',
                                                            style: TextStyle(
                                                              fontSize: adjustValue(context, 20.0),
                                                              fontFamily: 'Cairo',
                                                              color: AppColors.primary,
                                                            )),
                                                      ),
                                                    )).toList();
                                                  },
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: <Widget>[
                                                      Text(
                                                          '$_yearCurrentItemSelected',
                                                          style: TextStyle(
                                                            fontSize: adjustValue(context, 18.0),
                                                            fontFamily: 'Cairo',
                                                            color: AppColors.primaryDark,
                                                          )
                                                      ),
                                                      Icon(Icons.arrow_drop_down_outlined,
                                                        size: adjustValue(context, 20),
                                                        color: AppColors.secondary,),
                                                    ],
                                                  ),
                                                  onSelected: (v) {
                                                    setState(() {
                                                      print('!!!===== $v');
                                                      _yearCurrentItemSelected = v;
                                                    });
                                                  },),
                                              ),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]
                        ),
                        SizedBox(
                          height: adjustHeightValue(context, 25),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'المرحلة:',
                                style: TextStyle(
                                  fontSize: adjustValue(context, 20.0),
                                  fontFamily: 'Cairo',
                                  color: AppColors.primaryDark,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                  height: adjustHeightValue(context, 45),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(adjustValue(context, 15.0),)),
                                    color: AppColors.surface,
                                    border: Border.all(
                                      color: AppColors.primaryLight,
                                    ),
                                  ),
                                  child: Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: PopupMenuButton<String>(
                                      shape: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(18),
                                          borderSide: const BorderSide(
                                              color: AppColors.secondaryLight,
                                              width: 1
                                          )
                                      ),
                                      color: AppColors.surface,
                                      itemBuilder: (context) {
                                        return levelList.map((str) => PopupMenuItem(
                                          value: str,
                                          child: Center(
                                            child: Text(
                                                str,
                                                style: TextStyle(
                                                  fontSize: adjustValue(context, 18.0),
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.primary,
                                                )
                                            ),
                                          ),
                                        )).toList();
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 6,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                    _levelCurrentItemSelected,
                                                    style: TextStyle(
                                                      fontSize: adjustValue(context, 18.0),
                                                      fontFamily: 'Cairo',
                                                      color: AppColors.primaryDark,
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Icon(Icons.arrow_drop_down_outlined,
                                                  size: adjustValue(context, 30),
                                                  color: AppColors.secondary,),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      onSelected: (v) {
                                        setState(() {
                                          print('!!!===== $v');
                                          _levelCurrentItemSelected = v;
                                        });
                                      },),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: adjustHeightValue(context, 25),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'المحافظة:',
                                style: TextStyle(
                                  fontSize: adjustValue(context, 20.0),
                                  fontFamily: 'Cairo',
                                  color: AppColors.primaryDark,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                  height: adjustHeightValue(context, 45),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(adjustValue(context, 15.0),)),
                                    color: AppColors.surface,
                                    border: Border.all(
                                      color: AppColors.primaryLight,
                                    ),
                                  ),
                                  child: Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: PopupMenuButton<String>(
                                      shape: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(18),
                                          borderSide: const BorderSide(
                                              color: AppColors.secondaryLight,
                                              width: 1
                                          )
                                      ),
                                      color: AppColors.surface,
                                      itemBuilder: (context) {
                                        return countryList.map((str) => PopupMenuItem(
                                          value: str,
                                          child: Center(
                                            child: Text(
                                                str,
                                                style: TextStyle(
                                                  fontSize: adjustValue(context, 18.0),
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.primary,
                                                )
                                            ),
                                          ),
                                        )).toList();
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 6,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                    _countryCurrentItemSelected,
                                                    style: TextStyle(
                                                      fontSize: adjustValue(context, 18.0),
                                                      fontFamily: 'Cairo',
                                                      color: AppColors.primaryDark,
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Icon(Icons.arrow_drop_down_outlined,
                                                  size: adjustValue(context, 30),
                                                  color: AppColors.secondary,),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      onSelected: (v) {
                                        setState(() {
                                          print('!!!===== $v');
                                          _countryCurrentItemSelected = v;
                                        });
                                      },),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: adjustHeightValue(context, 25),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'الطموح:',
                                style: TextStyle(
                                  fontSize: adjustValue(context, 20.0),
                                  fontFamily: 'Cairo',
                                  color: AppColors.primaryDark,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                  height: adjustHeightValue(context, 45),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(adjustValue(context, 15.0),)),
                                    color: AppColors.surface,
                                    border: Border.all(
                                      color: AppColors.primaryLight,
                                    ),
                                  ),
                                  child: Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: PopupMenuButton<String>(
                                      shape: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(18),
                                          borderSide: const BorderSide(
                                              color: AppColors.secondaryLight,
                                              width: 1
                                          )
                                      ),
                                      color: AppColors.surface,
                                      itemBuilder: (context) {
                                        return futureList.map((str) => PopupMenuItem(
                                          value: str,
                                          child: Center(
                                            child: Text(
                                                str,
                                                style: TextStyle(
                                                  fontSize: adjustValue(context, 18.0),
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.primary,
                                                )
                                            ),
                                          ),
                                        )).toList();
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 6,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                    _futureCurrentItemSelected,
                                                    style: TextStyle(
                                                      fontSize: adjustValue(context, 18.0),
                                                      fontFamily: 'Cairo',
                                                      color: AppColors.primaryDark,
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Icon(Icons.arrow_drop_down_outlined,
                                                  size: adjustValue(context, 30),
                                                  color: AppColors.secondary,),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      onSelected: (v) {
                                        setState(() {
                                          print('!!!===== $v');
                                          _futureCurrentItemSelected = v;
                                        });
                                      },),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: adjustHeightValue(context, 35),
                        ),
                        Container(
                          width: double.infinity,
                          height: adjustHeightValue(context, 50.0),
                          child: MainButton(
                            context: context,
                            text: 'حفظ التعديلات',
                            color: AppColors.primary,
                            onTap: () {
                              Navigator.push(
                                context,
                                InOutPageRoute(const PersonalProfile(), Alignment.bottomCenter),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Stack(
          children: [
            Container(
                width: double.infinity,
                height: adjustHeightValue(context, 54),
                color: AppColors.primary,
            ),
            ClipOval(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                    'تعديل الملف الشخصي',
                    style: TextStyle(
                      fontSize: adjustValue(context, 30.0),
                      fontFamily: 'Cairo',
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      decoration: TextDecoration.none,
                    )
                ),
                color: AppColors.primary,
                width: double.infinity,
                height: adjustHeightValue(context, 110),
              ),
            ),
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.only(top:adjustValue(context, 110.0),
                    right: adjustValue(context, 15.0)),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryLight.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                      Assets.falsePic,
                      height: adjustValue(context, 20.0),
                    ),
                  ),
                ),
              ),
              onTap: (){
                Navigator.pop(
                    context,
                    false
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
