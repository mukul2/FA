import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focalagent/Streams.dart';
List<dynamic> employeeHR = [];
List<dynamic> employeeIT = [];
class AppWidget{
  AppWidget();
  downloadData(){
    print("d triugger");
    employeeHR.clear();
    employeeIT.clear();

    employeeHR.add({"firstName":"Name 1","lastName":"last Name","id":1});
    employeeHR.add({"firstName":"Name 2","lastName":"last Name 2","id":2});
    employeeHR.add({"firstName":"Name 3","lastName":"last Name 3","id":3});
    employeeHR.add({"firstName":"Name 4","lastName":"last Name 4","id":4});

    print("d triugger" +employeeHR.length.toString());



    employeeIT.add({"firstName":"Name 5","lastName":"last Name 5","id":5});
    employeeIT.add({"firstName":"Name 6","lastName":"last Name 6","id":6});
    employeeIT.add({"firstName":"Name 7","lastName":"last Name 7","id":7});
    employeeIT.add({"firstName":"Name 8","lastName":"last Name 8","id":8});

    Future.delayed(Duration(seconds: 1)).then((value) =>  EmployeeHRStream.getInstance().reload(true));

    Future.delayed(Duration(seconds: 1)).then((value) =>  EmployeeITStream.getInstance().reload(true));



  }

  Widget getEmployeeIT (){
    return   StreamBuilder<bool>(

        stream:EmployeeITStream.getInstance().listen,
        builder: (c, snapsot) {
          if(snapsot.hasData){
            return employeeIT.length>0? ListView.builder(shrinkWrap: true,
              itemCount: employeeIT.length,
              itemBuilder: (context, index) {
                return ListTile(leading: CircleAvatar(),subtitle: Text(employeeIT[index]["lastName"]),trailing: IconButton(onPressed: (){
                  employeeIT.removeAt(index);
                  EmployeeITStream.getInstance().reload(true);

                },icon: Icon(Icons.delete),),
                  title: Text( employeeIT[index]["firstName"]),
                );
              },
            ):Center(child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("No Data"),
            ),);
          }else{
            Future.delayed(Duration(seconds: 1)).then((value) =>  EmployeeITStream.getInstance().reload(true) );

            return Scaffold(body: Center(child: CircularProgressIndicator(),),);
          }
        });
  }
  Widget getEmployeeHR (){
    return    StreamBuilder<bool>(

        stream:EmployeeHRStream.getInstance().listen,
        builder: (c, snapsot) {
          if(snapsot.hasData){
            return employeeHR.length>0? ListView.builder(shrinkWrap: true,
              itemCount: employeeHR.length,
              itemBuilder: (context, index) {
                return ListTile(leading: CircleAvatar(),subtitle: Text(employeeHR[index]["lastName"]),trailing: IconButton(onPressed: (){
                  employeeHR.removeAt(index);
                  EmployeeHRStream.getInstance().reload(true);

                },icon: Icon(Icons.delete),),
                  title: Text( employeeHR[index]["firstName"]),
                );
              },
            ):Center(child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("No Data"),
            ),);
          }else{
            Future.delayed(Duration(seconds: 1)).then((value) =>  EmployeeHRStream.getInstance().reload(true) );

            return Scaffold(body: Center(child: CircularProgressIndicator(),),);
          }
        });
  }
}