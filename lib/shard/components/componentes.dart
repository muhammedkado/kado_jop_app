import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kadojopapp/modules/project/myprojectdetails.dart';
import 'package:kadojopapp/shard/styles/colors.dart';

NavigatorAndFinish({required context, required Widget}) =>
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => Widget), (route) => false);

Navigatorto({required context, required Widget}) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Widget),
    );

@override
Widget defaultFormField({
  required BuildContext context,
  required TextEditingController controller,
  required TextInputType keybord,
  required Function validate,
  required IconData prefix,
  String lable = 'Email Address',
  IconData? suffix,
  Function? onSubmit,
  Function? ontap,
  Function? suffixPressed,
  bool isPassword = false,
  bool isClickable = true,
}) =>
    TextFormField(
      style:  TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
      ),
      enabled: isClickable,
      onTap: () {
        ontap!();
      },
      obscureText: isPassword,
      controller: controller,
      keyboardType: keybord,
      validator: (value) {
        return validate(value);
      },
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey.shade500),
        filled: false,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        labelText: lable,
        prefixIcon: Icon(
          prefix,
          color:Theme.of(context).colorScheme.onSurface
        ),
        border:const OutlineInputBorder(),
      ),
    );

@override
Widget defaultButton({
  double width = double.infinity,
  double? height,
  required Color colors,
  required Text text,
  required Function function,
}) =>
    Container(
      height: height,
      width: width,
      color: colors,
      child: MaterialButton(
          // color: defaultColor,
          onPressed: () {
            function();
          },
          child: text),
    );

Widget defaultTextButton({
  required Function function,
  required Text lable,
}) =>
    TextButton(
      onPressed: () {
        function();
      },
      child: lable,
    );

void ShowTost({required String msg, required TostState state}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: ChooseTostColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum TostState { WARNING, SUCCESS, ERROR }

Color? ChooseTostColor(TostState state) {
  Color color;
  switch (state) {
    case TostState.ERROR:
      {
        color = Colors.red;
      }
      break;
    case TostState.WARNING:
      {
        color = Colors.amber;
      }
      break;
    case TostState.SUCCESS:
      {
        color = Colors.green;
      }
      break;
  }
  return color;
}

@override
Widget defoutformfield({
  bool obscureText = false,
  required TextEditingController controller,
  TextInputType? keybord,
  required String lebel,
  required Function validator,
  Function? onChanged,
  Icon? icon,
  int? maxLength,
}) =>
    TextFormField(
        controller: controller,
        maxLength: maxLength,
        validator: (s) {
          return validator(s);
        },
        keyboardType: keybord,
        textAlignVertical: TextAlignVertical.top,
        obscureText: obscureText,
        decoration: InputDecoration(
            filled: true,
            labelText: lebel,
            alignLabelWithHint: true,
            prefixIcon: icon,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))));

@override
Widget defoultButtun({
  required String text,
  required Function function,
  RoundedRectangleBorder? shape,
}) =>
    SizedBox(
      height: 45,
      width: 200,
      child: MaterialButton(
        color: defaultColor,
        onPressed: () {
          function();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(
          text.toUpperCase(),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
/*
Widget newProjectHorizontalCard(
        BuildContext context, NewProjectCubit cubit) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          Container(
            width: double.infinity,
            height: 90,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 1.2,
                  spreadRadius: 0.5,
                )
              ],
            ),
            child: ListTile(
              onTap: () {
                Navigatorto(
                    context: context, Widget: const JoinProjectScreen());
              },

              contentPadding: const EdgeInsets.all(10),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${cubit.project[i]} ',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 5,
                  )
                ],
              ),
              subtitle: Text(
                '${cubit.projectModel!.detail}',
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis),
                maxLines: 2,
              ),

              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(NewProjectCubit.formattedDate(cubit.projectModel!.timeStamp),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start),
                ],
              ),
              //  horizontalTitleGap: 10,
            ),
          ),
        ],
      ),
    );*/

Widget myProjectCard(
  BuildContext context,
) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          Container(
            width: double.infinity,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 1.2,
                  spreadRadius: 0.5,
                )
              ],
            ),
            child: ListTile(
              onTap: () {
                Navigatorto(context: context, Widget: const MyProjectDetails());
              },

              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'newProject.name',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              ),
              subtitle: const Text(
                'newProject.detail ?? const CircularPro gressI ndicator()sd asd asd asd asd  asdas dasdasd  asd asd asdasd asd asd  Circu larProgre ssIndicator} ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 3,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    width: 50,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: defaultColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 1.2,
                          spreadRadius: 0.5,
                        )
                      ],
                    ),
                    child: Center(
                        child: Text(
                      '50\$',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  Spacer(),
                  const Text(
                    '02/12/2023',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              //  horizontalTitleGap: 10,
            ),
          ),
        ],
      ),
    );
