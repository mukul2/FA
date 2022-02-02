import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../employee/block.dart';
import '../employee/events.dart';


class ListRowHR extends StatelessWidget {
  //
  final dynamic employee;
  ListRowHR({this.employee});

  @override
  Widget build(BuildContext context) {
    return ListTile(leading: CircleAvatar(),subtitle: Text(employee["lastName"]),title:Text(employee["firstName"]) ,trailing: IconButton(onPressed: (){
      context.read<EmployeeBloc>().add(EmployeeEvents.deleteEmployee);
    },icon: Icon(Icons.delete),),);

  }
}

class ListRowIT extends StatelessWidget {
  //
  final dynamic employee;
  ListRowIT({this.employee});

  @override
  Widget build(BuildContext context) {
    return ListTile(leading: CircleAvatar(),subtitle: Text(employee["lastName"]),title:Text(employee["firstName"]) ,trailing: IconButton(onPressed: (){
      context.read<EmployeeBloc>().add(EmployeeEvents.deleteEmployeeIT);




    },icon: Icon(Icons.delete),),);

  }
}
