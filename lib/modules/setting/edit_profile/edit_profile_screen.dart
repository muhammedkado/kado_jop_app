import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kadojopapp/modules/setting/cubit/cubit.dart';
import 'package:kadojopapp/modules/setting/cubit/states.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:kadojopapp/shard/styles/colors.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var brithDayController = TextEditingController();
  var countryController = TextEditingController();

  String? chooseCountry = '';

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit, SettingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SettingCubit.get(context);
        nameController.text = cubit.userModel!.name!;
        emailController.text = cubit.userModel!.email!;
        phoneController.text = cubit.userModel!.phone!;
        brithDayController.text = cubit.userModel!.brithDay!;
        chooseCountry = cubit.userModel!.country!;

        return Scaffold(
          appBar: AppBar(
            title:const Text('Edit Your Profile'),
            centerTitle: true,

            actions: [
              defaultTextButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                    cubit.userUpdate(
                      email: emailController.text,
                      name: nameController.text,
                      phone: phoneController.text,
                      brithDay: brithDayController.text,
                    );
                    ShowTost(msg: 'Information Has been Updated', state: TostState.SUCCESS);
                    }
                  },
                  lable: Text(
                    'Update',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ))
            ],
          ),
          body: ConditionalBuilder(
              condition: state is! SettingUserUpdateLoadingState,
              builder: (context) => GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (state is UserUpdateLoadingState) const LinearProgressIndicator(),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Basic Date',style: Theme.of(context).textTheme.bodyLarge,),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  defaultFormField(
                                      context: context,
                                      prefix: Icons.person_outline,
                                      controller: nameController,
                                      keybord: TextInputType.text,
                                      lable: 'Full Name',
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'Name must not be Empty';
                                        }
                                        return null;
                                      }),
                                  const SizedBox(
                                    height: 15,
                                  ),

                                  defaultFormField(
                                    context: context,
                                    lable: 'BirthDay',
                                    ontap: () async {
                                      await showDatePicker(
                                        builder: (context, child) {
                                          return Theme(
                                            data: Theme.of(context).copyWith(
                                                colorScheme: ColorScheme.light(
                                                  primary: defaultColor,
                                                  // <-- SEE HERE
                                                  onPrimary: Colors.white,
                                                  // <-- SEE HERE
                                                  onSurface: Colors
                                                      .blueAccent, // <-- SEE HERE
                                                )
                                            ),
                                            child: child!,
                                          );
                                        },
                                        helpText: 'Select Your BrithDay',

                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now(),
                                      ).then((value) {
                                        // print(DateFormat.yMd().format(value!));
                                        brithDayController.text =
                                            DateFormat.yMd().format(value!);
                                      });
                                    },
                                    controller: brithDayController,
                                    keybord: TextInputType.datetime,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'BrithDay must not be Empty';
                                      }
                                    },
                                    prefix: Icons.date_range,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [


                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Contact Detail',style: Theme.of(context).textTheme.bodyLarge,),


                                      const SizedBox(
                                        height: 25,
                                      ),
                                      defaultFormField(
                                          context: context,
                                          prefix: Icons.email_outlined,
                                          controller: emailController,
                                          keybord: TextInputType.emailAddress,
                                          validate: (value) {
                                            if (value!.isEmpty) {
                                              return 'Email Address must not be Empty';
                                            }
                                            return null;
                                          }),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      defaultFormField(
                                        context: context,
                                        lable: 'Phone',
                                        prefix: Icons.phone,
                                        controller: phoneController,
                                        keybord: TextInputType.visiblePassword,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return 'Password is too short';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
              fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  )),
        );
      },
    );
  }
}
