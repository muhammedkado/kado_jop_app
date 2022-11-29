import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/modules/login/login_screen.dart';
import 'package:kadojopapp/modules/setting/about/about_screen.dart';
import 'package:kadojopapp/modules/setting/contact/contact_screen.dart';
import 'package:kadojopapp/modules/setting/cubit/cubit.dart';
import 'package:kadojopapp/modules/setting/cubit/states.dart';
import 'package:kadojopapp/modules/setting/edit_profile/edit_profile_screen.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:kadojopapp/shard/styles/colors.dart';

class Setting_Screen extends StatelessWidget {
//  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit, SettingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    child: CircleAvatar(
                      backgroundColor: defaultColor,
                      radius: 50,
                      child: Icon(
                        Icons.person,
                        size: 80,color: Colors.white,
                      ),
                    ),
                  ),
                 const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    child: Text(
                      'Muhammed kado',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'mehmetkado9@gmail.com ',
                        style: TextStyle(
                          //color: Colors.grey
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                        child: Text('|'),
                      ),
                      Text(
                        '+905387399262',
                        style: TextStyle(
                          //color: Colors.grey
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    // padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: Colors.grey,
                        )
                      ],
                      borderRadius: BorderRadiusDirectional.circular(15),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text('Dark Mod'),
                          leading: Icon(
                            SettingCubit.get(context).isOff == true
                                ? Icons.dark_mode
                                : Icons.dark_mode_outlined,
                            color: SettingCubit.get(context).isOff == true
                                ? defaultColor
                                : Colors.grey,
                          ),
                          trailing: Switch(
                            activeColor: defaultColor,
                            activeTrackColor: Colors.green,
                            value: SettingCubit.get(context).isOff,
                            onChanged: (index) {
                              SettingCubit.get(context)
                                  .changeNotification(index);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    // padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: Colors.grey,
                        )
                      ],
                      borderRadius: BorderRadiusDirectional.circular(15),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          onTap: () {
                            Navigatorto(context: context, Widget: EditProfile());
                          },
                          title: const Text('Edit Profile'),
                          leading: const Icon(Icons.edit),
                          // subtitle:const Text('Name, Email, Password, Phone'),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: defaultColor,
                          ),
                        ),
                        //Divider(),
                        ListTile(
                          title: const Text('Notification'),
                          leading: Icon(
                            SettingCubit.get(context).isOff == true
                                ? Icons.notifications_active
                                : Icons.notifications,
                            color: SettingCubit.get(context).isOff == true
                                ? defaultColor
                                : Colors.grey,
                          ),
                          trailing: Switch(
                            activeColor: defaultColor,
                            activeTrackColor: Colors.green,
                            value: SettingCubit.get(context).isOff,
                            onChanged: (index) {
                              SettingCubit.get(context)
                                  .changeNotification(index);
                            },
                          ),
                        ),
                        // Divider(),
                        ListTile(
                          onTap: () {},
                          title: const Text('Language'),
                          leading: const Icon(Icons.translate),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: defaultColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    // padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: Colors.grey,
                        )
                      ],
                      borderRadius: BorderRadiusDirectional.circular(15),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          onTap: () {
                            Navigatorto(context: context, Widget: ContactScreen());
                          },
                          title: const Text('Contact & F.Q.A'),
                          leading: const Icon(Icons.send_rounded),
                          // subtitle:const Text('Name, Email, Password, Phone'),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: defaultColor,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigatorto(context: context, Widget:const AboutScreen());
                          },
                          title: const Text('About'),
                          leading: const Icon(Icons.info),
                          // subtitle:const Text('Name, Email, Password, Phone'),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: defaultColor,
                          ),
                        ),


                      ],
                    ),
                  ),

                  defaultButton(colors: Colors.red, text:const Text('LogOut',style: TextStyle(color: Colors.white)), function: (){
                    NavigatorAndFinish(context: context, Widget: Login());
                  })
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
