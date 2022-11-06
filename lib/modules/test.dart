
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Image> image = [
      Image.network('https://www.kadojob.com/assets/img/values-1.png'),
      Image.network('https://www.kadojob.com/assets/img/values-1.png'),
      Image.network('https://www.kadojob.com/assets/img/values-1.png'),
      Image.network('https://www.kadojob.com/assets/img/values-1.png'),
    ];
    return Scaffold(
      body: Column(
        children: [
          CarouselSlider(
            items:image.map((e) =>Image(image:e.image)).toList()

                ,
            
            options: CarouselOptions(
                height: 230,
                initialPage: 0,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayInterval: const Duration(seconds: 4),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                viewportFraction: 1
              // reverse: false,
            ),
          ),
        ],
      ),
    );
  }
}
/*
SingleChildScrollView(
scrollDirection: Axis.horizontal,
child: Padding(
padding: const EdgeInsets.all(15.0),
child: Row(
children: [
ProjectContainer(
Tatole: 'Dutch Transcription',
Body:
'A previous Dutch transcription project worked with us 24 Native people '),
const SizedBox(
width: 24,
),
ProjectContainer(
Tatole: 'Italian Transcription',
Body:
'A previous Italian transcription project worked with us 250 Native people'),
const SizedBox(
width: 24,
),
ProjectContainer(
Tatole: 'Turkish Transcription',
Body:
'A previous Turkish transcription project worked with us 200 Native people'),
const SizedBox(
width: 24,
),
ProjectContainer(
Tatole: 'Polish Transcription',
Body:
'A previous Polish transcription project worked with us 25 Native people'),
const SizedBox(
width: 24,
),
ProjectContainer(
Tatole: 'English Transcription',
Body:
'A previous English transcription project worked with us 300 Native people'),
const SizedBox(
width: 24,
),
ProjectContainer(
Tatole: 'French Transcription',
Body:
'A previous French transcription project worked with us 500 Native people'),
const SizedBox(
width: 24,
),
ProjectContainer(
Tatole: 'Portuguese Transcription',
Body:
'A previous Portuguese transcription project worked with us 55 Native people'),
const SizedBox(
width: 24,
),
ProjectContainer(
Tatole: 'Thai Transcription',
Body:
'A previous Thai transcription project worked with us 30 Native people'),
const SizedBox(
width: 24,
),
ProjectContainer(
Tatole: 'Egypt Transcription',
Body:
'A previous Egypt transcription project worked with us 3000 Native people'),
const SizedBox(
width: 24,
),
ProjectContainer(
Tatole: 'Swedish Transcription',
Body:
'A previous Swedish transcription project worked with us 50 Native people'),
const SizedBox(
width: 24,
),
],
),
),
),

 */

//setting background Container
/*
                    height: 10,
 Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                borderRadius: const BorderRadiusDirectional.vertical(
                                    bottom: Radius.elliptical(50,50))
                              ),

                              width: double.infinity,
                              height: 140,
                            ),
                          ),



 */
