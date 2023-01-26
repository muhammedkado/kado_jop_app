import 'package:flutter/material.dart';
import 'package:kadojopapp/modules/admin/Add_project_screen.dart';
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
              Navigatorto(context: context, Widget: AddProjectScreen());
            },
            height: 5.h,
            color: defaultColor,
            child: Text('Add Project'),
          )),
          Center(
              child: MaterialButton(
            onPressed: () {

            },
            height: 5.h,
            color: defaultColor,
            child: Text('Edit Project'),
          )),
          Center(
              child: MaterialButton(
            onPressed: () {},
            height: 5.h,
            color: defaultColor,
            child: Text('View project'),
          )),
        ],
      ),
    );
  }
}
