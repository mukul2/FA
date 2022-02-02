import 'package:flutter/material.dart';

import 'Streams.dart';
import 'Widgets.dart';

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




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppWidget().downloadData();

  }

  @override
  Widget build(BuildContext context) {




    return  DefaultTabController(
      length: 2,
      child: Scaffold(floatingActionButton: FloatingActionButton.extended(onPressed: (){  AppWidget(). downloadData();}, label: Text("Refresh")),
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
            AppWidget().getEmployeeIT(),
            AppWidget().getEmployeeHR(),


          ],
        ),
      ),
    );

  }
}

