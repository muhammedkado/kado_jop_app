import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/layout/home_layout.dart';
import 'package:kadojopapp/modules/register/cubit/cubit.dart';
import 'package:kadojopapp/modules/register/cubit/state.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:kadojopapp/shard/styles/colors.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var nameControlar = TextEditingController();
  var emailControlar = TextEditingController();
  var passwordControlar = TextEditingController();
  var phoneControlar = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is CreateSuccessState) {
            NavigatorAndFinish(
              context: context,
              Widget: Home_layout(),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(

            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Register',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontSize: 35),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Register now to browse our job offers',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          defaultFormField(
                              prefix: Icons.person,
                              controller: nameControlar,
                              keybord: TextInputType.text,
                              lable: 'User Name',
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'user name is not be Empty';
                                }
                              }),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                              prefix: Icons.email_outlined,
                              controller: emailControlar,
                              keybord: TextInputType.emailAddress,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Email Address is not be Empty';
                                }
                              }),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                              prefix: Icons.lock_outline,
                              isPassword: RegisterCubit.get(context).isPassword,
                              suffix: RegisterCubit.get(context).suffix,
                              controller: passwordControlar,
                              keybord: TextInputType.visiblePassword,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Password is to short';
                                }
                              },
                              lable: 'Password',
                              suffixPressed: () {
                                RegisterCubit.get(context)
                                    .changePasswordVisibility();
                              }),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                            lable: 'Phone Number',
                              prefix: Icons.phone,
                              controller: phoneControlar,
                              keybord: TextInputType.phone,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Phone is not be Empty';
                                }

                              }),
                          const SizedBox(
                            height: 15,
                          ),
                          ConditionalBuilder(
                            condition: state is! RegisterLoadingState,
                            builder: (context) => defaultButton(
                              colors: defaultColor,
                              text: 'Register',
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  RegisterCubit.get(context).userRegister(
                                    email: emailControlar.text,
                                    name: nameControlar.text,
                                    phone: phoneControlar.text,
                                    password: passwordControlar.text,
                                  );
                                }
                              },
                            ),
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator()),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
