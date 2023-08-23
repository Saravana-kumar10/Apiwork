import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'model/Listcls.dart';
class ApiList extends StatefulWidget {
  const ApiList({super.key});

  @override
  State<ApiList> createState() => _ApiListState();
}

class _ApiListState extends State<ApiList> {

  Future<List<Entries>> Lidetails()async{
    var dataa= await http.get(Uri.parse("https://api.publicapis.org/entries"));
 var data=jsonDecode(dataa.body)["entries"];
 return (data as List).map((e) => Entries.fromJson(e)).toList();
  }

  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      body: PageView(
        children:[
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
            children: [
              FutureBuilder<List<Entries>> (
                future: Lidetails(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(

                    height: 500,
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext Context ,int index) {

                            return ListTile(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              contentPadding:EdgeInsets.all(5),
                              leading: Text(snapshot.data![index].aPI.toString()),
                              title: Column(
                                children: [
                                  Text(snapshot.data![index].link.toString()),
                                  Text(snapshot.data![index].category.toString()),
                                  Text(snapshot.data![index].description.toString()),
                                  Text(snapshot.data![index].auth.toString()),


                                ],
                              ),
                            );

                          }
                      ),
                    );
                  }


                  else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),

            ],
        ),
          ),
        ]
      ),

    );
  }
}
