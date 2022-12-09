import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/Models/user_models.dart';
import 'package:getapi/reuseablewidget.dart';
import 'package:getapi/utlis/routes_name.dart';

import 'package:http/http.dart' as http;

class UserApi extends StatefulWidget {
  const UserApi({Key? key}) : super(key: key);

  @override
  State<UserApi> createState() => _UserApiState();
}

class _UserApiState extends State<UserApi> {
  List<UsersModels> userlist = [];
  Future<List<UsersModels>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        userlist.add(UsersModels.fromJson(i.cast()));
      }
    } else {
      return userlist;
    }
    return userlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Photo Api Integration'),
            IconButton(
              icon: const Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.pushNamed(context, RouteName.withOutModels);
              },
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getUserApi(),
            builder: (context, AsyncSnapshot<List<UsersModels>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: userlist.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(children: [
                        ReuseableRow(
                            title: 'Name',
                            value: snapshot.data![index].name.toString()),
                        ReuseableRow(
                            title: 'username',
                            value: snapshot.data![index].username.toString()),
                        ReuseableRow(
                            title: 'Email',
                            value: snapshot.data![index].email.toString()),
                        ReuseableRow(
                            title: 'City',
                            value:
                                snapshot.data![index].address!.city.toString()),
                        ReuseableRow(
                            title: 'Geo',
                            value: snapshot.data![index].address!.geo!.lat
                                .toString()),
                      ]),
                    );
                  },
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
