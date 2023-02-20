import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/modules/myproject/cubit/cubit.dart';
import 'package:kadojopapp/modules/myproject/cubit/states.dart';
import 'package:kadojopapp/shard/styles/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class MyProject_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyProjectCubit, MyProjectStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MyProjectCubit.get(context);
        return SafeArea(
          child: SingleChildScrollView(

            child: Column(
              children: [
                SizedBox(
                  // color: Colors.amber,
                  height: 600,
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
                          builder: (context) => ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Container(
                              width: double.infinity,
                              height: 10.h,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 1.2,
                                    spreadRadius: 0.5,
                                  )
                                ],
                              ),
                              child: ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${cubit.MyProjectDetail[index]['projectName']}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    )
                                  ],
                                ),
                                subtitle: Text(
                                  '${cubit.MyProjectDetail[index]['projectDetails']}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 2,
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                trailing: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
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
                                        '${cubit.MyProjectDetail[index]['projectProfit']}\$',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '${cubit.MyProjectDetail[index]['projectEndData']}',
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
                            itemCount: cubit.MyProjectDetail.length,
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                              height: 10,
                            ),
                          ),
                          fallback: (BuildContext context) => Expanded(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey,
                              highlightColor: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 90,
                                            decoration: const BoxDecoration(
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
                                            child: ListTile(
                                              contentPadding:
                                                  EdgeInsets.all(10),
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                    height: 15,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.35,
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  )
                                                ],
                                              ),
                                              subtitle: Container(
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                height: 30,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.30,
                                              ),

                                              trailing: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                    height: 10,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.10,
                                                  ),
                                                ],
                                              ),
                                              //  horizontalTitleGap: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    itemCount: 4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
