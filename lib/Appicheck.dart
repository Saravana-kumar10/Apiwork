import 'dart:convert';

import 'package:flutter/material.dart';
import'package:http/http.dart' as http;
import 'package:apiwork/model/Catclas.dart';
class Apicheck extends StatefulWidget {
  const Apicheck({super.key});

  @override
  State<Apicheck> createState() => _ApicheckState();
}

class _ApicheckState extends State<Apicheck> {
  Future<CatFact> Details() async{
    var res=await http.get(Uri.parse("https://catfact.ninja/fact"));
    return CatFact.fromJson(jsonDecode(res.body));
  }
  Future<CatFacttwo> Detailstwo() async{
    var rest=await http.get(Uri.parse("https://www.boredapi.com/api/activity"));
    return CatFacttwo.fromJson(jsonDecode(rest.body));
  }
  Future<Age> Agedetail() async{
    var resth=await http.get(Uri.parse("http://api.agify.io?name=meelad"));
    return Age.fromJson(jsonDecode(resth.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder<CatFact> (
            future: Details(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.fact.toString()),
                    Text(snapshot.data!.length.toString()),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
          Divider(height: 10,),
          FutureBuilder<CatFacttwo> (
            future: Detailstwo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.activity.toString()),
                    Text(snapshot.data!.type.toString()),
                    Text(snapshot.data!.participants.toString()),
                    Text(snapshot.data!.price.toString()),
                   Text(snapshot.data!.link.toString()),
                    Text(snapshot.data!.key.toString()),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error},hi');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
          Divider(height: 10,),
          FutureBuilder<Age> (
            future: Agedetail(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.name.toString()),
                    Text(snapshot.data!.age.toString()),
                    Text(snapshot.data!.count.toString()),

                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error},hi');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),

    );
  }
}
