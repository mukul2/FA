import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focalagent/employee/block.dart';
import 'package:focalagent/employee/states.dart';

import '../employee/events.dart';
import '../widget/error.dart';
import '../widget/list_row.dart';


class HREmployeScreen extends StatefulWidget {
  @override
  _HREmployeScreenScreenState createState() => _HREmployeScreenScreenState();
}

class _HREmployeScreenScreenState extends State<HREmployeScreen> {
  //

  @override
  void initState() {
    super.initState();
    _load();
  }



  _load() async {
   // BlocProvider.of<EmployeeBloc>(context).add(EmployeeEvents.fetchEmployee);

    context.read<EmployeeBloc>().add(EmployeeEvents.fetchEmployee);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton.extended(onPressed: (){
      context.read<EmployeeBloc>().add(EmployeeEvents.resetHR);
     // context.read<EmployeeBloc>().add(EmployeeEvents.resetIT);

    }, label: Text("Reset")),

      body: Container(
        child: _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<EmployeeBloc, EmployeeState>(
            builder: (BuildContext context, EmployeeState state) {
              if (state is EmployeeListError) {
                final error = state.error;
                String message = '${error.message}\nTap to Retry.';
                return ErrorTxt(
                  message: message,
                  onTap: _load,
                );
              }
              if (state is EmployeeLoaded) {
                List<dynamic> employe = state.employe;
                return _list(employe);
              }
              return Container(height: 500,child: Center(child: CircularProgressIndicator()));
            }),
      ],
    );
  }

  Widget _list(List<dynamic> employee) {
    return Expanded(
      child: ListView.builder(
        itemCount: employee.length,
        itemBuilder: (_, index) {
          return ListRowHR(employee:  employee[index]);
        },
      ),
    );
  }
}



class ITEmployeScreen extends StatefulWidget {
  @override
  _ITEmployeScreenScreenState createState() => _ITEmployeScreenScreenState();
}

class _ITEmployeScreenScreenState extends State<ITEmployeScreen> {
  //

  @override
  void initState() {
    super.initState();
    _load();
  }



  _load() async {
    // BlocProvider.of<EmployeeBloc>(context).add(EmployeeEvents.fetchEmployee);


    context.read<EmployeeBloc>().add(EmployeeEvents.fetchITEmployee);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(onPressed: (){
           context.read<EmployeeBloc>().add(EmployeeEvents.resetIT);

        }, label: Text("Reset")),
      body: Container(
        child: _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<EmployeeBloc, EmployeeState>(
            builder: (BuildContext context, EmployeeState state) {
              if (state is EmployeeListError) {
                final error = state.error;
                String message = '${error.message}\nTap to Retry.';
                return ErrorTxt(
                  message: message,
                  onTap: _load,
                );
              }
              if (state is EmployeeLoaded) {
                List<dynamic> employe = state.employe;
                return _listIT(employe);
              }
              return Container(height: 500,child: Center(child: CircularProgressIndicator()));
            }),
      ],
    );
  }


  Widget _listIT(List<dynamic> employee) {
    return Expanded(
      child: ListView.builder(
        itemCount: employee.length,
        itemBuilder: (_, index) {
          return ListRowIT(employee: employee[index]);
        },
      ),
    );
  }
}
