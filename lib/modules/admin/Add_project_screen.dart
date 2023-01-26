import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kadojopapp/modules/admin/cubit/cubit.dart';
import 'package:kadojopapp/modules/admin/cubit/states.dart';
import 'package:kadojopapp/shard/components/componentes.dart';
 
import 'package:sizer/sizer.dart';

class AddProjectScreen extends StatelessWidget {
  const AddProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var detailsController = TextEditingController();
    var validHoursController = TextEditingController();
    var durationHoursController = TextEditingController();
    var startTimeControlar = TextEditingController();
    var endTimeControlar = TextEditingController();
    return BlocProvider(
        create: (context) => AdminCubit(),
        child: BlocConsumer<AdminCubit, AdminState>(
          listener: (context, state) {},
          builder: (context, state) => Scaffold(
            appBar: AppBar(
              title: Text('Add Project'),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      size: 35,
                      color: Theme.of(context).colorScheme.onBackground,
                    )),
              ],
              centerTitle: true,
              elevation: 5.0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    defaultFormField(
                      lable: 'Name',
                      hintText: 'Add Project Name',
                      context: context,
                      controller: nameController,
                      keybord: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Email Address is Empty';
                        }
                      },
                      prefix: Icons.add_chart,
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    TextFormField(
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      controller: detailsController,
                      maxLines: 6,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Add Project Details ';
                        }
                      },
                      keyboardType: TextInputType.text,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        hintText: 'Add Project Details',
                        labelText: "Details",
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 20.w,
                            child: defaultFormField(
                              lable: 'V.Hours',
                              hintText: 'ex: 100',
                              context: context,
                              controller: validHoursController,
                              keybord: TextInputType.number,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Valid Hours is not be Empty';
                                }
                              },
                              prefix: Icons.access_time_outlined,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: Container(
                            width: 20.w,
                            child: defaultFormField(
                              lable: 'duration',
                              hintText: ' 2 month',
                              context: context,
                              controller: durationHoursController,
                              keybord: TextInputType.text,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Valid Hours is not be Empty';
                                }
                              },
                              prefix: Icons.hourglass_bottom_sharp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 20.w,
                            child: defaultFormField(
                                context: context,
                                lable: 'start Time',
                                ontap: () async {
                                  await showDatePicker(
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                            colorScheme: ColorScheme.light(
                                          primary: Colors.cyan,
                                          // <-- SEE HERE
                                          onPrimary: Colors.white,
                                          // <-- SEE HERE
                                          onSurface: Theme.of(context)
                                              .colorScheme
                                              .onBackground, // <-- SEE HERE
                                        )),
                                        child: child!,
                                      );
                                    },
                                    helpText: 'start Time',
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2023),
                                    lastDate: DateTime.now(),
                                  ).then((value) {
                                    // print(DateFormat.yMd().format(value!));
                                    startTimeControlar.text =
                                        DateFormat.yMd().format(value!);
                                  });
                                },
                                controller: startTimeControlar,
                                keybord: TextInputType.datetime,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'start Time is not be Empty';
                                  }
                                },
                                prefix: Icons.date_range,
                                hintText: 'start Time'),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: Container(
                            width: 20.w,
                            child: defaultFormField(
                                context: context,
                                lable: 'End Time',
                                ontap: () async {
                                  await showDatePicker(
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                            colorScheme: ColorScheme.light(
                                          primary: Colors.cyan,
                                          // <-- SEE HERE
                                          onPrimary: Colors.white,
                                          // <-- SEE HERE
                                          onSurface: Theme.of(context)
                                              .colorScheme
                                              .onBackground, // <-- SEE HERE
                                        )),
                                        child: child!,
                                      );
                                    },
                                    helpText: 'End Time',
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2040),
                                  ).then((value) {
                                    // print(DateFormat.yMd().format(value!));
                                    endTimeControlar.text =
                                        DateFormat.yMd().format(value!);
                                  });
                                },
                                controller: endTimeControlar,
                                keybord: TextInputType.datetime,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'End Time is not be Empty';
                                  }
                                },
                                prefix: Icons.date_range,
                                hintText: 'End Time'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 10.w,
                            height: 8.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        // disabledHint: Text('JOOP'),
                                        hint: Text(
                                          'job Role',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),

                                        items: [
                                          'Moderator',
                                          'QA',
                                          'Other',
                                        ]
                                            .map((e) => DropdownMenuItem(
                                                  child: Text(
                                                    e,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium,
                                                  ),
                                                  value: e,
                                                ))
                                            .toList(),
                                        onChanged: (val) {
                                          AdminCubit.get(context)
                                              .jobRolDropdown(val);
                                        },
                                        value: AdminCubit.get(context).jobRol,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: Container(
                            width: 10.w,
                            height: 8.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        // disabledHint: Text('JOOP'),
                                        hint: Text(
                                          'job Type',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),

                                        items: [
                                          'Full Time',
                                          'Part Time',
                                          'Not Selected',
                                        ]
                                            .map((e) => DropdownMenuItem(
                                                  child: Text(
                                                    e,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium,
                                                  ),
                                                  value: e,
                                                ))
                                            .toList(),
                                        onChanged: (val) {
                                          AdminCubit.get(context)
                                              .jobTypeDropdown(val);
                                        },
                                        value: AdminCubit.get(context).jobType,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    TextFormField(
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      controller: detailsController,
                      maxLines: 6,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Add Project Terms 1 ';
                        }
                      },
                      keyboardType: TextInputType.text,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        hintText: 'Add Project Terms 1',
                        labelText: "Terms 1",
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    TextFormField(
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      controller: detailsController,
                      maxLines: 6,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Add Project Terms 2 ';
                        }
                      },
                      keyboardType: TextInputType.text,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        hintText: 'Add Project Terms 2',
                        labelText: "Terms 2",
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Center(
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Theme.of(context).colorScheme.onSurface)),
                        onPressed: () {},
                        child: Text(
                          'Add project',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
