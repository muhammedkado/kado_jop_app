import 'package:flutter/material.dart';
class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Screen'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[200]!,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 75),
                child: Text(
                  'k',
                  style: TextStyle(fontSize: 500, color: Colors.grey[200]),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'We are a website that aims to provide jobs for people who '
                        'want to provide them with additional income and help individuals develop '
                        'their skills and professional backgrounds We also provide applicants with'
                        ' training to help them',
                        style: TextStyle(
                          fontSize: 14.5,
                        ),
                        textAlign: TextAlign.start,
                      ),
                  const Text('This application has been programmed with Flutter + Firebase.',
                    style:TextStyle(
                        fontSize: 15
                    ),),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: const [
                          Text('Program Version: '),
                          Text(
                            'Version 1.0',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),

                      Row(
                        children: const [
                          Text('programed bay:'),
                          Text(
                            ' Muhammed Kado',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text('Programmer Email:'),
                          Text(
                            ' mehmetkado9@gmail.com',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.grey[200],
                  width: double.infinity,
                  child: Column(
                    children: const [
                      Icon(
                        Icons.copyright,
                        size: 35,
                      ),
                      Text('2022 KadoJob All Rights Reserved'),
                      Text('Kadojobs@gmail.com'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
