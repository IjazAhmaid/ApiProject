import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/reuseablewidget.dart';

import 'package:getapi/utlis/routes_name.dart';
import 'package:http/http.dart' as http;

class WithOutModels extends StatefulWidget {
  const WithOutModels({Key? key}) : super(key: key);

  @override
  State<WithOutModels> createState() => _WithOutModelsState();
}

class _WithOutModelsState extends State<WithOutModels> {
  // ignore: prefer_typing_uninitialized_variables
  var data;
  Future<void> getuserapiwthoutmodels() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Api  withoutmodels'),
            IconButton(
              icon: const Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.pushNamed(context, RouteName.signUp);
              },
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getuserapiwthoutmodels(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          ReuseableRow(
                              title: 'name',
                              value: data[index]['name'].toString()),
                          ReuseableRow(
                              title: 'username',
                              value: data[index]['username'].toString()),
                          ReuseableRow(
                              title: 'address',
                              value:
                                  data[index]['address']['street'].toString()),
                          ReuseableRow(
                              title: 'Geo',
                              value: data[index]['address']['geo']['lat']
                                  .toString()),
                        ],
                      ),
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
