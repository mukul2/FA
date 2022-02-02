import 'dart:async';

class EmployeeHRStream{
  static EmployeeHRStream model =EmployeeHRStream();
  final StreamController<bool> _Controller = StreamController<bool>.broadcast();

  Stream<bool> get listen => _Controller.stream;

  Sink<bool> get inData => _Controller.sink;

  reload(bool v) {
    fetch().then((value) => inData.add(v));
  }

  void dispose() {
    _Controller.close();
  }

  static EmployeeHRStream getInstance() {
    if (model == null) {
      model = new EmployeeHRStream();
      return model;
    } else {
      return model;
    }
  }

  Future<void> fetch() async {
    return;
  }
}



class EmployeeITStream{
  static EmployeeITStream model =EmployeeITStream();
  final StreamController<bool> _Controller = StreamController<bool>.broadcast();

  Stream<bool> get listen => _Controller.stream;

  Sink<bool> get inData => _Controller.sink;

  reload(bool v) {
    fetch().then((value) => inData.add(v));
  }

  void dispose() {
    _Controller.close();
  }

  static EmployeeITStream getInstance() {
    if (model == null) {
      model = new EmployeeITStream();
      return model;
    } else {
      return model;
    }
  }

  Future<void> fetch() async {
    return;
  }
}




