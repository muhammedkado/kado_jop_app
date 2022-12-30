import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kadojopapp/layout/home_layout.dart';
import 'package:kadojopapp/modules/join_project/cubit/cubit.dart';
import 'package:kadojopapp/modules/join_project/cubit/states.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:kadojopapp/shard/styles/colors.dart';
import 'package:readmore/readmore.dart';
// ignore: must_be_immutable
class Info extends StatelessWidget {
  Info({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var brithDayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = JoinProjectCubit.get(context);
    List<Step> getSteps() => [
          Step(
            state:
                cubit.CurrentStep >= 0 ? StepState.complete : StepState.indexed,
            isActive: cubit.CurrentStep >= 0,
            title: const Text('Account'),
            content: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        defaultFormField(
                            isClickable: false,
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
                            isClickable: false,
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
                          isClickable: false,
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
                          isClickable: false,
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
                  defaultButton(
                    colors: Colors.transparent,
                    text: const Text(
                      'Do you want edite your information click here',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    function: () {
                      /*Navigatorto(
                        context: context,
                        Widget: null,


                      ); */
                    },
                  )
                ],
              ),
            ),
          ),
          Step(
            state:
                cubit.CurrentStep >= 1 ? StepState.complete : StepState.indexed,
            isActive: cubit.CurrentStep >= 1,
            title: const Text('terms'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!cubit.isActiv!)
                  const Text(
                    'You cannot continue if you do not agree to the terms',
                    style: TextStyle(color: Colors.red, fontSize: 10),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: defaultColor,
                      value: JoinProjectCubit.get(context).isActiv,
                      onChanged: (value) {
                        JoinProjectCubit.get(context).checkBox(value);
                      },
                    ),
                    Text(
                      'I agree to the terms of this project',
                      style: TextStyle(
                        color: JoinProjectCubit.get(context).isActiv == false
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReadMoreText(
                        '${cubit.projectModel!.terms1}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        trimLines: 6,
                        trimMode: TrimMode.Line,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
                if (!cubit.isActiv2!)
                  const Text(
                    'You cannot continue if you do not agree to the terms',
                    style: TextStyle(color: Colors.red, fontSize: 10),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: defaultColor,
                      value: JoinProjectCubit.get(context).isActiv2,
                      onChanged: (value) {
                        JoinProjectCubit.get(context).checkBox2(value);
                      },
                    ),
                    Text(
                      'I agree to the terms of this project',
                      style: TextStyle(
                        color: JoinProjectCubit.get(context).isActiv2 == false
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReadMoreText(
                        '${cubit.projectModel!.terms2}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        trimLines: 6,
                        trimMode: TrimMode.Line,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Step(
            state:
                cubit.CurrentStep >= 2 ? StepState.complete : StepState.indexed,
            isActive: cubit.CurrentStep >= 2,
            title: const Text('confirm'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: Text('${cubit.userModel!.name!}'),
                  leading: Icon(Icons.person_outline),
                ),
                ListTile(
                  title: Text('${cubit.userModel!.email!}'),
                  leading: Icon(Icons.email_outlined),
                ),
                ListTile(
                  title: Text(cubit.userModel!.phone!),
                  leading: const Icon(Icons.phone),
                ),
                ListTile(
                  title: Text(cubit.userModel!.brithDay!),
                  leading: const Icon(Icons.cake),
                ),
                ListTile(
                  title: Text('${cubit.projectModel!.name}'),
                  leading: const Icon(Icons.article_outlined),
                ),
                const ListTile(
                  title: Text('Term 1'),
                  leading: const Icon(Icons.check_box_outlined),
                ),
                const ListTile(
                  title: Text('Term 2'),
                  leading: Icon(Icons.check_box_outlined),
                ),
              ],
            ),
          ),
        ];
    return BlocConsumer<JoinProjectCubit, JoinProjectStates>(
      listener: (context, state) {},
      builder: (context, state) {
        nameController.text = cubit.userModel!.name!;
        emailController.text = cubit.userModel!.email!;
        phoneController.text = cubit.userModel!.phone!;
        brithDayController.text = cubit.userModel!.brithDay!;
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('CONFIRM NAD APPlY'),
              centerTitle: true,
            ),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: RefreshIndicator(
                onRefresh: () async {
                  cubit.getUserData();
                },
                child: ConditionalBuilder(
                  condition: state is! GetUserInfoLoadingState,
                  builder: (context) => Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: defaultColor,
                      ),
                    ),
                    child: Stepper(
                      //physics: BouncingScrollPhysics(),
                      onStepTapped: (value) {
                        cubit.onTapen(value);
                      },
                      elevation: 0.0,
                      steps: getSteps(),
                      type: StepperType.horizontal,
                      currentStep: cubit.CurrentStep,
                      onStepContinue: () {
                        final isLastStep =
                            cubit.CurrentStep == getSteps().length - 1;
                        if (isLastStep) {
                          ShowTost(
                              msg: 'Apply Successfully',
                              state: TostState.SUCCESS);
                          NavigatorAndFinish(
                              context: context, Widget: Home_layout());
                          cubit.CurrentStep = 0;
                        } else {
                          cubit.nextCurrentStep();
                        }
                      },
                      onStepCancel: cubit.CurrentStep == 0
                          ? null
                          : () {
                              cubit.backCurrentStep();
                            },
                      controlsBuilder: (context, detiles) {
                        final isLastStep =
                            cubit.CurrentStep == getSteps().length - 1;
                        var terms = JoinProjectCubit.get(context).isActiv;
                        var terms2 = JoinProjectCubit.get(context).isActiv2;
                        return Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: detiles.onStepCancel,
                                child: const Text('Back'),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            if (cubit.CurrentStep != 1 || terms! && terms2!)
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: detiles.onStepContinue,
                                  child: Text(isLastStep ? 'CONFiRM' : 'NEXT'),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
