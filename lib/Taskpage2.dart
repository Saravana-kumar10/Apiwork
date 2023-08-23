import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Tpagetwo extends StatefulWidget {
  const Tpagetwo({super.key});

  @override
  State<Tpagetwo> createState() => _TpagetwoState();
}

class _TpagetwoState extends State<Tpagetwo> {
  TextEditingController name = new TextEditingController();
  TextEditingController id = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController addres = new TextEditingController();
  TextEditingController email= new TextEditingController();
   Future<http.Response>? _postdata;
  Future<http.Response> adddata(String adName,adId,adPhn,adAddr,adEmail){
    return http.post(
      Uri.parse("http://catodotest.elevadosoftwares.com/Employee/InsertEmployee"),
      headers: <String,String>{
          'Content-Type':'application/json',
      },
      body: jsonEncode(<String,String>{
        "employeeId": adId,
        "employeeName": adName,
        "mobile": adPhn,
        "userName": "",
        "password": adAddr,
        "confirmPassword": "",
        "removedOn": "null",
        "removedRemarks": "null",
        "createdBy": "1",
        "deviceId": adEmail
      }),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,

        title: Text("Enter Details"),
      ),
      body:Container(
        alignment: Alignment.center,
        child: _postdata==null ? enterdata(): resdata(),
      ),

    );
  }


  Column enterdata()
  {
    return  Column(
      children: [

        TextFormField(
          controller: name,
          decoration: InputDecoration(
              hintText: "name"
          ),

        ),
        TextFormField(
          controller: id,
          decoration: InputDecoration(
              hintText: "id"
          ),

        ),
        TextFormField(
          controller: phone,
          decoration: InputDecoration(
              hintText: "phone"
          ),

        ),
        TextFormField(
          controller: addres,
          decoration: InputDecoration(
              hintText: "address"
          ),

        ),
        TextFormField(
          controller: email,
          decoration: InputDecoration(
              hintText: "email"
          ),

        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _postdata = adddata(name.text,id.text,phone.text,addres.text,email.text);
            });
          },
          child: const Text('Create Data'),
        ),



      ],
    );
  }




  FutureBuilder<http.Response> resdata() {
    return FutureBuilder<http.Response>(
      future: _postdata,
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


