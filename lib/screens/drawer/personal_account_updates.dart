import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/general/main_button.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/drawer/personal_profile.dart';
import 'package:najme/utility.dart';
import 'package:najme/components/general/form_text_box.dart';

class PersonalAccountUpdates extends StatefulWidget {
  const PersonalAccountUpdates({Key? key}) : super(key: key);

  @override
  _PersonalAccountUpdatesState createState() => _PersonalAccountUpdatesState();
}

class _PersonalAccountUpdatesState extends State<PersonalAccountUpdates>  with SingleTickerProviderStateMixin{

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();

  final oldController = TextEditingController();
  final newController = TextEditingController();
  final confpassController = TextEditingController();
  bool isoldPassword = true;
  bool isnewPassword = true;
  bool isConfPassword = true;


late AnimationController controller ;
  @override
  void initState(){
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
      );
      controller.addStatusListener((status) async {
        if (status == AnimationStatus.completed)
        {
          Navigator.pop(context);
          controller.reset();
          Navigator.push(
            context,
            InOutPageRoute(const PersonalProfile(), Alignment.bottomCenter),
          );
        }
      });
}
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: formkey,
          child: MainContainer(
            child: Padding(
              padding: EdgeInsets.only(top: adjustHeightValue(context, 110.0)),
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text(
                          'البريد الالكتروني:',
                          style: TextStyle(
                            fontSize: adjustValue(context, 20.0),
                            fontFamily: 'Cairo',
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        FormTextBox(
                          context: context,
                          text: "البريد الإلكتروني",
                          controllerKind: emailController,
                          type: TextInputType.emailAddress,
                          valid: (value) {
                            if (!validateEmail(value)) {
                              return "من فضلك ادخل بريد إلكتروني صحيح!";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: adjustHeightValue(context, 15),
                        ),
                        Divider(
                          color: AppColors.secondaryLight,
                          thickness: adjustHeightValue(context, 1.2),
                        ),
                        Text(
                          'كلمة السر الحالية:',
                          style: TextStyle(
                            fontSize: adjustValue(context, 20.0),
                            fontFamily: 'Cairo',
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        FormTextBox(
                          context: context,
                          text: "كلمة السر الحالية",
                          controllerKind: oldController,
                          type: TextInputType.text,
                          suffIcon: isoldPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          ispass: isoldPassword,
                          suffixFun: () {
                            setState(() {
                              isoldPassword = !isoldPassword;
                            });
                          },
                          valid: (value){
                            if(value.isEmpty){
                              return "من فضلك ادخل كلمة السرالحالية";
                            }
                            if(value.length < 8) {
                              return "يجب أن يكون عدد الحروف على الاقل 8";
                            }
                            return null;
                          },
                        ),
                        Text(
                          'كلمة السر الجديدة:',
                          style: TextStyle(
                            fontSize: adjustValue(context, 20.0),
                            fontFamily: 'Cairo',
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        FormTextBox(
                          context: context,
                          text: " كلمة السر الجديدة",
                          controllerKind: newController,
                          type: TextInputType.text,
                          suffIcon: isnewPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          ispass: isnewPassword,
                          suffixFun: () {
                            setState(() {
                              isnewPassword = !isnewPassword;
                            });
                          },
                          valid: (value) {
                            if (value.isEmpty) {
                              return "من فضلك ادخل كلمة السرالجديدة";
                            }
                            if (value.length < 8) {
                              return "يجب أن يكون عدد الحروف على الاقل 8";
                            }
                            return null;
                          },
                        ),
                        Text(
                          ' تأكيد كلمة السر :',
                          style: TextStyle(
                            fontSize: adjustValue(context, 20.0),
                            fontFamily: 'Cairo',
                            color: Colors.black,
                            fontWeight: FontWeight.w900,

                          ),
                        ),
                        FormTextBox(
                          context: context,
                          text:
                          ' تأكيد كلمة السر ',
                          controllerKind: confpassController,
                          type: TextInputType.text,
                          suffIcon: isConfPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          ispass: isConfPassword,
                          suffixFun: () {
                            setState(() {
                              isConfPassword = !isConfPassword;
                            });
                          },
                          valid: (value){
                            if(value.isEmpty){
                              return "من فضلك ادخل تأكيد كلمة السرالجديدة";
                            }
                            if(newController.text != confpassController.text) {
                              return "لا تتطابق مع كلمة السرالجديدة";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: adjustHeightValue(context, 15),
                        ),
                        Container(
                          width: double.infinity,
                          height: adjustHeightValue(context, 50.0),
                          child: MainButton(
                            context: context,
                            text: 'حفظ التعديلات',
                            color: AppColors.primary,
                            onTap: () {
                              if(formkey.currentState!.validate()){
                                showDoneDialog() ;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )
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
                    'تعديل الحساب الشخصي',
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
                    // false
                );
              },
            ),
          ],
        )
      ],
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
              controller: controller, 
              onLoaded: (composition){
              controller.forward();
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
