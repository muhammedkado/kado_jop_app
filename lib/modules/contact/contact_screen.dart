import 'package:flutter/material.dart';

import '../../Model/shar.dart';
import '../../components/components.dart';

class Contact_Screen extends StatelessWidget {
  const Contact_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nameControlar = TextEditingController();

    var emailController = TextEditingController();

    var subjectController = TextEditingController();

    var massgController = TextEditingController();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          ExpansionTile(
            textColor: TextColors,
            collapsedBackgroundColor: TextColors,
            iconColor: TextColors,
            collapsedIconColor: Colors.white,
            collapsedTextColor: Colors.white,
            childrenPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                style: TextStyle(color: TextColors),
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
            textColor: TextColors,
            collapsedBackgroundColor: TextColors,
            iconColor: TextColors,
            collapsedIconColor: Colors.white,
            collapsedTextColor: Colors.white,
            childrenPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            backgroundColor: Colors.white10,
            title: const Text(
              'How We To Pay',
              style: TextStyle(fontWeight: FontWeight.bold
                  //color: Colors.black,
                  ),
            ),
            children: [
              Text(
                'Payment is made by these currencies:\n'
                ' - Usdt\n'
                ' - Payoneer\n'
                ' - Binance\n'
                ' - Payeer\n'
                ' - Bank transfer for people residing inside Turkey',
                style: TextStyle(color: TextColors),
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
            textColor: TextColors,
            collapsedBackgroundColor: TextColors,
            iconColor: TextColors,
            collapsedIconColor: Colors.white,
            collapsedTextColor: Colors.white,
            childrenPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                style: TextStyle(color: TextColors),
              )
            ],
          ),
          Form(
            key: formKey,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  spec,
                  Text(
                    'Contact',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: TextColors,
                        fontSize: 25),
                  ),
                  spec,
                  defoutformfield(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "FullName must not empty";
                      }
                      return null;
                    },
                    lebel: 'FullName',
                    keybord: TextInputType.text,
                    maxLength: 30,
                    icon: Icon(Icons.account_circle_rounded),
                    controller: nameControlar,
                  ),
                const  SizedBox(
                    height: 10,
                  ),
                  defoutformfield(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Email must not empty";
                        }
                        return null;
                      },
                      lebel: 'Email',
                      icon: const Icon(Icons.email),
                      maxLength: 30,
                      controller: emailController,
                      keybord: TextInputType.emailAddress),
                  SizedBox(
                    height: 10,
                  ),
                  defoutformfield(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Subject must not empty";
                        }
                        return null;
                      },
                      lebel: 'Subject',
                      maxLength: 20,
                      icon: const Icon(Icons.subject),
                      controller: subjectController,
                      keybord: TextInputType.text),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: massgController,
                      maxLength: 1000,
                      maxLines: 6,
                      keyboardType: TextInputType.text,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                          filled: true,
                          labelText: "Massage",
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)))),
                  const SizedBox(
                    height: 20,
                  ),
                  defoultButtun(
                    text: 'Sand Massage',
                    function: () {},
                  ),
                ]),
          )
        ],
      ),
    ));
  }
}
