import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/modules/admin/cubit/cubit.dart';
import 'package:kadojopapp/modules/admin/cubit/states.dart';
import 'package:sizer/sizer.dart';

class ContactMessagesScreen extends StatelessWidget {
  ContactMessagesScreen({Key? key}) : super(key: key);
  var ref = FirebaseFirestore.instance
      .collection('contact')
      .orderBy("time", descending: true);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AdminCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Contact  Messages'),
          ),
          body: ConditionalBuilder(
            condition: state is! GetMessagesLoadingState,
            builder: (context) => SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StreamBuilder(
                      stream: ref.snapshots(),
                      builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Container(
                              width: double.infinity,
                              height: 20.h,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 1.2,
                                    spreadRadius: 0.5,
                                  )
                                ],
                              ),
                              child: ListTile(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: [
                                            Text(
                                              '${snapshot.data!.docs[index]['massage']}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                              maxLines: 6,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                title: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${snapshot.data!.docs[index]['subject']}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                      maxLines: 1,
                                    ),
                                    Spacer(),
                                    Text(
                                      '${AdminCubit.formattedDate(snapshot.data!.docs[index]['time'])}',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${snapshot.data!.docs[index]['massage']}',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                      maxLines: 2,
                                    ),
                                    Text(
                                      'Name: ${snapshot.data!.docs[index]['name']}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                          ),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      'Email: ${snapshot.data!.docs[index]['email']}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                          ),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      'Phone: ${snapshot.data!.docs[index]['phone']}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                          ),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    cubit.deleteMessage(mId: snapshot.data!.docs[index]['mId']);

                                  },
                                  icon: Icon(
                                    Icons.delete,
                                  ),
                                ),

                                //  horizontalTitleGap: 10,
                              ),
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 1.h,
                            ),
                            itemCount: snapshot.data!.docs.length,
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: LinearProgressIndicator(),
                          );
                        }
                        else {
                          return Center(
                            child: LinearProgressIndicator(),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
            fallback: (context) => LinearProgressIndicator(
                color: Theme.of(context).colorScheme.primary),
          ),
        );
      },
    );
  }
}
