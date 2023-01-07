import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Screen'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
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
                   Text(
                    'We are a website that aims to provide jobs for people who '
                        'want to provide them with additional income and help individuals develop '
                        'their skills and professional backgrounds We also provide applicants with'
                        ' training to help them.',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.justify,
                  ),
                   Text(
                    'This application has been programmed with Flutter + Firebase.',
                    style:Theme.of(context).textTheme.bodySmall,
                     textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children:  [
                      Text('Program Version: ',style: Theme.of(context).textTheme.bodySmall,),
                      Text(
                          'Version 1.0',
                          style: Theme.of(context).textTheme.bodySmall
                      )
                    ],
                  ),
                  Row(
                    children:  [
                      Text(
                        'programed bay:',
                        style:Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                          ' Muhammed Kado.',
                          style:Theme.of(context).textTheme.bodySmall
                      )
                    ],
                  ),
                  Row(
                    children:  [
                      Text(
                          'Programmer Email:',
                          style: Theme.of(context).textTheme.bodySmall
                      ),
                      Text(
                          ' mehmetkado9@gmail.com.',
                          style: Theme.of(context).textTheme.bodySmall
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
              color: Theme.of(context).colorScheme.tertiary,
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
      ),
    );
  }
}
