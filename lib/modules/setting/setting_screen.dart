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
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

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
              condition: settingCubit != null,
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
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 20.w),
                      width: double.infinity,
                      height: 12.h,


                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            title:Text(
                              settingCubit.email!,
                              style:Theme.of(context).textTheme.bodySmall,
                              maxLines: 2,
                            ) ,
                        dense: true,
                            horizontalTitleGap: 1,
                            leading: Icon(Icons.email_outlined),
                          ),
                          ListTile(
                            title:Text(
                              settingCubit.phone!,
                              style:Theme.of(context).textTheme.bodySmall,
                              maxLines: 2,
                            ) ,
                            dense: true,minVerticalPadding: 2,
                            horizontalTitleGap: 1,
                            leading: Icon(Icons.phone_outlined),
                          ),
                         ],
                      ),
                    ),
                    Divider(),

                    Container(
                      margin: const EdgeInsets.all(10),
                      // padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            color: Theme.of(context).colorScheme.surface,
                          )
                        ],
                        borderRadius: BorderRadiusDirectional.circular(15),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            onTap: () {
                              Navigatorto(
                                  context: context, Widget: EditProfile());
                            },
                            title: Text(
                              'Edit Profile',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            leading: Icon(
                              Icons.edit,
                              color: Theme.of(context).colorScheme.background,
                            ),
                            // subtitle:const Text('Name, Email, Password, Phone'),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Theme.of(context).colorScheme.background,
                            ),
                          ),
                          Divider(),

                          // Divider(),
                          ListTile(
                            onTap: () {},
                            title: Text('Language',
                                style: Theme.of(context).textTheme.bodyMedium),
                            leading: const Icon(Icons.translate),
                            trailing: DropdownButton(
                              onChanged: (val) {
                                CachHelper.saveData(
                                    key: 'language', value: val);
                                SettingCubit.get(context).languageDropdown(val);
                              },
                              hint: Text(
                                'Language',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              value: CachHelper.getData(key: 'language'),
                              items:
                                  SettingCubit.get(context).language.map((len) {
                                return DropdownMenuItem(
                                  child: Text(
                                    len,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  value: len,
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                  //  Divider(),
                    Container(
                      margin: const EdgeInsets.all(10),
                      // padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            color: Theme.of(context).colorScheme.surface,
                          )
                        ],
                        borderRadius: BorderRadiusDirectional.circular(15),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text('Dark Mod',
                                style: Theme.of(context).textTheme.bodyMedium),
                            leading: Icon(
                              HomeCubit.get(context).isDark == true
                                  ? Icons.dark_mode
                                  : Icons.dark_mode_outlined,
                              color: HomeCubit.get(context).isDark == true
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.background,
                            ),
                            trailing: Switch(
                              activeColor:
                                  Theme.of(context).colorScheme.background,
                              activeTrackColor: Colors.green,
                              value: HomeCubit.get(context).isDark,
                              onChanged: (index) {
                                HomeCubit.get(context)
                                    .changeAppMod(index: index);
                              },
                            ),
                          ),
                          Divider(),
                          ListTile(
                            subtitle: Text(
                                'When this feature is turned off, you cannot receive notifications from this app',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(fontSize: 11)),
                            title: Text('Notification',
                                style: Theme.of(context).textTheme.bodyMedium),
                            leading: Icon(
                              SettingCubit.get(context).notification == true
                                  ? Icons.notifications_active
                                  : Icons.notifications,
                              color: SettingCubit.get(context).notification ==
                                      true
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.background,
                            ),
                            trailing: Switch(
                              activeColor:
                                  Theme.of(context).colorScheme.background,
                              activeTrackColor: Colors.green,
                              hoverColor: Colors.black,
                              value: SettingCubit.get(context).notification,
                              onChanged: (index) {
                                CachHelper.saveData(
                                    key: 'Notification', value: index);
                                SettingCubit.get(context)
                                    .changeNotification(index);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  //  Divider(),
                    Container(
                      margin: const EdgeInsets.all(10),
                      // padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            color: Theme.of(context).colorScheme.surface,
                          )
                        ],
                        borderRadius: BorderRadiusDirectional.circular(15),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            onTap: () {
                              Navigatorto(
                                  context: context, Widget: ContactScreen());
                            },
                            title: Text('Contact & F.Q.A',
                                style: Theme.of(context).textTheme.bodyMedium),
                            leading: const Icon(Icons.send_rounded),
                            // subtitle:const Text('Name, Email, Password, Phone'),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Theme.of(context).colorScheme.background,
                            ),
                          ),
                          Divider(),
                          ListTile(
                            onTap: () {
                              Navigatorto(
                                  context: context,
                                  Widget: const AboutScreen());
                            },
                            title: Text('About',
                                style: Theme.of(context).textTheme.bodyMedium),
                            leading: const Icon(Icons.info),
                            // subtitle:const Text('Name, Email, Password, Phone'),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Theme.of(context).colorScheme.background,
                            ),
                          ),
                        ],
                      ),
                    ),
                  //  Divider(),
                            Divider(),
                    ConditionalBuilder(
                      condition: state is! SignOutLoadingState,
                      builder: (context) => InkWell(
                        onTap: () {
                          SettingCubit.get(context)
                              .signOut(context: context, screen: Login());
                        },
                        child: ListTile(
                          leading: Icon(Icons.logout),
                          title: Text(
                            'Logout',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              ),
              fallback: (context) => SizedBox(
                  width: double.infinity,
                  height: 1000,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.white,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 50,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Container(
                              color: Colors.white,
                              height: 14,
                              width: MediaQuery.of(context).size.width * 0.20,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.white,
                                height: 14,
                                width: MediaQuery.of(context).size.width * 0.20,
                              ),
                              const SizedBox(
                                width: 8,
                                child: Text('|'),
                              ),
                              Container(
                                color: Colors.white,
                                height: 14,
                                width: MediaQuery.of(context).size.width * 0.20,
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
                              borderRadius:
                                  BorderRadiusDirectional.circular(15),
                            ),
                            child: Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height * 0.11,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            // padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius:
                                  BorderRadiusDirectional.circular(15),
                            ),
                            child: Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height * 0.11,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            // padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius:
                                  BorderRadiusDirectional.circular(15),
                            ),
                            child: Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height * 0.11,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            color: Colors.white,
                            child: Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
