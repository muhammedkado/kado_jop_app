import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Reset_Password extends StatefulWidget {
  @override
  State<Reset_Password> createState() => _Reset_PasswordState();
}

class _Reset_PasswordState extends State<Reset_Password> {
  var emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Reset Password',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 30,
              ),
        ),
        //backgroundColor: defaultColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
        ),
        child: Center(
          child: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    defaultFormField(
                      hintText: 'example@gmail.com',
                      context: context,
                      prefix: Icons.email,
                      keybord: TextInputType.emailAddress,
                      controller: emailController,
                      validate: (value) {
                        if (value.isEmpty) {
                          return "Email must not empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    defoultButtun(
                        text: 'Reset Password',
                        function: () {
                          if (formKey.currentState!.validate()) {
                            FirebaseAuth.instance
                                .sendPasswordResetEmail(
                                    email: emailController.text)
                                .then((value) {
                              Navigator.of(context).pop();

                              ShowTost(
                                msg:
                                    'Check your email. A password reset link has been sent',
                                state: TostState.SUCCESS,
                              );
                            }).catchError((Error)=> ShowTost(msg: Error.code, state: TostState.ERROR));
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
