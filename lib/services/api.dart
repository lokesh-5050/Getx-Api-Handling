import 'package:dio/dio.dart';
import 'package:prac2/models/Users.dart';
import 'package:prac2/helpers/hanlde_request.dart';

class ApiServices {
  Dio dio = Dio();

  Future<List<UserModel>> userApi() async {
    List<dynamic>? data = await handleRequest(
        "GET", "https://jsonplaceholder.typicode.com/users", dio);
    print("data in controlelr => $data");
    return data!
        .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
