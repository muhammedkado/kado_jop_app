import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/modules/join_project/cubit/cubit.dart';
import 'package:kadojopapp/modules/join_project/cubit/states.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:kadojopapp/shard/styles/colors.dart';

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
              children: [],
            ),
          ),
          Step(
            state:
                cubit.CurrentStep >= 2 ? StepState.complete : StepState.indexed,
            isActive: cubit.CurrentStep >= 2,
            title: Text('confirm'),
            content: Column(
              children: [],
            ),
          ),
        ];
    return BlocConsumer<JoinProjectCubit, JoinProjectStates>(
      listener: (Context, state) {},
      builder: (Context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title:const Text('CONFIRM NAD APPlY'),
              centerTitle: true,
            ),
            body: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: defaultColor,
                ),
              ),
              child: Stepper(
                physics: BouncingScrollPhysics(),
                onStepTapped: (value) {
                  cubit.onTapen(value);
                },
                elevation: 0.0,
                steps: getSteps(),
                type: StepperType.horizontal,
                currentStep: cubit.CurrentStep,
                onStepContinue: () {
                  final isLastStep = cubit.CurrentStep == getSteps().length - 1;
                  if (isLastStep) {
                    print('completed');
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
                  final isLastStep = cubit.CurrentStep == getSteps().length - 1;
                  return Container(
                    child: Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: detiles.onStepContinue,
                                child: Text(isLastStep ? 'CONFiRM' : 'NEXT'))),
                        const SizedBox(
                          width: 10,
                        ),
                        if (cubit.CurrentStep != 0)
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: detiles.onStepCancel,
                                  child: Text('Back'))),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
