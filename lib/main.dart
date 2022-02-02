import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focalagent/screens/screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focalagent/api/services.dart';
import 'package:focalagent/employee/states.dart';

import 'Streams.dart';
import 'Widgets.dart';
import 'api/services.dart';
import 'employee/block.dart';
import 'employee/events.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AppAscreen(),
    );
  }
}




class AppAscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //AppWidget().downloadData();
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(

          bottom: const TabBar(
            tabs: [

              Tab(text: "HR",),
              Tab(text: "IT",),

            ],
          ),
          title: const Text('Employee List'),
        ),
        body:  TabBarView(
          children: [

            BlocProvider(
              create: (context) => EmployeeBloc(employeeRepo: EmployeeServices()),
              child: HREmployeScreen(),
            ), BlocProvider(
              create: (context) => EmployeeBloc(employeeRepo: EmployeeServices()),
              child: ITEmployeScreen(),
            ),


          ],
        ),
      ),
    );
  }
}






