import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:kadojopapp/modules/admin/cubit/cubit.dart';
import 'package:kadojopapp/modules/admin/project/edti_project_screen.dart';
import 'package:kadojopapp/modules/admin/cubit/states.dart';
 import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:sizer/sizer.dart';

import 'Add_project_screen.dart';

class ProjectViewScreen extends StatelessWidget {
  ProjectViewScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController validHoursController = TextEditingController();
  TextEditingController durationHoursController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController term1Controller = TextEditingController();
  TextEditingController term2Controller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = AdminCubit.get(context);
    var ref = FirebaseFirestore.instance.collection('project');
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
            title: Text(
              'Add New Project',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      Navigatorto(context: context, Widget: AddProjectScreen());
                    },
                    icon: Icon(
                      Icons.add_circle_outline,
                      size: 35,
                    )),
              ),
            ]),
        body: ConditionalBuilder(
          condition: cubit.project.isNotEmpty,
          builder: (context) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'MY PROJECT',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 93.h,
                  child: StreamBuilder(
                    stream: ref.snapshots(),
                    builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                     EdgeInsets.symmetric(horizontal: 3.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 12.h,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 1.2,
                                            spreadRadius: 0.5,
                                          )
                                        ],
                                      ),
                                      child: ListTile(
                                        contentPadding: const EdgeInsets.all(6),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              '${snapshot.data!.docs[index]['name']}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              maxLines: 1,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            )
                                          ],
                                        ),
                                        subtitle: Text(
                                          '${snapshot.data!.docs[index]['detail']}',
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              overflow: TextOverflow.ellipsis),
                                          maxLines: 2,
                                        ),

                                        trailing: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: 4.4.h,
                                              width: 26.w,
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      cubit.deleteProject(
                                                          PUid: snapshot.data!.docs[index]['pid']);
                                                    },
                                                    icon: Icon(Icons
                                                        .remove_circle_outline),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      Navigatorto(
                                                        context: context,
                                                        Widget:
                                                            EditProjectScreen(
                                                          project: snapshot.data!.docs[index],
                                                        ),
                                                      );
                                                    },
                                                    icon: Icon(Icons.edit),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        dense: false,
                                        //  horizontalTitleGap: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: snapshot.data!.docs.length);
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: LinearProgressIndicator(),
                        );
                      }
                      else {
                        return Center(
                          child: LinearProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          fallback: (context) => Center(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
