import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
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
  String? phoneControlar ;
  var brithDayControlar = TextEditingController();
  var countryControlar = TextEditingController();

  String chooseCountry = '+90';

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
            appBar: AppBar(),
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
                          Container(
                            //  width: 300,
                            padding: const EdgeInsets.only(left: 10),

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey)),
                            child: Stack(
                              children: [
                                InternationalPhoneNumberInput(
                                  //maxLength: 1,
                                  textAlign: TextAlign.start,
                                  selectorConfig: const SelectorConfig(
                                    leadingPadding: 5,
                                    trailingSpace: true,
                                    useEmoji: true,
                                    selectorType:
                                        PhoneInputSelectorType.BOTTOM_SHEET,
                                  ),
                                  onInputChanged: (PhoneNumber number) {
                                    phoneControlar=number.phoneNumber!;
                                  },
                                 // textFieldController: phoneControlar,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'phone number is not be empty ';
                                    }
                                    return null;
                                  },
                                  inputDecoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.all(15),
                                    filled: false,
                                    labelText: 'Phone number',
                                    hintStyle:
                                        TextStyle(color: Colors.grey.shade500),
                                  ),
                                ),
                                Positioned(
                                    top: 8,
                                    left: 90,
                                    bottom: 8,
                                    child: Container(
                                      width: 1,
                                      height: 30,
                                      color: Colors.black.withOpacity(0.13),
                                    ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 180,
                                height: 60,
                                child: defaultFormField(
                                  lable: 'BrithDay',
                                  ontap: () async {
                                    await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now(),
                                    ).then((value) {
                                      // print(DateFormat.yMd().format(value!));
                                      brithDayControlar.text =
                                          DateFormat.yMd().format(value!);
                                    });
                                  },
                                  controller: brithDayControlar,
                                  keybord: TextInputType.datetime,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'BrithDay is not be Empty';
                                    }
                                  },
                                  prefix: Icons.date_range,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 180,
                                height: 60,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    hint: const Text(
                                      'Gender',
                                    ),
                                    icon: const Visibility(
                                        visible: false,
                                        child: Icon(Icons.arrow_downward)),
                                    items: ['MALE', 'FEMALE']
                                        .map((e) => DropdownMenuItem(
                                              child: Text('$e'),
                                              value: e,
                                            ))
                                        .toList(),
                                    onChanged: (val) {
                                      RegisterCubit.get(context)
                                          .genderDropdown(val);
                                    },
                                    value: RegisterCubit.get(context).gender,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 6,
                                        spreadRadius: 0.5)
                                  ]),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 15),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Nationality:',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        const SizedBox(
                                          width: 25,
                                        ),
                                        CountryListPick(
                                          initialSelection: chooseCountry,
                                          theme: CountryTheme(
                                              labelColor: Colors.black,
                                              showEnglishName: true,
                                              alphabetTextColor: Colors.black,
                                              isShowCode: false),

                                          // to initial code number countrey

                                          // to get feedback data from picker
                                          onChanged: (code) {
                                            if (code!.dialCode != null) {
                                              chooseCountry = code.name!;
                                              print(
                                                  'this is in sead $chooseCountry');
                                            } else {
                                              print(
                                                  'error =>>>> code.dialCode = null');
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ConditionalBuilder(
                            condition: state is! RegisterLoadingState,
                            builder: (context) => defaultButton(
                              colors: defaultColor,
                              text: const Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  RegisterCubit.get(context).userRegister(
                                    gender: RegisterCubit.get(context)
                                        .gender
                                        .toString(),
                                    brithDay: brithDayControlar.text,
                                    email: emailControlar.text,
                                    name: nameControlar.text,
                                    phone: phoneControlar!,
                                    password: passwordControlar.text,
                                    country: chooseCountry,
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
