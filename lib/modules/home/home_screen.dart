import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:kadojopapp/Model/shar.dart';
import 'package:kadojopapp/components/components.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:kadojopapp/shard/styles/colors.dart';

class home_screen extends StatelessWidget {
  /*
  List<Image> image = [
    Image.network(
        'https://miro.medium.com/max/2400/1*rM3u1FqmoWyXdGwQ1Gqnlg.jpeg'),
    Image.network(
        'https://s41256.pcdn.co/wp-content/uploads/2022/07/Appen_Website_link-logo.jpg'),
    Image.network(
        'https://assets.bossjob.com/companies/22693/logo/MvJquPY6C06SKmzOTuDGPmdKu74Vpw0AvmMvPS8a.png'),
    Image.network(
        'https://mma.prnewswire.com/media/789578/bytedance_Logo.jpg?p=facebook'),
  ];
  */
  final List<String> images = [
    'https://miro.medium.com/max/2400/1*rM3u1FqmoWyXdGwQ1Gqnlg.jpeg',
    'https://mma.prnewswire.com/media/789578/bytedance_Logo.jpg?p=facebook',
    'https://s41256.pcdn.co/wp-content/uploads/2022/07/Appen_Website_link-logo.jpg',
    'https://assets.bossjob.com/companies/22693/logo/MvJquPY6C06SKmzOTuDGPmdKu74Vpw0AvmMvPS8a.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.headset,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Old Transcription  Project',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: TextColors,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    width: 50,
                  ),
                  defaultTextButton(
                    lable: const Text(
                      'see more ->',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                    function: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                child: Container(
                  height: 120,
                  color: Colors.grey,
                  width: double.infinity,
                  child: GridView.count(
                   scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing:1.0,
                    crossAxisSpacing: 1.0,
                    childAspectRatio: 1 /2,
                    children: List.generate(
                             2,
                        (index) => buildGridProduct(),
                  ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.mic,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    'Old Recording  Project',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: TextColors,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    width: 70,
                  ),
                  const Text(
                    'see more -> ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      ProjectContainer(
                          Tatole: 'Spanish Recording',
                          Body:
                              'A previous Spanish recording  project worked with us 100 Native people',
                          micc: true),
                      const SizedBox(
                        width: 5,
                      ),
                      ProjectContainer(
                          Tatole: 'Arabic Recording',
                          Body:
                              'A previous Arabic recording project worked with us 800 Native people',
                          micc: true),
                      const SizedBox(
                        width: 24,
                      ),
                      ProjectContainer(
                          Tatole: 'Turkish Recording',
                          Body:
                              'A previous Turkish recording project worked with us 500 Native people',
                          micc: true),
                      const SizedBox(
                        width: 24,
                      ),
                      ProjectContainer(
                          Tatole: 'German Recording',
                          Body:
                              'A previous German recording project worked with us 300 Native people',
                          micc: true),
                      const SizedBox(
                        width: 24,
                      ),
                      ProjectContainer(
                          Tatole: 'French Recording',
                          Body:
                              'A previous French recording project worked with us 400 Native people',
                          micc: true),
                      const SizedBox(
                        width: 24,
                      ),
                      ProjectContainer(
                          Tatole: 'Malaysian Recording',
                          Body:
                              'A previous Malaysian recording project worked with us 50 Native people',
                          micc: true),
                      const SizedBox(
                        width: 24,
                      ),
                      ProjectContainer(
                          Tatole: 'Uzbekistan Recording',
                          Body:
                              'A previous Uzbekistan recording project worked with us 50 Native people',
                          micc: true),
                      const SizedBox(
                        width: 24,
                      ),
                      ProjectContainer(
                          Tatole: 'Portuguese Recording',
                          Body:
                              'A previous Portuguese recording project worked with us 100 Native people',
                          micc: true),
                      const SizedBox(
                        width: 24,
                      ),
                      ProjectContainer(
                          Tatole: 'Swedish Recording',
                          Body:
                              'A previous Swedish recording project worked with us 50 Native people',
                          micc: true),
                      const SizedBox(
                        width: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
