import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/layout/home_layout.dart';
import 'package:kadojopapp/modules/login/cubit/cubit.dart';
import 'package:kadojopapp/modules/login/cubit/states.dart';
import 'package:kadojopapp/modules/register/register_screen.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:kadojopapp/shard/components/constants.dart';
import 'package:kadojopapp/shard/network/local/CachHelper.dart';
import 'package:kadojopapp/shard/styles/colors.dart';

class Login extends StatelessWidget {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              CachHelper.saveData(
                key: 'uId',
                value: state.uid,
              ).then((value) {
                uId = state.uid;

                NavigatorAndFinish(context: context, Widget: Home_layout());
                ShowTost(msg: 'Login Success', state: TostState.SUCCESS);
              }).catchError((Error) {
                ShowTost(msg: Error.toString(), state: TostState.ERROR);
              });
            }
          },
          builder: (context, state) => Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                      child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontSize: 35),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Login now to browse our Job offers',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                            prefix: Icons.email_outlined,
                            controller: emailController,
                            keybord: TextInputType.emailAddress,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Email Address is Empty';
                              }
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                            prefix: Icons.lock_outline,
                            isPassword: LoginCubit.get(context).isPassword,
                            suffix: LoginCubit.get(context).suffix,
                            controller: passController,
                            keybord: TextInputType.visiblePassword,
                            onSubmit: (valuee) {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passController.text,
                                );
                              }
                            },
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Password is to short';
                              }
                            },
                            lable: 'Password',
                            suffixPressed: () {
                              LoginCubit.get(context)
                                  .ChangePasswordVisibility();
                            }),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'forget password?',
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => defaultButton(
                            colors: defaultColor,
                            text: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                            function: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passController.text,
                                );
                              }
                            },
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t Have Account?'),
                            defaultTextButton(
                              function: () {
                                Navigatorto(
                                    context: context, Widget: RegisterScreen());
                              },
                              lable: const Text('Register'),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                ),
              ),
            ),
          ),
        ));
  }
}
