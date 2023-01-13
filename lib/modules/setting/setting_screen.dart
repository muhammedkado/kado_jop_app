import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/layout/cubit/cubit.dart';
import 'package:kadojopapp/modules/login/login_screen.dart';
import 'package:kadojopapp/modules/setting/about/about_screen.dart';
import 'package:kadojopapp/modules/setting/contact/contact_screen.dart';
import 'package:kadojopapp/modules/setting/cubit/cubit.dart';
import 'package:kadojopapp/modules/setting/cubit/states.dart';
import 'package:kadojopapp/modules/setting/edit_profile/edit_profile_screen.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
import 'package:kadojopapp/shard/network/local/CachHelper.dart';
import 'package:kadojopapp/shard/styles/colors.dart';

class Setting_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit, SettingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var settingCubit = SettingCubit.get(context).userModel;
        return Scaffold(
          body: SingleChildScrollView(
              child: ConditionalBuilder(
                  condition: settingCubit !=null,
                  builder: (context) => Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Align(
                              child: CircleAvatar(
                                backgroundColor: defaultColor,
                                radius: 50,
                                child: Icon(
                                  Icons.person,
                                  size: 80,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              child: Text(
                                settingCubit!.name!,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 1,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  settingCubit.email!,
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    //color: Colors.grey
                                    fontSize: 14,
                                  ),
                                  maxLines: 1,
                                ),
                                const SizedBox(
                                  width: 8,
                                  child: Text('|'),
                                ),
                                Text(
                                  settingCubit.phone!,
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    //color: Colors.grey
                                    fontSize: 14,
                                  ),
                                  maxLines: 1,
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
                                color: Theme.of(context).colorScheme.primary,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 1,
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                  )
                                ],
                                borderRadius:
                                    BorderRadiusDirectional.circular(15),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    title: Text('Dark Mod',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    leading: Icon(
                                      HomeCubit.get(context).isDark == true
                                          ? Icons.dark_mode
                                          : Icons.dark_mode_outlined,
                                      color:
                                          HomeCubit.get(context).isDark == true
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .background,
                                    ),
                                    trailing: Switch(
                                      activeColor: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      activeTrackColor: Colors.green,
                                      value: HomeCubit.get(context).isDark,
                                      onChanged: (index) {
                                        HomeCubit.get(context)
                                            .changeAppMod(index: index);
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
                                color: Theme.of(context).colorScheme.primary,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 1,
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                  )
                                ],
                                borderRadius:
                                    BorderRadiusDirectional.circular(15),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    onTap: () {
                                      Navigatorto(
                                          context: context,
                                          Widget: EditProfile());
                                    },
                                    title: Text(
                                      'Edit Profile',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    leading: Icon(
                                      Icons.edit,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                                    // subtitle:const Text('Name, Email, Password, Phone'),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                                  ),
                                  //Divider(),
                                  ListTile(
                                    title: Text('Notification',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    leading: Icon(
                                      SettingCubit.get(context).isOff == true
                                          ? Icons.notifications_active
                                          : Icons.notifications,
                                      color: SettingCubit.get(context).isOff ==
                                              true
                                          ? Theme.of(context)
                                              .colorScheme
                                              .onPrimary
                                          : Theme.of(context)
                                              .colorScheme
                                              .background,
                                    ),
                                    trailing: Switch(
                                      activeColor: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      activeTrackColor: Colors.green,
                                      hoverColor: Colors.black,
                                      value:true,
                                      onChanged: (index) {
                                        CachHelper.saveData(
                                            key: 'Notification', value: index);
                                        SettingCubit.get(context)
                                            .changeNotification(index);
                                      },
                                    ),
                                  ),
                                  // Divider(),
                                  ListTile(
                                    onTap: () {},
                                    title: Text('Language',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    leading: const Icon(Icons.translate),
                                    trailing: DropdownButton(
                                      onChanged: (val) {
                                        CachHelper.saveData(
                                            key: 'language', value: val);
                                        SettingCubit.get(context)
                                            .languageDropdown(val);
                                      },
                                      hint: const Text('Language'),
                                      value:
                                          CachHelper.getData(key: 'language'),
                                      items: SettingCubit.get(context)
                                          .language
                                          .map((len) {
                                        return DropdownMenuItem(
                                          child: Text(len),
                                          value: len,
                                        );
                                      }).toList(),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              // padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 1,
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                  )
                                ],
                                borderRadius:
                                    BorderRadiusDirectional.circular(15),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    onTap: () {
                                      Navigatorto(
                                          context: context,
                                          Widget: ContactScreen());
                                    },
                                    title: Text('Contact & F.Q.A',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    leading: const Icon(Icons.send_rounded),
                                    // subtitle:const Text('Name, Email, Password, Phone'),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      Navigatorto(
                                          context: context,
                                          Widget: const AboutScreen());
                                    },
                                    title: Text('About',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    leading: const Icon(Icons.info),
                                    // subtitle:const Text('Name, Email, Password, Phone'),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ConditionalBuilder(
                              condition: state is! SignOutLoadingState,
                              builder: (context) => defaultButton(
                                colors: Colors.red,
                                text: const Text(
                                  'SignOut',
                                  style: TextStyle(color: Colors.white),
                                ),
                                function: () {
                                  SettingCubit.get(context).signOut(
                                      context: context, screen: Login());
                                },
                              ),
                              fallback: (context) => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                          ],
                        ),
                      ),
                  fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ))),
        );
      },
    );
  }
}
