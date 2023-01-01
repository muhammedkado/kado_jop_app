import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/modules/home/cubit/cubit.dart';
import 'package:kadojopapp/modules/home/cubit/states.dart';
import 'package:kadojopapp/modules/join_project/join_project_screen.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:kadojopapp/shard/styles/colors.dart';

class NewProject_Screen extends StatelessWidget {
  final List<String> images = [
    'https://miro.medium.com/max/2400/1*rM3u1FqmoWyXdGwQ1Gqnlg.jpeg',
    'https://mma.prnewswire.com/media/789578/bytedance_Logo.jpg?p=facebook',
    'https://s41256.pcdn.co/wp-content/uploads/2022/07/Appen_Website_link-logo.jpg',
    'https://assets.bossjob.com/companies/22693/logo/MvJquPY6C06SKmzOTuDGPmdKu74Vpw0AvmMvPS8a.png',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewProjectCubit, NewProjectStates>(
      listener: (context, state) => {},
      builder: (context, state) {

        var cubit = NewProjectCubit.get(context);

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))),
                height: 200.0,
                width: double.infinity,
                child: Carousel(
                  dotSpacing: 15.0,
                  dotSize: 5.0,
                  dotIncreasedColor: defaultColor,
                  dotColor: Colors.grey,
                  dotBgColor: Colors.transparent,
                  indicatorBgPadding: 10.0,
                  dotPosition: DotPosition.bottomCenter,
                  images: images
                      .map((item) => Image.network(
                            item,
                            //  fit: BoxFit.cover,
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text(
                  'NEW PROJECT',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              ConditionalBuilder(
                condition: state is! GetNewProjectLoadingState,
                builder: (context) => ListView.builder(
                  shrinkWrap: true,
                  itemBuilder:(context, index) =>  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: double.infinity,
                          height: 90,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 1.2,
                                spreadRadius: 0.5,
                              )
                            ],
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigatorto(
                                  context: context, Widget: const JoinProjectScreen());
                            },

                            contentPadding: const EdgeInsets.all(10),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${cubit.project[index]['name']} ',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      overflow: TextOverflow.ellipsis),
                                  maxLines: 1,
                                ),
                                const SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                            subtitle: Text(
                              '${cubit.project[index]['detail']}',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 2,
                            ),

                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(NewProjectCubit.formattedDate(cubit.projectModel!.timeStamp),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.start),
                              ],
                            ),
                            //  horizontalTitleGap: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  itemCount:cubit.project.length ,
                ),
                fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}

/*
Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:const [
                Text(
                  'German Transcription ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                ),
                Text(
                  'In this paper we analyze the relevance of gameplay and game mechanics from',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 2,
                ),
              ],
            ),
 */
