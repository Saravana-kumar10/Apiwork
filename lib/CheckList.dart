import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'model/CheckLi.dart';
class CheckApi extends StatefulWidget {
  const CheckApi({super.key});

  @override
  State<CheckApi> createState() => _CheckApiState();
}

class _CheckApiState extends State<CheckApi> {
  Future<List<Country>> CountryDetails()async
  {
    var res=await http.get(Uri.parse("https://api.nationalize.io?name=nathaniel"));
   List datas=jsonDecode(res.body)["country"];
   return datas.map((e) => Country.fromJson(e)).toList();
  }
  Future<CheckLis> Cdetails() async
  {
    var res= await http.get(Uri.parse("https://api.nationalize.io?name=nathaniel"));
    return CheckLis.fromJson(jsonDecode(res.body));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body:Column(
  children: [
        FutureBuilder<CheckLis>(
      future: Cdetails(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text(snapshot.data!.count.toString()),
              Text(snapshot.data!.name.toString()),


            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    ),
    Divider(),
    FutureBuilder<List<Country>>(
      future: CountryDetails(),
        builder: (BuildContext context,snapshot)
    {
      if (snapshot.hasData) {
        return Container(

          height: 500,
          child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext Context ,int index) {

                return ListTile(

                  contentPadding:EdgeInsets.all(5),

                  title: Column(
                    children: [
                      Text(snapshot.data![index].countryId.toString()),
                      Text(snapshot.data![index].probability.toString()),


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
    })
  ],
),
    );
  }
}
