import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/layout/cubit/cubit.dart';
import 'package:kadojopapp/layout/cubit/states.dart';
import '../Model/shar.dart';

class Home_layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(cubit.title[cubit.currentIndex]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (int index) {
            cubit.changeNavBar(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color(0xFF285681)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business, color: Color(0xFF285681)),
              label: 'Project',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.send_rounded, color: Color(0xFF285681)),
              label: 'Contact',
              activeIcon: Icon(Icons.send_outlined),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Color(0xFF285681)),
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
