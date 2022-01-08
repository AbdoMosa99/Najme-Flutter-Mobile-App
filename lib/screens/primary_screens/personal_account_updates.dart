import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/primary_screens/personal_profile.dart';
import '../../utility.dart';
import 'package:najme/components/general/form_text_box.dart';

class PersonalAccountUpdates extends StatefulWidget {
  const PersonalAccountUpdates({Key? key}) : super(key: key);

  @override
  _PersonalAccountUpdatesState createState() => _PersonalAccountUpdatesState();
}
enum SingingCharacter { lafayette, jefferson }
class _PersonalAccountUpdatesState extends State<PersonalAccountUpdates> {

  var emailController = TextEditingController();
  bool isPassword = true;
  bool isConfPassword = true;
  bool isOldfPassword = true;     
  final oldPassController = TextEditingController();
  final passController = TextEditingController();
  final confpassController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }


  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MainContainer(
          child: Padding(
            padding: EdgeInsets.only(top: adjustHeightValue(context, 130.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                  Expanded(
                        flex:1,
                        child: Text(
                            'البريد الالكتروني:',
                          style: TextStyle(
                            fontSize: adjustValue(context, 20.0),
                            fontFamily: 'Cairo',
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                  
                  Expanded(
                  flex:1,
                  child: Row(
                    children :[            
                      Expanded(child:FormTextBox(
                      context: context,
                      text: "الايميل",
                      controllerKind: emailController,
                      type: TextInputType.emailAddress,
                    ), 
                    )
                    ] 
                  ),
                ),

                  Expanded(
                  flex:1,
                  child: Row(
                    children :[
                      Expanded(child: Divider
                      (
                        color: AppColors.secondaryLight,
                        thickness: 1.0,
                      )
                      )
                    ] 
                  ),
                ),
                  
                  Expanded(
                  flex:1,
                      child: Text(
                        'كلمة السر الحالية:',
                        style: TextStyle(
                          fontSize: adjustValue(context, 20.0),
                          fontFamily: 'Cairo',
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  
                  Expanded(
                      flex: 1,
                      child:  FormTextBox(
                    context: context,
                    text: "كلمة السر القديمة",
                    controllerKind: oldPassController,
                    type: TextInputType.text,
                    suffIcon: isPassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    ispass: isOldfPassword,
                    suffixFun: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    valid: (value){
                      if(value.isEmpty){
                        return "من فضلك ادخل كلمة السر";
                      }
                      if(value.length < 8) {
                        return "يجب أن يكون عدد الحروف على الاقل 8";
                      }
                      return null;
                    },
                  ),
                    ),

                  Expanded(
                      child: Text(
                        'كلمة السر الجديده:',
                        style: TextStyle(
                          fontSize: adjustValue(context, 20.0),
                          fontFamily: 'Cairo',
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  
                  Expanded(
                      flex: 1,
                      child: FormTextBox(
                  context: context,
                  text: " كلمة السر الجديدة",
                  controllerKind: passController,
                  type: TextInputType.text,
                  suffIcon: isPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  ispass: isConfPassword,
                  suffixFun: () {
                    setState(() {
                      isConfPassword = !isConfPassword;
                    });
                  },
                  valid: (value) {
                    if (value.isEmpty) {
                      return "من فضلك ادخل تأكيد كلمة السر";
                    }
                    if (passController.text != confpassController.text) {
                      return "لا تتطابق مع كلمة السر";
                    }
                    return null;
                  },
                ),
                    ),
                
                  Expanded(
                      child: Text(
                        ' تاكيد كلمة السر :',
                        style: TextStyle(
                          fontSize: adjustValue(context, 20.0),
                          fontFamily: 'Cairo',
                          color: Colors.black,
                          fontWeight: FontWeight.w900,

                        ),
                      ),
                    ),
                  
                  Expanded(
                      flex: 1,
                      child: FormTextBox(
                    context: context,
                    text:
                        ' تاكيد كلمة السر ',                       
                    controllerKind: confpassController,
                    type: TextInputType.text,                    
                    suffIcon: isPassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    ispass: isPassword,
                    suffixFun: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    valid: (value){
                      if(value.isEmpty){
                        return "من فضلك ادخل كلمة السر";
                      }
                      if(value.length < 8) {
                        return "يجب أن يكون عدد الحروف على الاقل 8";
                      }
                      return null;
                    },
                  ),
                    ),
          
                  Padding(
                padding: const EdgeInsets.all(20.0),
                child: Expanded(
                  flex: 1,
                  child: SizedBox(
                      height: adjustHeightValue(context, 45),
                      child: MaterialButton(
                        color: AppColors.primary,
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(adjustValue(context, 15.0)),
                        ),
                        child: Text(
                          'حفظ التعديلات',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            color: AppColors.surface,
                            fontSize: adjustValue(context, 25.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            InOutPageRoute(const PersonalProfile(), Alignment.bottomCenter),
                          );
                
                        },
                      ),
                    ),
                ),
              ),
              ],
            ),
          ),
        ),
                  Expanded(
          flex: 1,
          child: Stack(
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
                      'تعديل الحساب',
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
                            color: AppColors.primaryLight.withOpacity(adjustValue(context, 0.2)),
                            spreadRadius: adjustValue(context, 3),
                            blurRadius: adjustValue(context, 4),
                            offset: Offset(adjustValue(context, 0), adjustValue(context, 4)), // changes position of shadow
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
                  Navigator.push(
                    context,
                    InOutPageRoute(const PersonalProfile(), Alignment.topRight),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
