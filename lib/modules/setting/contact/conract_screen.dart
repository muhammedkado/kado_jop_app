import 'package:flutter/material.dart';
import 'package:kadojopapp/Model/shar.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact & F.Q.A'),
      ),
      body: Column(
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
        ],
      ),
    );
  }
}
