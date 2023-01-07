import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/modules/project/cubit/cubit.dart';
import 'package:kadojopapp/modules/project/cubit/states.dart';
import 'package:kadojopapp/shard/styles/colors.dart';

class MyProject_Screen extends StatelessWidget {
  var SerchControlar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyProjectCubit, MyProjectStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MyProjectCubit.get(context);
        return SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    // color: Colors.amber,
                    //   height: 500,
                    width: double.infinity,

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          ConditionalBuilder(
                            condition: state is! MyProjectLoadingState,
                            builder: (context) => ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 1.2,
                                          spreadRadius: 0.5,
                                        )
                                      ],
                                    ),
                                    child: ListTile(
                                      onTap: () {
                                        print(cubit.MyProjectDetail[index]
                                            ['pname']);
                                        /*Navigatorto(
                                                    context: context,
                                                    Widget: const MyProjectDetails());*/
                                      },

                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '${cubit.MyProjectDetail[index]['pname']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                            maxLines: 1,
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          )
                                        ],
                                      ),
                                      subtitle: Text(
                                        '${cubit.MyProjectDetail[index]['pdetails']}',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        maxLines: 3,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8),
                                      trailing: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            width: 50,
                                            height: 30,
                                            decoration: const BoxDecoration(
                                              color: defaultColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
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
                                              '${cubit.MyProjectDetail[index]['pprofit']}\$',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${cubit.MyProjectDetail[index]['pend']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                            textAlign: TextAlign.end,
                                          ),
                                        ],
                                      ),
                                      //  horizontalTitleGap: 10,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                              itemCount: cubit.MyProjectDetail.length,
                            ),
                            fallback: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/*Widget buildProject(ProjectModel user) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Color(0xFF285681),
                  borderRadius: BorderRadius.circular(15)),

            ),
          ],
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${user.ProjectName}",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            Text(
              "${user.Body}",
              style: const TextStyle(
                fontSize: 10,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            )
          ],
        )
      ],
    );*/
