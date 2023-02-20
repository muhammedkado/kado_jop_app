import 'package:flutter/material.dart';
import 'package:kadojopapp/modules/admin/messages/contact_messages_screen.dart';
import 'package:kadojopapp/modules/admin/project/project_view_screen.dart';
import 'package:kadojopapp/modules/admin/project_member/project_member.dart';
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
            child: Text('Show Projects',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),),
          )),
          SizedBox(
            height: 0.5.h,
          ),
          Center(
              child: MaterialButton(
            onPressed: () {
              Navigatorto(context: context, Widget: ProjectMember());
            },
            height: 5.h,
            color: defaultColor,
            child: Text('Member for Project',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)),
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
            child: Text('Contact Messages',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)),
          )),
        ],
      ),
    );
  }
}
