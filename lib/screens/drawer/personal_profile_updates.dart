import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/general/main_button.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/data.dart';
import 'package:najme/screens/drawer/personal_profile.dart';
import 'package:najme/utility.dart';

class PersonalProfileUpdates extends StatefulWidget {
  const PersonalProfileUpdates({Key? key}) : super(key: key);

  @override
  _PersonalProfileUpdatesState createState() => _PersonalProfileUpdatesState();
}
enum GenderEnum { male, female }

class _PersonalProfileUpdatesState extends State<PersonalProfileUpdates> with SingleTickerProviderStateMixin{

  int _dayCurrentItemSelected = profile.birthdate.day;
  int _monthCurrentItemSelected = profile.birthdate.month - 1;
  int _yearCurrentItemSelected = profile.birthdate.year;
  String _levelCurrentItemSelected = profile.level;
  String _countryCurrentItemSelected = profile.city;
  String _futureCurrentItemSelected = profile.ambition;
  TextEditingController nameController = TextEditingController(text: profile.name);
  GenderEnum? _gender = GenderEnum.male;
  List<String> levelsList = [];

  late AnimationController animationController;

  @override
  void initState() { 
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
      );
      animationController.addStatusListener((status) async {
        if (status == AnimationStatus.completed)
        {
          Navigator.pop(context);
          animationController.reset();
          Navigator.push(
            context,
            InOutPageRoute(const PersonalProfile(), Alignment.bottomCenter),
          );
        }
      });
}
  
  @override
  void dispose(){
    animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: database.getLevels(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        levelsList = snapshot.data!; 
        return snapshot.hasData
        ? Stack(
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: ListTile(
                                          contentPadding: EdgeInsets.only(left: adjustValue(context, 18.0)),
                                          title: Text(
                                            'ولد',
                                            style: TextStyle(
                                              fontSize: adjustWidthValue(context, 20.0),
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primaryDark,
                                            ),
                                          ),
                                          leading: Transform.scale(
                                            scale: 1.2,
                                            child: Radio<GenderEnum>(
                                              activeColor: AppColors.secondary,
                                              value: GenderEnum.male,
                                              groupValue: _gender,
                                              onChanged: (GenderEnum? value) {
                                                setState(() {
                                                  _gender = value;
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
                                              fontSize: adjustValue(context, 20.0),
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primaryDark,
                                            ),
                                          ),
                                          leading: Transform.scale(
                                            scale: 1.2,
                                            child: Radio<GenderEnum>(
                                              activeColor: AppColors.secondary,
                                              value: GenderEnum.female,
                                              groupValue: _gender,
                                              onChanged: (GenderEnum? value) {
                                                setState(() {
                                                  _gender = value;
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
                            SizedBox(height: adjustHeightValue(context, 20),),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'الاسم:',
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
                                      controller: nameController,
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
                                        labelText: 'الاسم',
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
                            SizedBox(height: adjustHeightValue(context, 15),),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'تاريخ الميلاد:',
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
                                        Container(
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
                                                    return daysList.map((num) => PopupMenuItem(
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
                                                      _dayCurrentItemSelected = v;
                                                    });
                                                  },),
                                              ),
                                            )),
                                        Container(
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
                                                    return monthsList.map((str) => PopupMenuItem(
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
                                                          monthsList[_monthCurrentItemSelected],
                                                          style: TextStyle(
                                                            fontSize: adjustValue(context, 16.0),
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
                                                      _monthCurrentItemSelected = monthsList.indexOf(v);
                                                    });
                                                  },),
                                              ),
                                            )),
                                        Container(
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
                                                    return yearsList.map((num) => PopupMenuItem(
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
                                                            fontSize: adjustValue(context, 16.0),
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
                                                      _yearCurrentItemSelected = v;
                                                    });
                                                  },),
                                              ),
                                            )),
                                      ],
                                    ),
                                  )
                                ]
                            ),
                            SizedBox(height: adjustHeightValue(context, 20),),
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
                                            return levelsList.map((str) => PopupMenuItem(
                                              value: str,
                                              child: Center(
                                                child: Text(
                                                    str,
                                                    style: TextStyle(
                                                      fontSize: adjustValue(context, 16.0),
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
                            SizedBox(height: adjustHeightValue(context, 20),),
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
                                            return countriesList.map((str) => PopupMenuItem(
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
                            SizedBox(height: adjustHeightValue(context, 20),),
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
                                              _futureCurrentItemSelected = v;
                                            });
                                          },),
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(height: adjustHeightValue(context, 40),),
                            Container(
                              width: double.infinity,
                              height: adjustHeightValue(context, 50.0),
                              child: MainButton(
                                context: context,
                                text: 'حفظ التعديلات',
                                color: AppColors.primary,
                                onTap: () async {
                                  profile.birthdate = DateTime.utc(
                                    _yearCurrentItemSelected,
                                    _monthCurrentItemSelected + 1,
                                    _dayCurrentItemSelected,
                                  );
                                  profile.ambition = _futureCurrentItemSelected;
                                  profile.city = _countryCurrentItemSelected;
                                  profile.gender = gendersList[_gender!.index];
                                  profile.level = _levelCurrentItemSelected;
                                  profile.name = nameController.text;

                                  // TODO: Call API Here.
                                  await database.updateProfile(profile);
                                  showDoneDialog();
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
                          fontSize: adjustWidthValue(context, 30.0),
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
        )
        : Center(child: CircularProgressIndicator(),);
      }
    );
  }
  
  void showDoneDialog() => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) =>Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/lottie/Done.json',
              repeat: false,     
              controller: animationController, 
              onLoaded: (composition){
              animationController.forward();
              },                   
              ),
              Text(
                'تم بنجاح ',
                style: TextStyle(fontSize: 24),

              ),
              const SizedBox(height: 16),

          ],
        ),
      ) ,
      
    );
}
