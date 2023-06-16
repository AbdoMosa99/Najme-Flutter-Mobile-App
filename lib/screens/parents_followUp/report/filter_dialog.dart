import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

FilterDialog1({
  required BuildContext context,
  required Widget popUp,
  required String titel,
  required String numberDialog,
  Function()? FABFunction,
  bool search = false,
}) {
  return showDialog(
    barrierColor: Colors.black45,
    context: context,
    builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: SimpleDialog(
            backgroundColor: AppColors.primaryLight,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: adjustValue(context, 20)),
                child: Text(
                  titel,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: adjustValue(context, 25),
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(20), child: popUp),
              Row(
                children: [
                  SizedBox(
                    width: adjustWidthValue(context, 80),
                    child: FloatingActionButton(
                      backgroundColor: AppColors.secondary,
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Icon(
                          search ? Icons.search_rounded : Icons.arrow_forward,
                          size: adjustValue(context, 30.0),
                          color: AppColors.white,
                        ),
                      ),
                      onPressed: FABFunction,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left: adjustValue(context, 20)),
                    child: Text(
                      numberDialog,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: adjustValue(context, 25),
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              )
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              adjustValue(context, 20),
            )),
          ),
        ),
      );
    },
  );
}

FilterDialog2({
  required BuildContext context,
  required Widget popUp,
  required String titel,
  required String numberDialog,
  Function()? FABFunction,
  bool search = false,
}) {
  return showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: SimpleDialog(
            backgroundColor: AppColors.primaryLight,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: adjustValue(context, 20)),
                child: Text(
                  titel,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: adjustValue(context, 25),
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(20), child: popUp),
              Row(
                children: [
                  SizedBox(
                    width: adjustWidthValue(context, 80),
                    child: FloatingActionButton(
                      backgroundColor: AppColors.secondary,
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Icon(
                          search ? Icons.search_rounded : Icons.arrow_forward,
                          size: adjustValue(context, 30.0),
                          color: AppColors.white,
                        ),
                      ),
                      onPressed: FABFunction,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left: adjustValue(context, 20)),
                    child: Text(
                      numberDialog,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: adjustValue(context, 25),
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              )
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              adjustValue(context, 20),
            )),
          ),
        ),
      );
    },
  );
}

FilterDialog3({
  required BuildContext context,
  required Widget popUp,
  required String titel,
  required String numberDialog,
  Function()? FABFunction,
  bool search = false,
}) {
  return showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: SimpleDialog(
            backgroundColor: AppColors.primaryLight,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: adjustValue(context, 20)),
                child: Text(
                  titel,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: adjustValue(context, 25),
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(20), child: popUp),
              Row(
                children: [
                  SizedBox(
                    width: adjustWidthValue(context, 80),
                    child: FloatingActionButton(
                      backgroundColor: AppColors.secondary,
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Icon(
                          search ? Icons.search_rounded : Icons.arrow_forward,
                          size: adjustValue(context, 30.0),
                          color: AppColors.white,
                        ),
                      ),
                      onPressed: FABFunction,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left: adjustValue(context, 20)),
                    child: Text(
                      numberDialog,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: adjustValue(context, 25),
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              )
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              adjustValue(context, 20),
            )),
          ),
        ),
      );
    },
  );
}

FilterDialog4({
  required BuildContext context,
  required Widget popUp,
  required String titel,
  required String numberDialog,
  Function()? FABFunction,
  bool search = false,
}) {
  return showDialog(
    barrierDismissible: true,
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: SimpleDialog(
            backgroundColor: AppColors.primaryLight,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: adjustValue(context, 20)),
                child: Text(
                  titel,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: adjustValue(context, 25),
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(20), child: popUp),
              Row(
                children: [
                  SizedBox(
                    width: adjustWidthValue(context, 80),
                    child: FloatingActionButton(
                      backgroundColor: AppColors.secondary,
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Icon(
                          search ? Icons.search_rounded : Icons.arrow_forward,
                          size: adjustValue(context, 30.0),
                          color: AppColors.white,
                        ),
                      ),
                      onPressed: FABFunction,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left: adjustValue(context, 20)),
                    child: Text(
                      numberDialog,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: adjustValue(context, 25),
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              )
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              adjustValue(context, 20),
            )),
          ),
        ),
      );
    },
  );
}
