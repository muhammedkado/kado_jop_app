import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:kadojopapp/modules/login/login_screen.dart';

import 'package:kadojopapp/shard/components/componentes.dart';

class Verify extends StatefulWidget {
  Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final auth = FirebaseAuth.instance;
  User? user;
  Timer? timer;

  @override
  void initState() {
    user = auth.currentUser;
    user!.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerify();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Email'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('An email has been send to\n ${user!.email}'),
      ),
    );
  }

  Future<void> checkEmailVerify() async {
    print('======>checkEmailVerify function verifyLoadingState');
    user = auth.currentUser;
    await user!.reload();
    if (user!.emailVerified) {
      ShowTost(
          msg: 'Your Email has been verified pleas login  ',
          state: TostState.SUCCESS);
      Navigatorto(context: context, Widget: Login());
      timer!.cancel();
    }
  }
}
