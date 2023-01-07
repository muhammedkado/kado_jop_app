import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/layout/cubit/cubit.dart';
import 'package:kadojopapp/layout/cubit/states.dart';

// ignore: camel_case_types
class Home_layout extends StatelessWidget {
  const Home_layout({Key? key}) : super(key: key);

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
                icon: const Icon(
                  Icons.notifications,
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
              label: 'New Project',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.check_box_outlined,
              ),
              label: 'My project',
            ),
            /*
            BottomNavigationBarItem(
              icon: Icon(
                Icons.send_rounded,
              ),
              label: 'Contact',
              activeIcon: Icon(Icons.send_outlined),
            ),
            */
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Settings',
            ),
          ],
        ),
        body: cubit.screen[cubit.currentIndex],
      ),
    );
  }
}
