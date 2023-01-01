import 'package:flutter/material.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
class MyProject_Screen extends StatelessWidget {
  var SerchControlar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics:BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              // color: Colors.amber,
              //   height: 500,
              width: double.infinity,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: SerchControlar,
                    decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                      labelText:'Search',
                      prefix: Icon(Icons.search_rounded,color: Colors.green,)

                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => myProjectCard(context,),
                    separatorBuilder: (context, index) => const SizedBox(height: 5),
                    itemCount: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*Widget buildProject(ProjectModel user) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Color(0xFF285681),
                  borderRadius: BorderRadius.circular(15)),

            ),
          ],
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${user.ProjectName}",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            Text(
              "${user.Body}",
              style: const TextStyle(
                fontSize: 10,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            )
          ],
        )
      ],
    );*/
