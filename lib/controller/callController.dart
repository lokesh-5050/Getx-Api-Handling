import 'package:get/get.dart';
import 'package:prac2/models/Users.dart';
import 'package:prac2/services/api.dart';

class CallController extends GetxController {
  final Users = <UserModel>[].obs;

  ApiServices apiServices = ApiServices();

  Future<void> manageApiCall() async {
    List<UserModel> users = await apiServices.userApi();
    print("data is => $users");
    Users.value = users;
  }
}
