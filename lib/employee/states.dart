import 'package:equatable/equatable.dart';

abstract class EmployeeState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmployeeInitState extends EmployeeState {}

class EmployeeLoading extends EmployeeState {}

class EmployeeLoaded extends EmployeeState {
  final List<dynamic> employe;
  EmployeeLoaded({required this.employe});
}

class EmployeeListError extends EmployeeState {
  final error;
  EmployeeListError({this.error});
}