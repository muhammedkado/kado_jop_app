import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
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
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration:const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black12))

            ),
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
          ),SizedBox(height: 15,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              'NEW PROJECT',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics:const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => newProjectHorizontalCard(),
            separatorBuilder: (context, index) => SizedBox(),
            itemCount: 10,
          ),
         const SizedBox(height: 10,)
        ],
      ),
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
