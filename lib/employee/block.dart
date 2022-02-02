// event, state => new state => update UI.

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focalagent/api/services.dart';
import 'package:focalagent/employee/states.dart';

import 'events.dart';


class EmployeeBloc extends Bloc<EmployeeEvents, EmployeeState> {
  //
  final EmployeeRepo employeeRepo;
  List<dynamic> employe = [];

  EmployeeBloc({required this.employeeRepo}) : super(EmployeeInitState());

  @override
  Stream<EmployeeState> mapEventToState(EmployeeEvents event) async* {
    switch (event) {
      case EmployeeEvents.resetIT:
        yield EmployeeLoading();
        employe = await employeeRepo.resetIT();
        yield EmployeeLoaded(employe: employe);
        break;
      case EmployeeEvents.resetHR:
        yield EmployeeLoading();
        employe = await employeeRepo.resetHR();
        yield EmployeeLoaded(employe: employe);
        break;
      case EmployeeEvents.fetchEmployee:
        yield EmployeeLoading();
        try {
          employe = await employeeRepo.getEmployeeList();
          yield EmployeeLoaded(employe: employe);
        } on SocketException {
          // yield EmployeeListError(
          //   error: NoInternetException('No Internet'),
          // );
        } on HttpException {
          // yield EmployeeListError(
          //   error: NoServiceFoundException('No Service Found'),
          // );
        } on FormatException {
          // yield AlbumsListError(
          //   error: InvalidFormatException('Invalid Response format'),
          // );
        } catch (e) {
          // yield EmployeeListError(
          //   error: UnknownException('Unknown Error'),
          // );
        }
        break;

        case EmployeeEvents.fetchITEmployee:
        yield EmployeeLoading();
        try {
          employe = await employeeRepo.getITEmployeeList();
          yield EmployeeLoaded(employe: employe);
        } on SocketException {
          // yield EmployeeListError(
          //   error: NoInternetException('No Internet'),
          // );
        } on HttpException {
          // yield EmployeeListError(
          //   error: NoServiceFoundException('No Service Found'),
          // );
        } on FormatException {
          // yield AlbumsListError(
          //   error: InvalidFormatException('Invalid Response format'),
          // );
        } catch (e) {
          // yield EmployeeListError(
          //   error: UnknownException('Unknown Error'),
          // );
        }
        break;
      case EmployeeEvents.deleteEmployee:
        yield EmployeeLoading();
        employe = await employeeRepo.deleteItemHR(0);

        yield EmployeeLoaded(employe: employe);


        break;
        case EmployeeEvents.deleteEmployeeIT:
        yield EmployeeLoading();
        employe = await employeeRepo.deleteItemIT(0);

        yield EmployeeLoaded(employe: employe);


        break;
    }
  }
}