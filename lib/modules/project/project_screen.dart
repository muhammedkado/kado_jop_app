import 'package:flutter/material.dart';
import 'package:kadojopapp/Model/projectmodel.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:kadojopapp/shard/styles/colors.dart';

class Project_Screen extends StatelessWidget {
  List<ProjectModel> user = [
    ProjectModel(
        ProjectName: 'German  Recording',
        Body:
            'Online German Recording Task for Native\nBorne German (not immigrant)of German,\nEurope only.',
        projectType: true
        //  iconn: Icons.mic

        ),
    ProjectModel(
        ProjectName: 'German  Transcription',
        Body:
            'German Voices Transcription Project There are\nno conditions. Enter with us.\nTake a training before starting and read\nthe rules and start.',
        //  iconn: Icons.headset
        projectType: false),
    ProjectModel(
        ProjectName: 'French  Recording',
        Body:
            'Online French Recording Task for Native\nBorne French (not immigrant)of French,\nEurope only.',
        //  iconn: Icons.mic
        projectType: true),
    ProjectModel(
        ProjectName: 'French  Transcription',
        Body:
            'French Voices Transcription Project There are no\nconditions. Enter with us.\nTake a training before starting and read\nthe rules and start.',
        // iconn: Icons.headset
        projectType: false),
    ProjectModel(
        ProjectName: 'Arabic  Recording',
        Body:
            'Online Arabic Recording Task for Native\nBorne Arabic (not immigrant)of Arabic.',
        //iconn: Icons.mic
        projectType: true),
    ProjectModel(
        ProjectName: 'Arabic  Transcription',
        Body:
            'Arabic Transcription  Jordanian dialect,\nJordanians only required, enter with us,\ntake a training before starting, read\nthe rules and start.',
        // iconn: Icons.headset
        projectType: false),
    ProjectModel(
        ProjectName: 'Portugal  Recording',
        Body:
            'Online Portugal Recording Task for Native\nBorne Portugal (not immigrant)of Portugal,\nEurope only Not Brazilian.',
        projectType: true),
    ProjectModel(
        ProjectName: 'Swedish  Recording',
        Body:
            'Online Swedish Recording Task for Native\nBorne Swedish (not immigrant)of Sweden.',
        projectType: true),
    ProjectModel(
        ProjectName: 'Italian  Transcription',
        Body:
            'Italian Voices Transcription Project There are no\nconditions. Enter with us.\nTake a training before starting and read\nthe rules and start.',
        projectType: false),
/*
, */
  ];

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
                            itemCount: user.length),
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
