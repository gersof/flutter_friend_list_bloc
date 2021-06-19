import 'package:flutter/material.dart';

import 'bloc/friends_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final myfriendsBloc = new FriendsBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Welcome to my friend List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: StreamBuilder(stream: myfriendsBloc.myfriendsCounter, builder: (BuildContext context, AsyncSnapshot<int> sn){
                return Text('My friends are in total #${sn.data}');
              }, ),
            ),
            body: StreamBuilder(
                stream: FriendsBloc().getFriends,
                builder: (_, AsyncSnapshot<List<String>> sn) {
                  final mfr = sn.data ?? [];
                  return ListView.builder(
                      itemCount: mfr.length,
                      itemBuilder: (_, i) {
                        return ListTile(title: Text(mfr[i]));
                      });
                })));
  }
}
