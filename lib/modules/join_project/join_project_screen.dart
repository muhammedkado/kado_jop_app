import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kadojopapp/modules/join_project/information.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:kadojopapp/shard/styles/colors.dart';
import 'package:readmore/readmore.dart';

class JoinProjectScreen extends StatelessWidget {
  const JoinProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Project Now'),
        elevation: 2.0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
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
                const Spacer(),

                const SizedBox(
                  height: 20,
                ),
                const Spacer(),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Rules',style: TextStyle(fontSize: 15),textAlign: TextAlign.center),
                    IconButton(onPressed: (){}, icon:Icon(Icons.file_download_outlined) ),
                    const SizedBox(height: 15,),
                    const Text(
                      '6 day a go',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Arabic Transcription',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Transcription audio to text in Arabic languages',
              style: TextStyle(fontSize: 15, color: Colors.grey),
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
                      ]),
                  width: 120,
                  height: 70,
                  child: const ListTile(
                    title: Text(
                      'Job Type',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      'Part Time',
                      style: TextStyle(
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
                  width: 120,
                  height: 70,
                  child: const ListTile(
                    //dense: true,
                    title: Text(
                      'Job Role',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      'Transcriber',
                      style: TextStyle(
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
                  width: 120,
                  height: 70,
                  child: const ListTile(
                    //  dense: true,
                    title: Text(
                      'valid hours',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      '1000',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Discription',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              //color: Colors.cyanAccent,
              child: const ReadMoreText(
                'Listen to audio clips of Portuguese language and then '
                'convert them into a written text and correct it according to the project rules,'
                ' payment per hour of audio, and not a requirement to be native. The important thing'
                ' is that you master the skill of l is that you master the skill of l  is that you master the skill of l  is that you master the skill of l',
                style: TextStyle(
                  fontSize: 16,
                ),
                trimLines: 6,
                trimMode: TrimMode.Line,
                textAlign: TextAlign.justify,
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
    );
  }
}
