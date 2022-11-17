
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/blocobserver.dart';
import 'package:kadojopapp/layout/cubit/cubit.dart';
import 'package:kadojopapp/layout/cubit/states.dart';
import 'package:kadojopapp/layout/home_layout.dart';
import 'package:kadojopapp/modules/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kadojopapp/modules/setting/cubit/cubit.dart';
import 'package:kadojopapp/shard/components/constants.dart';
import 'package:kadojopapp/shard/network/local/CachHelper.dart';
import 'package:kadojopapp/shard/styles/thememod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp();
  await CachHelper.init();
  uId = CachHelper.getData(key: 'uId');
  Widget? widget;

  if (uId != null) {
    widget = Home_layout();
  } else {
    widget = Login();
  }

  runApp(MyApp(
    startScreen: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startScreen;
  const MyApp({Key? key, required this.startScreen}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SettingCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()..getUserData(),
        ),
      ],
      child: BlocConsumer<HomeCubit,HomeState>(
        listener: (context, state) {},
        builder: (context, state) {

          return MaterialApp(

            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: startScreen,
          );
        },
      ),
    );
  }
}
