import 'package:flutter/material.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:kadojopapp/shard/styles/colors.dart';

class Project_Screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    TabController? tabController;
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                // color: Colors.amber,
                //   height: 500,
                width: double.infinity,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: TabBar(
                        padding: const EdgeInsets.all(5),
                        indicatorColor: defaultColor,
                        indicatorWeight: 2,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        controller: tabController,
                        tabs: [
                          Tab(
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.mic,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Recording')
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.headphones,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Transcription')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: 480,
                      child: TabBarView(children: [
                        ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => defaultProjectCard(),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                          itemCount: 10,
                        ),
                        ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                defaultProjectCard(),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 20),
                            itemCount: 5),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
