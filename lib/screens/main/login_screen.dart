import 'package:flutter/material.dart';
import 'package:najme/_api/api.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/general/form_text_box.dart';
import 'package:najme/components/general/main_button.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/database/models.dart';
import 'package:najme/screens/forget_password/forget_password.dart';
import 'package:najme/screens/registeration/registeration_email.dart';
import '../../components/general/show_loader_dialog.dart';
import '../../data.dart';
import '../../CA/features/home/view/home_view.dart';
import 'package:najme/utility.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var nameController = TextEditingController();
  var passController = TextEditingController();
  bool isPassword = true;
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> LoginData = {
    "loginName": null,
    "loginPass": null,
  };
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: MainContainer(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    Assets.logoName,
                    width: adjustWidthValue(context, 182.17),
                    height: adjustHeightValue(context, 99.68),
                  ),
                  SizedBox(
                    height: adjustHeightValue(context, 15.0),
                  ),
                  Image.asset(
                    Assets.rocket,
                    width: adjustWidthValue(context, 220),
                    height: adjustHeightValue(context, 220),
                  ),
                  SizedBox(
                    height: adjustHeightValue(context, 10.0),
                  ),
                  FormTextBox(
                    context: context,
                    text: "الإيميل",
                    controllerKind: nameController,
                    type: TextInputType.name,
                      valid: (value) {
                        if (value == "") {
                          return "يجب أن تدخل البريد الإلكتروني!";
                        }
                        if (!validateEmail(value)) {
                          return "من فضلك أدخل بريد إلكتروني صحيح!";
                        }
                        return null;
                      }
                  ),
                  SizedBox(
                    height: adjustHeightValue(context, 10.0),
                  ),
                  FormTextBox(
                    context: context,
                    text: "كلمة السر",
                    controllerKind: passController,
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
                  SizedBox(
                    height: adjustHeightValue(context, 25.0),
                  ),
                  Container(
                    width: double.infinity,
                    height: adjustHeightValue(context, 50.0),
                    child: MainButton(
                      context: context,
                      text: 'دخول',
                      color: AppColors.primary,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) try {
                          showLoaderDialog(context);
                          await loginAndSetup(nameController.text, passController.text);
                          Navigator.pop(context);
    
                          Navigator.pushReplacement(
                            context,
                            InOutPageRoute(const HomeView(), Alignment.bottomCenter),
                          );
                        }
                        catch(e){
                          Navigator.pop(context);
                          print(e);
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            InOutPageRoute(
                              RegisterationEmail(),
                              Alignment.bottomRight,
                            )
                          );
                        },
                        child: Text(
                          'تسجيل',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: adjustValue(context, 20.0),
                            color: AppColors.primaryDark,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
    
                      TextButton(
                        onPressed: () {
                            Navigator.push(
                              context,
                              InOutPageRoute(ForgetPassword(), Alignment.bottomCenter),
                            );
                          },
                        child: Text(
                          'نسيت كلمة السر؟',
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: adjustValue(context, 20.0),
                            color: AppColors.primaryDark,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


Future<void> loginAndSetup(String email, String password) async {
  String token = await login_api(email, password);
  prefs.setString('token', token);

  prefs.setString("email", email);

  List<Profile> profiles = await get_profiles_api(token);
  profiles.forEach((profile) async {
    await database.insertProfile(profile);
  });

  int profileID = profiles[0].id;
  await prefs.setInt("profile_id", profileID);


  List<Progress> progress = await progress_api(token, profileID);
  for (int i = 0; i < progress.length; i++) {
    await database.insertProgress(progress[i]);
  }

  List<Subject> subjects = await subjects_api(token, profileID);
  subjects.forEach((subject) async {
    await database.insertSubject(subject);

    List<Unit> units = await units_api(token, subject.id);
    units.forEach((unit) async {
      await database.insertUnit(unit);

      List<Lesson> lessons = await lessons_api(token, unit.id);
      lessons.forEach((lesson) {
        database.insertLesson(lesson);
      });
    });
  });

  await prefs.setBool('isLoggedIn', true);

  await init();
}
