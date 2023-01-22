import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/blocobserver.dart';
import 'package:kadojopapp/layout/cubit/cubit.dart';
import 'package:kadojopapp/layout/cubit/states.dart';
import 'package:kadojopapp/layout/home_layout.dart';
import 'package:kadojopapp/modules/join_project/cubit/cubit.dart';
import 'package:kadojopapp/modules/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kadojopapp/modules/new_project/cubit/cubit.dart';
import 'package:kadojopapp/modules/myproject/cubit/cubit.dart';
import 'package:kadojopapp/modules/setting/contact/cubit/cubit.dart';
import 'package:kadojopapp/modules/setting/cubit/cubit.dart';
import 'package:kadojopapp/shard/components/constants.dart';
import 'package:kadojopapp/shard/network/local/CachHelper.dart';
import 'package:kadojopapp/shard/styles/thememod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  await messaging.requestPermission();
  messaging.getToken().then((value) {});

  await CachHelper.init();
  uId = CachHelper.getData(key: 'uId');

  dynamic isDark = CachHelper.getData(key: 'isDark');
  Widget? widget;

  if (uId != null) {
    widget = Home_layout();
  } else {
    widget = Login();
  }

  runApp(MyApp(
    isDark: isDark,
    startScreen: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startScreen;
  final bool? isDark;

  const MyApp({Key? key, required this.startScreen, this.isDark})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MyProjectCubit()..getProject(),
        ),
        BlocProvider(
          create: (context) => NewProjectCubit()..getProject(),
        ),
        BlocProvider(
          create: (context) => JoinProjectCubit()
            ..getProject()
            ..getUserData()
            ..getUserApplyProject(),
        ),
        BlocProvider(
          create: (context) => ContactCubit(),
        ),
        BlocProvider(
          create: (context) => SettingCubit()..getUserData(),
        ),
        BlocProvider(
          create: (context) =>
              HomeCubit()..changeAppMod(shereed: isDark, index: false),
        ),
      ],
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: HomeCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            /*ThemeMode.dark,*/

            home: startScreen,
          );
        },
      ),
    );
  }
}
