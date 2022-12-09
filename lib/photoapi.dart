import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/Models/photo_models.dart';

import 'package:getapi/utlis/routes_name.dart';
import 'package:http/http.dart' as http;

class PhotoApi extends StatefulWidget {
  const PhotoApi({Key? key}) : super(key: key);

  @override
  State<PhotoApi> createState() => _PhotoApiState();
}

class _PhotoApiState extends State<PhotoApi> {
  List<PhotoModels> photoList = [];
  Future<List<PhotoModels>> getPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        photoList.add(PhotoModels.fromJson(i.cast()));
        /*  PhotoModels photo = PhotoModels(
            title: i['title'],
            url: i['url'],
            albumId: i['albumId'],
            thumbnailUrl: i['thumbnailUrl'],
            id: i['id']);
        photoList.add(photo); */
      }
      return photoList;
    } else {
      return photoList;
    }
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
                Navigator.pushNamed(context, RouteName.userApi);
              },
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotos(),
                builder: (context, AsyncSnapshot<List<PhotoModels>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.red,
                      backgroundColor: Colors.amber,
                    ));
                  } else {
                    return ListView.builder(
                      itemCount: photoList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshot.data![index].url.toString())),
                          subtitle:
                              Text(snapshot.data![index].title.toString()),
                          title: Text(snapshot.data![index].id.toString()),
                        );
                      },
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
