import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Pstdata extends StatefulWidget {
  const Pstdata({super.key});

  @override
  State<Pstdata> createState() => _PstdataState();
}

class _PstdataState extends State<Pstdata> {
  TextEditingController txtTransaction = new TextEditingController();
  Future<http.Response>? _future;
  Future<http.Response> AddData( String value){
    return http.post(
      Uri.parse("http://rawgymtest.gtgym.in/transactionmode/inserttransactionmode"),
      headers: <String,String>{
        'Content-Type':'application/json',
      },
      body: jsonEncode(<String,String>{
        "transactionModeId":"0",
        "transactionModeName": value,
        "createdBy":"1"
    }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: _future==null ? entrdata(): resdata(),
      ),
    );

  }



  Column entrdata()
  { return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      TextField(
        controller: txtTransaction,
        decoration: const InputDecoration(hintText: 'Enter Transaction'),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            _future = AddData(txtTransaction.text);
          });
        },
        child: const Text('Create Data'),
      ),
    ],
  );

  }

  FutureBuilder<http.Response> resdata() {
    return FutureBuilder<http.Response>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.statusCode.toString() == "200" ? "Added successfully" : "Try again");
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );

}
}


////////////////////
/////////////////////
//////////////////////////////////////////////////////////
class demoTwo extends StatefulWidget {
  const demoTwo({super.key});

  @override
  State<demoTwo> createState() => _demoTwoState();
}

class _demoTwoState extends State<demoTwo> {
  TextEditingController txtTransaction = new TextEditingController();
  Future<http.Response>? _data;
  Future<http.Response> datapost(String value)
  {
    return http.post(
      Uri.parse("http://catodotest.elevadosoftwares.com/Category/InsertCategory"),
      headers: <String,String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String,String>{
        "categoryId": "0",
        "category": "Tax aaudit",
        "description": value,
        "deletedOn":" null",
        "removedRemarks": "null",
        "createdBy":" 0"
      })
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: _data==null ? entrdata(): resdata(),
      ),
    );
  }
  Column entrdata()
  { return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      TextField(
        controller: txtTransaction,
        decoration: const InputDecoration(hintText: 'Enter data'),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            _data = datapost(txtTransaction.text);
          });
        },
        child: const Text('Create Data'),
      ),
    ],
  );

  }

  FutureBuilder<http.Response> resdata() {
    return FutureBuilder<http.Response>(
      future: _data,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.statusCode.toString() == "200" ? "Added successfully" : "Try again");
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );

  }
}
