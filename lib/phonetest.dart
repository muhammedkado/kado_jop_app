import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kadojopapp/shard/components/componentes.dart';



class PhoneNumberWithCode extends StatefulWidget {
  @override
  _PhoneNumberWithCodeState createState() => _PhoneNumberWithCodeState();
}

class _PhoneNumberWithCodeState extends State<PhoneNumberWithCode> {
  String textNumberPhone = '';
  String dialCodeInitial = '+966';
  String result = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());

        ///another solution
//      FocusScopeNode currentFocus = FocusScope.of(context);
//      if (!currentFocus.hasPrimaryFocus) {
//        currentFocus.unfocus();
//      }
      },
      child: MaterialApp(
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('booking salon app'),
            ),
            body: Container(
              padding: EdgeInsets.only(left: 8.0, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Center(
                    child: Text(
                      'Enter your phone number',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[


                    ],
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  defaultTextButton(
                    function: () {
                      setState(() {
                        result = dialCodeInitial + ' ' + textNumberPhone;
                      });
                    },
                    lable: Text(
                      'show',
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'your phone number is   $result ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
