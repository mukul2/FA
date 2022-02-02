

abstract class EmployeeRepo {
  Future<List<dynamic>> getEmployeeList();
  Future<List<dynamic>> getITEmployeeList();
  Future<List<dynamic>> resetIT();
  Future<List<dynamic>> resetHR();
  Future<List<dynamic>> deleteItemHR(int pos);
  Future<List<dynamic>> deleteItemIT(int pos);
}
List<dynamic> employeeHR = [{"firstName":"Name 1","lastName":"last Name","id":1},
  {"firstName":"Name 2","lastName":"last Name 2","id":2},
  {"firstName":"Name 3","lastName":"last Name 3","id":3},
  {"firstName":"Name 4","lastName":"last Name 4","id":4}



];

List<dynamic> employeeIT = [{"firstName":"NameIT 1","lastName":"last Name","id":5},
  {"firstName":"NameIT 2","lastName":"last Name 2","id":6},
  {"firstName":"NameIT 3","lastName":"last Name 3","id":7},
  {"firstName":"NameIT 4","lastName":"last Name 4","id":8}



];
class EmployeeServices implements EmployeeRepo {
  //
  @override
  Future<List<dynamic>> getEmployeeList() async {

    //Uri uri = Uri.https(_baseUrl, _GET_ALBUMS);
    await Future.delayed(Duration(seconds: 1));




    return employeeHR;
  }

  @override
  Future<List<dynamic>> deleteItemHR(int pos) async{
    await Future.delayed( Duration(seconds: 1));
    employeeHR.removeAt(pos);
    return employeeHR;
  }
  @override
  Future<List<dynamic>> deleteItemIT(int pos) async{
    await Future.delayed( Duration(seconds: 1));
    employeeIT.removeAt(pos);
    return employeeIT;
  }


  @override
  Future<List<dynamic>> getITEmployeeList() async {
    await Future.delayed(Duration(seconds: 1));
    return employeeIT;
  }


  @override
  Future<List<dynamic>> resetHR() async {
    await Future.delayed(Duration(milliseconds: 100));


    employeeHR = [{"firstName":"Name 1","lastName":"last Name","id":1},
      {"firstName":"Name 2","lastName":"last Name 2","id":2},
      {"firstName":"Name 3","lastName":"last Name 3","id":3},
      {"firstName":"Name 4","lastName":"last Name 4","id":4}



    ];

    return employeeHR;
  }
  @override
  Future<List<dynamic>> resetIT() async {
    await Future.delayed(Duration(milliseconds: 100));
    employeeIT = [{"firstName":"NameIT 1","lastName":"last Name","id":5},
      {"firstName":"NameIT 2","lastName":"last Name 2","id":6},
      {"firstName":"NameIT 3","lastName":"last Name 3","id":7},
      {"firstName":"NameIT 4","lastName":"last Name 4","id":8}



    ];
    return employeeIT;
  }


}