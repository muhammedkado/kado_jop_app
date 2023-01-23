import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/modules/join_project/cubit/cubit.dart';
import 'package:kadojopapp/modules/join_project/cubit/states.dart';
import 'package:kadojopapp/modules/join_project/information.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:kadojopapp/shard/styles/colors.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';

class JoinProjectScreen extends StatelessWidget {
  var newproject;

  JoinProjectScreen({Key? key, this.newproject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JoinProjectCubit, JoinProjectStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var project = JoinProjectCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Join Project Now'),
            elevation: 0.5,
            centerTitle: true,
          ),
          body: ConditionalBuilder(
            condition: project.projectDetail.isNotEmpty,
            builder: (context) =>
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 115,
                            height: 115,
                            decoration: BoxDecoration(
                              color: defaultColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Align(
                              child: Image(
                                image: NetworkImage(
                                  'https://miro.medium.com/max/2400/1*rM3u1FqmoWyXdGwQ1Gqnlg.jpeg',
                                ),
                                fit: BoxFit.cover,
                                height: 105,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              // color: Colors.yellowAccent,
                              border: Border(
                                left: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            width: 200,
                            height: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Start:',
                                        style:
                                        Theme
                                            .of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text('${newproject['starttime']}',
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodySmall),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Rules: ',
                                        style:
                                        Theme
                                            .of(context)
                                            .textTheme
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                          iconSize: 22,
                                          tooltip: 'Rules',
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.file_download_outlined,
                                            size: 20,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          /* Text(
                        NewProjectCubit.formattedDate(
                            '${newproject['timeStamp']}'),
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),*/
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${newproject['name']}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${newproject['detail']}',
                        style: const TextStyle(
                            fontSize: 15, color: Colors.grey),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: defaultColor,
                        height: 2,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .primary,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 0.5,
                                    spreadRadius: 1.5,
                                  )
                                ]),
                            width: 120,
                            height: 70,
                            child: ListTile(
                              title: Text('Job Type',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyMedium),
                              subtitle: Text('${newproject['jobtybe']}',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleSmall),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .primary,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 0.5,
                                    spreadRadius: 1.5,
                                  )
                                ]),
                            width: 120,
                            height: 70,
                            child: ListTile(
                              //dense: true,
                              title: Text('Job Role',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyMedium),
                              subtitle: Text('${newproject['jobrole']}',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleSmall),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .primary,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 0.5,
                                    spreadRadius: 1.5,
                                  )
                                ]),
                            width: 120,
                            height: 70,
                            child: ListTile(
                              //  dense: true,

                              title: Text('valid hours',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyMedium),
                              subtitle: Text('${newproject['vaildhurs']}',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleSmall),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(
                        child: Text(
                          'Discription',
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        flex: 11,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: ReadMoreText(
                              '${newproject['detail']}',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleSmall,
                              trimLines: 12,
                              trimMode: TrimMode.Line,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),

                      defaultButton(
                        colors: defaultColor,
                        text: Text(
                          'Join Project',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        function: () {
                          Navigatorto(
                            context: context,
                            Widget: Info(
                              newProject: newproject,
                            ),
                          );
                        },
                      ),


                    ],
                  ),
                ),
            fallback: (context) =>SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 115,
                              height: 115,
                              decoration: BoxDecoration(
                                color: defaultColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                width: 50,
                                height: 60,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                // color: Colors.yellowAccent,
                                border: Border(
                                  left: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              width: 200,
                              height: 120,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          height: 14,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width *
                                              0.30,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          height: 14,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width *
                                              0.20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          color: Colors.white,
                          height: 14,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.30,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          color: Colors.white,
                          height: 30,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 1.1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.white,
                          height: 1,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              width: 120,
                              height: 70,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              width: 120,
                              height: 70,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              width: 120,
                              height: 70,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            color: Colors.white,
                            height: 15,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.30,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                              color: Colors.white,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.3,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 1.1),
                        ),
                        const Spacer(),
                        Center(
                          child: Container(
                            color: Colors.white,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.05,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          ),
        );
      },
    );
  }
}

/*
*/
