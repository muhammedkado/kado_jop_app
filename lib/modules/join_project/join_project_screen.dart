import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/modules/join_project/cubit/cubit.dart';
import 'package:kadojopapp/modules/join_project/cubit/states.dart';
import 'package:kadojopapp/modules/join_project/information.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:kadojopapp/shard/styles/colors.dart';
import 'package:readmore/readmore.dart';

class JoinProjectScreen extends StatelessWidget {
  const JoinProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JoinProjectCubit, JoinProjectStates>(
      listener: (Context, state) {},
      builder: (Context, state) {
        var project = JoinProjectCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: const Text('Join Project Now'),
              elevation: 0.5,
              centerTitle: true,
            ),
            body: ConditionalBuilder(
              condition: state is! JoinProjectLoadingState,
              builder: (context) => Padding(
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
                                  left: BorderSide(color: Colors.black))),
                          width: 130,
                          height: 110,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Start:',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${project.projectModel!.starttime}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Rules: ',
                                      style: TextStyle(fontSize: 15),
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
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          '${project.projectModel!.publishtime}',
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      '${project.projectModel!.name}',
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
                      '${project.projectModel!.detail}',
                      style:
                          const TextStyle(fontSize: 15, color: Colors.grey),
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                  color: defaultColor,
                                  blurRadius: 0.5,
                                  spreadRadius: 0.5,
                                )
                              ]
                          ),
                          width: 100,
                          height: 70,
                          child: ListTile(
                            title: const Text(
                              'Job Type',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(
                              '${project.projectModel!.jobtybe}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                  color: defaultColor,
                                  blurRadius: 0.5,
                                  spreadRadius: 0.5,
                                )
                              ]),
                          width: 100,
                          height: 70,
                          child: ListTile(
                            //dense: true,
                            title: const Text(
                              'Job Role',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(
                              '${project.projectModel!.jobrole}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                  color: defaultColor,
                                  blurRadius: 0.5,
                                  spreadRadius: 0.5,
                                )
                              ]),
                          width: 100,
                          height: 70,
                          child: ListTile(
                            //  dense: true,

                            title: const Text(
                              'valid hours',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(
                              '${project.projectModel!.vaildhurs}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Text(
                        'Discription',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      flex: 11,
                      child: SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.all(2),

                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: ReadMoreText(
                                '${project.projectModel!.detail}',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                                trimLines: 12,
                                trimMode: TrimMode.Line,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                      ),
                    ),
                    const Spacer(),
                    defaultButton(
                      colors: defaultColor,
                      text: const Text(
                        'Join Project',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      function: () {
                        Navigatorto(context: context, Widget: Info());
                      },
                    ),
                  ],
                ),
              ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ));
      },
    );
  }
}
