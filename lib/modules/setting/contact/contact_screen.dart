import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/modules/setting/contact/cubit/cubit.dart';
import 'package:kadojopapp/modules/setting/contact/cubit/states.dart';
import 'package:kadojopapp/modules/setting/cubit/cubit.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:kadojopapp/shard/styles/colors.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var subjectController = TextEditingController();
  var massgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ContactCubit(),
        child:
            BlocConsumer<ContactCubit, ContactState>(builder: (context, state) {
          var settingCubit = SettingCubit.get(context).userModel!;
          return Scaffold(
            appBar: AppBar(
              title: Text('Contact & F.Q.A'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ExpansionTile(
                          textColor: Theme.of(context).colorScheme.outline,
                          collapsedBackgroundColor: defaultColor,
                          iconColor: defaultColor,
                          collapsedIconColor: Colors.white,
                          collapsedTextColor: Colors.white,
                          childrenPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          backgroundColor: Colors.white10,
                          title: const Text(
                            'Who We Are',
                            style: TextStyle(fontWeight: FontWeight.bold
                                //color: Colors.black,
                                ),
                          ),
                          children: [
                            Text(
                              'We are a company that aims to provide jobs for people who want to provide them with additional income and help individuals develop their skills and professional backgrounds We also provide applicants with training to help them facilitate their work throughout their time working with us.',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 0.5,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                        ExpansionTile(
                          textColor: Theme.of(context).colorScheme.outline,
                          collapsedBackgroundColor: defaultColor,
                          iconColor: defaultColor,
                          collapsedIconColor: Colors.white,
                          collapsedTextColor: Colors.white,
                          childrenPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          backgroundColor: Colors.white10,
                          title: const Text(
                            'How We To Pay',
                            style: TextStyle(fontWeight: FontWeight.bold
                                //color: Colors.black,
                                ),
                            //color: Colors.black,
                          ),
                          children: [
                            Text(
                              'Payment is made by these currencies:\n'
                              ' - Usdt\n'
                              ' - Payoneer\n'
                              ' - Binance\n'
                              ' - Payeer\n'
                              ' - Bank transfer for people residing inside Turkey',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 0.5,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                        ExpansionTile(
                          textColor: Theme.of(context).colorScheme.outline,
                          collapsedBackgroundColor: defaultColor,
                          iconColor: defaultColor,
                          collapsedIconColor: Colors.white,
                          collapsedTextColor: Colors.white,
                          childrenPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          backgroundColor: Colors.white10,
                          title: const Text(
                            'What are the skills required to work with you?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          children: [
                            Text(
                                '- Proficiency in 90% of the language in which to work\n'
                                '- Time management and serious work\n'
                                '- Teamwork and speed at work\n',
                                style: Theme.of(context).textTheme.bodySmall)
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                      key: formKey,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          //mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Contact',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.outline,
                                fontSize: 25,
                              ),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            Text(
                              'If you have any problem contact us',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.outline,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            defoutformfield(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please write the Subject';
                                  }
                                  return null;
                                },
                                lebel: 'Subject',
                                maxLength: 20,
                                icon: const Icon(Icons.subject),
                                controller: subjectController,
                                keybord: TextInputType.text),
                            const SizedBox(
                              height: 3,
                            ),
                            TextFormField(
                              controller: massgController,
                              maxLength: 200,
                              maxLines: 6,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please writs the Massage ';
                                }
                              },
                              keyboardType: TextInputType.text,
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                filled: true,
                                labelText: "Message",
                                alignLabelWithHint: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            defoultButtun(
                              text: 'Sand Message',
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  ContactCubit.get(context).saveMessage(
                                    time: DateTime.now(),
                                    email: settingCubit.email!,
                                    name: settingCubit.name!,
                                    phone: settingCubit.phone!,
                                    message: massgController.text,
                                    subject: subjectController.text,
                                  );
                                }
                              },
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          );
        }, listener: (context, state) {
          if (state is MessageSaveSuccessesState) {
            ShowTost(msg: 'Message has been sent', state: TostState.SUCCESS);
          }
        }));
  }
}
