import 'dart:convert';

import 'package:apiwork/Details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:apiwork/model/Img.dart';
class LiImg extends StatefulWidget {
  const LiImg({super.key});

  @override
  State<LiImg> createState() => _LiImgState();
}

class _LiImgState extends State<LiImg> {
  Future<List<CheckImg>> Imgdetails() async{
    var res=await http.get(Uri.parse("https://fakestoreapi.com/products"));
List data=jsonDecode(res.body);
    
    return data.map((e) =>CheckImg.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Collections"),
        backgroundColor: Colors.greenAccent,
      ),
      body:   FutureBuilder<List<CheckImg>>(
    future: Imgdetails(),
    builder: (context,  snapshot) {
    if (snapshot.hasData) {

    return Container(

     height: double.infinity,
     width: double.infinity,
     child:  ListView.builder(
         itemCount: snapshot.data!.length,
         itemBuilder: (BuildContext Context ,int index) {

           return Row(
             children: [
               GestureDetector(
                 onTap:(){
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => DetailsPage(
                         snapshot.data![index].rating!.count.toString(),

                         snapshot.data![index].description.toString(),
                         snapshot.data![index].rating!.rate.toString(),
                         snapshot.data![index].price.toString(),
                       snapshot.data![index].image.toString(),

                     )),
                   );
                 },
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     height: 100,
                     width:80 ,
                     child: Image.network(snapshot.data![index].image.toString()),
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                   height:100,
                   width:260,
                   child: ListTile(
                     shape: RoundedRectangleBorder(
                       side: BorderSide(width: 2),
                       borderRadius: BorderRadius.circular(20),
                     ),
                     contentPadding:EdgeInsets.all(5),
                     title:Text(snapshot.data![index].category.toString()),

                     subtitle: Text(snapshot.data![index].title.toString()),
                     trailing: Text("\$ ${snapshot.data![index].price.toString()}"),




                   ),
                 ),
               )
             ],
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
    );
  }
}
