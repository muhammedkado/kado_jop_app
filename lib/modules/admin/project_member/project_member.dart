import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/modules/admin/cubit/cubit.dart';
import 'package:kadojopapp/modules/admin/cubit/states.dart';
import 'package:kadojopapp/modules/admin/project_member/member.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:sizer/sizer.dart';

class ProjectMember extends StatelessWidget {
  const ProjectMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AdminCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Project Member'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      Navigatorto(context: context, Widget: Member(cubit.MProject[index]));
                    },
                    title: Text('${cubit.MProject[index]['ProjectName']}'),
                    subtitle: Text(
                      '${cubit.MProject[index]['ProjectDetail']}',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.grey, overflow: TextOverflow.clip),
                      maxLines: 3,
                    ),
                    trailing: Column(
                      children: [
                        Expanded(child: Icon(Icons.arrow_forward_ios_outlined)),
                        Text('21-2-2023',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.grey)),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 2.h),
                  itemCount: cubit.MProject.length,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
