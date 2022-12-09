import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/Models/post_models.dart';

import 'package:getapi/utlis/routes_name.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModels> postlist = [];
  Future<List<PostModels>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postlist.add(PostModels.fromJson(i.cast()));
      }
      return postlist;
    } else {
      return postlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Home Api Integration'),
            IconButton(
              icon: const Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.pushNamed(context, RouteName.photoApi);
              },
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    postlist.clear();
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                        backgroundColor: Colors.amber,
                      ),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: postlist.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 3,
                                color: const Color.fromARGB(255, 25, 26, 25),
                              ),
                            ),
                            child: Card(
                              elevation: 0,
                              color:
                                  Theme.of(context).colorScheme.surfaceVariant,
                              child: SizedBox(
                                width: 500,
                                height: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Title \n' '${postlist[index].id}'),
                                    Text('Title \n' '${postlist[index].title}'),
                                    Text('Discription \n'
                                        '${postlist[index].body}')
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
