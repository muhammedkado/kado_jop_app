import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  String lable = 'Email Addrees',
  IconData? suffix,
  Function? onSubmit,
  Function? suffixPressed,
  bool isPassword = false,
}) =>
    TextFormField(
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
        filled: true,
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
        ),
        border: OutlineInputBorder(),
      ),
    );

@override
Widget defaultButton({
  double width = double.infinity,
  double? height,
  required Color colors,
  required String text,
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
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
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
                text: 'See More',
                width: 100,
                height: 30,
                colors: defaultColor
              ),
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
