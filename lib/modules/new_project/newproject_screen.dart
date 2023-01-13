import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/modules/join_project/join_project_screen.dart';
import 'package:kadojopapp/modules/new_project/cubit/cubit.dart';
import 'package:kadojopapp/modules/new_project/cubit/states.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:kadojopapp/shard/styles/colors.dart';
import 'package:shimmer/shimmer.dart';

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

        return ConditionalBuilder(
          condition: cubit.project.isNotEmpty,
          builder: (context) =>
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          border:
                          Border(bottom: BorderSide(color: Colors.black12))),
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
                            .map((item) =>
                            Image.network(
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
                      child: Text(
                        'NEW PROJECT',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyLarge,
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          Padding(
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
                                  decoration: BoxDecoration(
                                    color: Theme
                                        .of(context)
                                        .colorScheme
                                        .primary,
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
                                    onTap: () {
                                      Navigatorto(
                                        context: context,
                                        Widget: JoinProjectScreen(
                                            newproject: cubit.project[index]!),
                                      );
                                    },

                                    contentPadding: const EdgeInsets.all(10),
                                    title: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '${cubit.project[index]['name']} ',
                                          style: Theme
                                              .of(context)
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
                                        Text(
                                          NewProjectCubit.formattedDate(
                                            cubit.project[index]['timeStamp'],
                                          ),
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .labelSmall,
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                    //  horizontalTitleGap: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      itemCount: cubit.project.length,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),


          fallback: (context) =>SizedBox(
            width: double.infinity,
            height:double.infinity,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Carousel
                  Container(
                    color: Colors.white,
                    height: 200,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //NEW PROJECT
                  Container(
                    color: Colors.white,
                    height: 14,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.20,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        Padding(
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
                                  contentPadding: EdgeInsets.all(10),
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        color: Colors.blue,
                                        height: 10,
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.30,
                                      ),

                                      SizedBox(
                                        height: 5,
                                      )
                                    ],
                                  ),
                                  subtitle: Container(
                                    color: Colors.white,
                                    height: 20,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.30,
                                  ),

                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [

                                      Container(
                                        color: Colors.white,
                                        height: 10,
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.30,
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
              ),)
            ,
          )

        ,
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
