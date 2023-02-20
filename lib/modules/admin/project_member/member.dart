import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kadojopapp/modules/admin/cubit/cubit.dart';
import 'package:kadojopapp/modules/admin/cubit/states.dart';
import 'package:sizer/sizer.dart';

class Member extends StatelessWidget {
  final member ;

  Member(
    this.member, {
    Key? key,
  }) : super(key: key);
  var ref = FirebaseFirestore.instance
      .collection('MyProject').doc( '3AxjsxIjmXbO9Gc6ajc4').collection('members') ;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AdminCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('data'),
            centerTitle: true,
            actions: [
              Icon(Icons.person),
              Center(child: Text(': ${cubit.Member.length} ')),
             ],
          ),
          body: StreamBuilder(
            stream: ref.snapshots(),
            builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [

                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                                '${snapshot.data!.docs[index]['Username']}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${snapshot.data!.docs[index]['UserEmail']}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                    '${snapshot.data!.docs[index]['UserPhone']}',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                              ],
                            ),
                            leading: Text('ss'),
                            trailing: Container(
                              width: 20.w,
                              //color: Colors.grey,
                              child: IconButton(
                                onPressed: () {
                                  print(snapshot.data!.docs[index]['UserID']);
                                  cubit.deleteMember(mId:snapshot.data!.docs[index]['UserID'] );
                                },
                                icon: Icon(
                                  Icons.person_remove,
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 2.h,
                        ),
                        itemCount: snapshot.data!.docs.length,
                      ),
                    ],
                  ),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: LinearProgressIndicator(),
                );
              } else {
                return Center(
                  child: LinearProgressIndicator(),
                );
              }
            },
          ),
        );
      },
    );
  }
}
