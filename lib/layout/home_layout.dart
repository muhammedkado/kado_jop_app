import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/layout/cubit/cubit.dart';
import 'package:kadojopapp/layout/cubit/states.dart';
import 'package:kadojopapp/shard/styles/colors.dart';
import '../Model/shar.dart';

class Home_layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
        titleSpacing: 10,
          elevation: 0.2,
          title: Text(cubit.title[cubit.currentIndex]),
          actions: [
            IconButton(
                onPressed: () {},
                icon:const Icon(
                  Icons.search,
                  color: defaultColor,
                )),
            IconButton(
                onPressed: () {},
                icon:const Icon(
                  Icons.notifications,
                  color: defaultColor,
                ))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (int index) {
            cubit.changeNavBar(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.business,
              ),
              label: 'Project',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.send_rounded,
              ),
              label: 'Contact',
              activeIcon: Icon(Icons.send_outlined),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Settings',
            ),
          ],
          selectedItemColor: TextColors,
        ),
        body: cubit.screen[cubit.currentIndex],
      ),
    );
  }
}
