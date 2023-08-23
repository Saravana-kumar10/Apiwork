import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Taskpage2.dart';
import 'model/ClientClass.dart';
class Tpageone extends StatefulWidget {
  const Tpageone({super.key});

  @override
  State<Tpageone> createState() => _TpageoneState();
}

class _TpageoneState extends State<Tpageone> {
  Future<List<EmployeeList>> getdetaails() async
  {
    var res= await http.get(Uri.parse("http://catodotest.elevadosoftwares.com/Employee/GetAllEmployeeDetails")) ;
    List data=jsonDecode(res.body)["employeeList"];
    return data.map((e) => EmployeeList.fromJson(e)).toList();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Employee Details"),

        actions: [ IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Tpagetwo())
          );
        }, icon: Icon(Icons.add)),],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child:
        Column(
          children: [
            FutureBuilder<List<EmployeeList>>(
                future: getdetaails(),
                builder: (BuildContext context,snapshot)
                {
                  if (snapshot.hasData) {
                    return Container(

                      height: 500,
                      width: 200,
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext Context ,int index) {

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (){
                                  showModalBottomSheet(context: context,
                                      backgroundColor: Colors.white70,
                                      shape:const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))) ,
                                      builder: (BuildContext context){
                                        return SafeArea(
                                          child: SingleChildScrollView(
                                            child: Container(
                                              height: 900,
                                              width: 300,
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    leading: Icon(Icons.person),
                                                    title: Text(snapshot.data![index].employeeName.toString()),
                                                    subtitle: Text(""),


                                                  ),
                                                  ListTile(
                                                    leading: Icon(Icons.person),
                                                    title: Text(snapshot.data![index].employeeId.toString()),
                                                    subtitle: Text(""),


                                                  ),
                                                  ListTile(
                                                    leading: Icon(Icons.person),
                                                    title: Text(snapshot.data![index].userName.toString()),
                                                    subtitle: Text(""),


                                                  ),
                                                  ListTile(
                                                    leading: Icon(Icons.person),
                                                    title: Text(snapshot.data![index].mobile.toString()),
                                                    subtitle: Text(""),


                                                  ),
                                                  ListTile(
                                                    leading: Icon(Icons.person),
                                                    title: Text(snapshot.data![index].password.toString()),
                                                    subtitle: Text(""),


                                                  ),
                                                  ListTile(
                                                    leading: Icon(Icons.person),
                                                    title: Text(snapshot.data![index].deviceId.toString()),
                                                    subtitle: Text(""),


                                                  ),






                                                ],
                                              ),                                    ),
                                          ),
                                        );

                                      });
                                },
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 2),
                                    borderRadius: BorderRadius.circular(50)
                                  ),

                                  contentPadding:EdgeInsets.all(5),

                                  title: Column(
                                    children: [
                                      Text(snapshot.data![index].employeeId.toString()),
                                      Text(snapshot.data![index].employeeName.toString()),


                                    ],
                                  ),
                                ),
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
      ),
    );

  }

}
