import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  TextEditingController txtTransaction = new TextEditingController();
  Future<http.Response>? _future;



  Future<http.Response> AddTransaction(String transMoeName) {

    return http.post(
      Uri.parse('http://rawgymtest.gtgym.in/transactionmode/inserttransactionmode'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "transactionModeId":"0",
        "transactionModeName":transMoeName,
        "createdBy":"1"
      }),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: _future == null ? buildCol() : buildFutureBuilder()
        ),
      ),
    );
  }

  Column buildCol(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: txtTransaction,
          decoration: const InputDecoration(hintText: 'Enter Transaction'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _future = AddTransaction(txtTransaction.text);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }
  FutureBuilder<http.Response> buildFutureBuilder() {
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
