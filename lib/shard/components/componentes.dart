import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kadojopapp/Model/shar.dart';
import 'package:kadojopapp/modules/join_project/join_project_screen.dart';
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
      style: const TextStyle(
        color: defaultColor,
      ),
      enabled: isClickable,
      onTap: () {
        ontap!();
      },
      obscureText: isPassword,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
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
          color: defaultColor,
        ),
        border: OutlineInputBorder(),
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

Widget defaultProjectCard() => Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        border: Border.all(width: 0.3),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(
                Icons.mic,
                size: 25,
                color: defaultColor,
              ),
              Text(
                'German Recording ',
                style: TextStyle(
                  fontSize: 20,
                  color: defaultColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    children: const [
                      Text(
                        'Less than 30 h/week',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Hourly',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: const [
                      Text(
                        '1 month',
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Duration', style: TextStyle(color: Colors.grey))
                    ],
                  )),
              Expanded(
                flex: 2,
                child: Column(
                  children: const [
                    Text('Intermediate', style: TextStyle(fontSize: 13)),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Experience Level',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Online German Recording  Task for Native Borne German (not immigrant) of German,Europe only.',
            style: TextStyle(
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              defaultButton(
                  function: () {},
                  text: Text('See More'),
                  width: 100,
                  height: 30,
                  colors: defaultColor),
              const Spacer(),
              const Icon(Icons.schedule, size: 15, color: Colors.grey),
              const SizedBox(
                width: 2,
              ),
              const Text(
                '11/4/2022',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ],
      ),
    );

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
          validator(s);
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
      height: btnheight,
      width: btnWidth,
      child: MaterialButton(
        color: TextColors,
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

Widget newProjectHorizontalCard(BuildContext context, newProject) => Padding(
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
                    '${newProject.projectModel!.name } ',
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
              subtitle:  Text(
                '${newProject.projectModel!.detail==null ? CircularProgressIndicator() :newProject.projectModel!.detail} ',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis),
                maxLines: 2,
              ),

              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text('new',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start),
                ],
              ),
              //  horizontalTitleGap: 10,
            ),
          ),
        ],
      ),
    );
