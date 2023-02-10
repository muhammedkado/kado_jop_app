import 'package:flutter/material.dart';

import 'package:kadojopapp/modules/admin/messages/contact_messages_screen.dart';
import 'package:kadojopapp/modules/admin/project/project_view_screen.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:kadojopapp/shard/styles/colors.dart';
import 'package:sizer/sizer.dart';

class AdminLayout extends StatelessWidget {
  const AdminLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: MaterialButton(
            onPressed: () {
              Navigatorto(context: context, Widget: ProjectViewScreen());
            },
            height: 5.h,
            color: defaultColor,
            child: Text('Show Projects'),
          )),
          SizedBox(
            height: 0.5.h,
          ),
          Center(
              child: MaterialButton(
            onPressed: () {

            },
            height: 5.h,
            color: defaultColor,
            child: Text('Member for Project'),
          )),
          SizedBox(
            height: 0.5.h,
          ),
          Center(
              child: MaterialButton(
            onPressed: () {
              Navigatorto(context: context, Widget: ContactMessagesScreen());
            },
            height: 5.h,
            color: defaultColor,
            child: Text('Contact Messages'),
          )),
        ],
      ),
    );
  }
}
