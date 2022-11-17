import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:kadojopapp/layout/cubit/cubit.dart';
import 'package:kadojopapp/layout/cubit/states.dart';
import 'package:kadojopapp/shard/components/componentes.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var brithDayController = TextEditingController();
  var countryController = TextEditingController();

  String? chooseCountry = '';

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, index) {},
      builder: (context, index) {
        var userModel = HomeCubit.get(context).userModel;
        nameController.text = userModel!.name!;
        emailController.text = userModel.email!;
        phoneController.text = userModel.phone!;

        brithDayController.text = userModel.brithDay!;
        chooseCountry = userModel.country!;

        return Scaffold(
          appBar: AppBar(
            elevation: 0.3,
            actions: [
              defaultTextButton(function: () {}, lable: const Text('Update'))
            ],
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                            lable: 'User Name',
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'user name is not be Empty';
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
                                return 'Email Address is not be Empty';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                            prefix: Icons.lock_outline,
                            isPassword: HomeCubit.get(context).isPassword,
                            suffix: HomeCubit.get(context).suffix,
                            controller: passwordController,
                            keybord: TextInputType.visiblePassword,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Password is to short';
                              }
                              return null;
                            },
                            lable: 'Password',
                            suffixPressed: () {
                              HomeCubit.get(context).changePasswordVisibility();
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          //  width: 300,
                          padding: const EdgeInsets.only(left: 10),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Stack(
                            children: [
                              InternationalPhoneNumberInput(
                                //maxLength: 1,

                             //   initialValue: PhoneNumber(dialCode: '+90',phoneNumber: '053877',isoCode: '+90'),
                                textAlign: TextAlign.start,
                                selectorConfig: const SelectorConfig(

                                  leadingPadding: 5,
                                  trailingSpace: true,
                                  setSelectorButtonAsPrefixIcon: true,
                                  showFlags: true,
                                  useEmoji: true,
                                  selectorType:
                                      PhoneInputSelectorType.BOTTOM_SHEET,
                                ),
                                onInputChanged: (value) {},
                                textFieldController: phoneController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password is to short';
                                  }
                                  return null;
                                },
                                inputDecoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(10),
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
                                    brithDayController.text =
                                        DateFormat.yMd().format(value!);
                                  });
                                },
                                controller: brithDayController,
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
                                    HomeCubit.get(context).genderDropdown(val);
                                  },
                                  value: HomeCubit.get(context).gender,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 6,
                                spreadRadius: 0.5)
                          ]),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: CountryListPick(
                              initialSelection: chooseCountry='Turkey',
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
                                  print('this is in sead $chooseCountry');
                                } else {
                                  print('error =>>>> code.dialCode = null');
                                }
                              },
                            ),
                          ),
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
