import 'package:flutter/material.dart';

import 'Streams.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: EmployeesScreen(),
    );
  }
}
class EmployeesScreen extends StatefulWidget {
   EmployeesScreen() ;


  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  List<dynamic> employeeHR = [];
  List<dynamic> employeeIT = [];
  downloadData(){
    employeeHR.clear();
    employeeIT.clear();

    employeeHR.add({"firstName":"Name 1","lastName":"last Name","id":1});
    employeeHR.add({"firstName":"Name 2","lastName":"last Name 2","id":2});
    employeeHR.add({"firstName":"Name 3","lastName":"last Name 3","id":3});
    employeeHR.add({"firstName":"Name 4","lastName":"last Name 4","id":4});



    Future.delayed(Duration(seconds: 1)).then((value) =>  EmployeeHRStream.getInstance().reload(true));


    employeeIT.add({"firstName":"Name 5","lastName":"last Name 5","id":5});
    employeeIT.add({"firstName":"Name 6","lastName":"last Name 6","id":6});
    employeeIT.add({"firstName":"Name 7","lastName":"last Name 7","id":7});
    employeeIT.add({"firstName":"Name 8","lastName":"last Name 8","id":8});
    Future.delayed(Duration(seconds: 1)).then((value) =>  EmployeeITStream.getInstance().reload(true));



  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    downloadData();

  }

  @override
  Widget build(BuildContext context) {




    return  DefaultTabController(
      length: 2,
      child: Scaffold(floatingActionButton: FloatingActionButton.extended(onPressed: (){  downloadData();}, label: Text("Refresh")),
        appBar: AppBar(

          bottom: const TabBar(
            tabs: [
              Tab(text: "IT",),
              Tab(text: "HR",),

            ],
          ),
          title: const Text('Employee List'),
        ),
        body:  TabBarView(
          children: [
          StreamBuilder<bool>(

          stream:EmployeeITStream.getInstance().listen,
           builder: (c, snapsot) {
            if(snapsot.hasData){
              return employeeIT.length>0? ListView.builder(shrinkWrap: true,
                itemCount: employeeIT.length,
                itemBuilder: (context, index) {
                  return ListTile(leading: CircleAvatar(),subtitle: Text(employeeHR[index]["lastName"]),trailing: IconButton(onPressed: (){
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
           }),
            StreamBuilder<bool>(

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
                }),

          ],
        ),
      ),
    );

  }
}

