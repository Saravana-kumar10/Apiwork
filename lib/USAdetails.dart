import 'dart:convert';

import 'package:apiwork/model/DetailsUSA.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class UsaDetails extends StatefulWidget {
  const UsaDetails({super.key});

  @override
  State<UsaDetails> createState() => _UsaDetailsState();
}

class _UsaDetailsState extends State<UsaDetails> {
  Future<List<Datum>> Details() async
  {
    var res= await http.get(Uri.parse("https://datausa.io/api/data?drilldowns=Nation&measures=Population"));
    List data=jsonDecode(res.body)["data"];
    return data.map((e) => Datum.fromJson(e)).toList();
  }
  Future<List<Source>> SDetails() async
  {
    var res= await http.get(Uri.parse("https://datausa.io/api/data?drilldowns=Nation&measures=Population"));
    List data=jsonDecode(res.body)["source"];
    return data.map((e) => Source.fromJson(e)).toList();
  }
  Future<List<DetailsUsa>> UDetails() async
  {
    var res= await http.get(Uri.parse("https://datausa.io/api/data?drilldowns=Nation&measures=Population"));
    List data1=jsonDecode(res.body)["source"];
    print(data1);
    return data1.map((e) => DetailsUsa.fromJson(e)).toList();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UDetails();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder<List<DetailsUsa>>(
              future:UDetails(),
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
                                Text(snapshot.data![0].data![1].nation.toString()),


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
              }),
          Divider(),

          FutureBuilder<List<Source>>(
              future:SDetails(),
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
                                Text(snapshot.data![index].name.toString()),
                                Text(snapshot.data![index].measures.toString()),
                                Text(snapshot.data![index].annotations!.sourceName.toString()),
                                Text(snapshot.data![index].annotations!.tableId.toString()),


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
              }),





          // FutureBuilder<List<Datum>>(
          //     future: Details(),
          //     builder: (BuildContext context,snapshot)
          //     {
          //       if (snapshot.hasData) {
          //         return Container(
          //
          //           height: 500,
          //           child: ListView.builder(
          //               itemCount: snapshot.data!.length,
          //               itemBuilder: (BuildContext Context ,int index) {
          //
          //                 return ListTile(
          //
          //                   contentPadding:EdgeInsets.all(5),
          //
          //                   title: Column(
          //                     children: [
          //                       Text(snapshot.data![index].nation.toString()),
          //                       Text(snapshot.data![index].idNation.toString()),
          //                       Text(snapshot.data![index].year.toString()),
          //                       Text(snapshot.data![index].idNation.toString()),
          //
          //
          //                     ],
          //                   ),
          //                 );
          //
          //               }
          //           ),
          //         );
          //       }
          //
          //
          //       else if (snapshot.hasError) {
          //         return Text('${snapshot.error}');
          //       }
          //
          //       // By default, show a loading spinner.
          //       return const CircularProgressIndicator();
          //     }),
        ],
      )
    );
  }
}
