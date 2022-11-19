import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kadojopapp/layout/cubit/cubit.dart';
import 'package:kadojopapp/layout/cubit/states.dart';
import 'package:kadojopapp/shard/components/componentes.dart';

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
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = HomeCubit.get(context).userModel;
        var upadate = HomeCubit.get(context);
        nameController.text = userModel!.name!;
        emailController.text = userModel.email!;
        phoneController.text = userModel.phone!;
        brithDayController.text = userModel.brithDay!;
        chooseCountry = userModel.country!;

        return Scaffold(
          appBar: AppBar(
            elevation: 0.3,
            actions: [
              defaultTextButton(
                  function: () {
                    upadate.userUpdate(
                      email: emailController.text,
                      name: nameController.text,
                      phone: phoneController.text,
                      brithDay: brithDayController.text,
                    );
                  },
                  lable: const Text('Update'))
            ],
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if(state is UserUpdateLoadingState)
                    const LinearProgressIndicator(),
                  Container(
                    padding: const EdgeInsets.only(left: 15, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${userModel.name}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Email: ${userModel.email}',
                              style: const TextStyle(
                                //color: Colors.grey
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                              child: Text('|'),
                            ),
                            Text(
                              'Phone:${userModel.phone}',
                              style: const TextStyle(
                                //color: Colors.grey
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Nationality:${userModel.country}.',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'BrithDay: ${userModel.brithDay}.',
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    endIndent: 1,
                    height: 1,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        defaultFormField(
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

                        defaultFormField(
                          lable: 'BrithDay',
                          ontap: () async {
                            await showDatePicker(
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
